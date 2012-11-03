# Sketchup To ESP-r Geometry Exporter
#
#su2espr.rb

# Copyright 2012 Nestor Perez
#
# nestor.perezrguez at gmail.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'sketchup.rb'

# Sketchup.send_action "showRubyPanel:"

UI.menu("Plugins").add_item("ESP-R"){
	resultado=sku2espr
	UI.messagebox(resultado)
}

# Class definitions

class Zone
	def initialize()
		@name=''
		@faces=[]
		@pntlist=[]
	end

	attr_accessor :name, :faces, :pntlist
end

class Surface
	def initialize()
		@id=0
		@type=''
		@name=''
		@normal=[]
		@area=0.0
		@points=[]
		@material=[]
		@parent='-'
	end

	attr_accessor :id, :type,:name, :area, :normal, :points, :material, :parent
end

class Node
	def initialize()
		@id=0
		@x=0.0
		@y=0.0
		@z=0.0
	end

	attr_accessor :id,:x,:y,:z
end

class Material_loc
	def initialize()
		@name=''
		@alpha=''
	end

	attr_accessor :name, :alpha
end

# Function that exports geometry defined within Sketchup into ESP-r .geo format
def sku2espr

	model=Sketchup.active_model
	entities=model.entities
	
	zones=[]
	warning=""

	for group in entities

		if group.is_a?Sketchup::Group
		
			pnt_id=1
			sfc_id=1

			zone=Zone.new()
			zone.name=group.name
			points=[]
			for sk_face in group.entities
				if sk_face.is_a?Sketchup::Face
					face=Surface.new()
					face.area=sk_face.area*0.0254*0.0254	#Converts area into square meters
					face.normal=sk_face.normal
					face.type=set_type(face.normal)
					face.id=sfc_id
					face.name='surface_'+sfc_id.to_s
					sfc_id=sfc_id+1

					# Assigns a material to the face within Sketchup in case it has not been previously defined
					if sk_face.material==nil
						sk_face.material='red'
						warning="\nRed surfaces have been assigned a material"
					end

					face.material=Material_loc.new()
					face.material.name=sk_face.material.name

					# Defines the material transparency according to the material's alpha value
					if sk_face.material.alpha!=1
						face.material.alpha='TRAN'
					else
						face.material.alpha='OPAQUE'
					end

					for i in sk_face.vertices
						exists=0
						point=i.position

						# Transformation to global coordinates
						x_loc=point.x
						y_loc=point.y
						z_loc=point.z

						xaxe=group.transformation.xaxis
						yaxe=group.transformation.yaxis
						zaxe=group.transformation.zaxis

						point.x=group.transformation.origin.x+x_loc*xaxe.x+y_loc*yaxe.x+z_loc*zaxe.x
						point.y=group.transformation.origin.y+x_loc*xaxe.y+y_loc*yaxe.y+z_loc*zaxe.y
						point.z=group.transformation.origin.z+x_loc*xaxe.z+y_loc*yaxe.z+z_loc*zaxe.z
						#

						for j in 0...zone.pntlist.length
							if point.x==zone.pntlist[j][1] and point.y==zone.pntlist[j][2] and point.z==zone.pntlist[j][3]
								exists=1
								id2=zone.pntlist[j][0]
							end
						end

						if exists==0
							zone.pntlist.push([pnt_id,point.x,point.y,point.z])
							id2=pnt_id
							pnt_id=pnt_id+1
						end

						pnt=Node.new()
						pnt.id=id2
						pnt.x=point.x
						pnt.y=point.y
						pnt.z=point.z

						face.points.push(pnt)	
					end

					zone.faces.push(face)
				end
			end

			zones.push(zone)
		
		end
	end

	for zone in zones
		write_geo(zone)
	end

	# Return message
	if zones.length==0
		return "There are no valid zones to be exported"
	elsif zones.length==1
		return "1 zone exported"+warning
	else
		return zones.length.to_s+" zones exported"+warning
	end
end

# Function that writes .geo files
def write_geo(zone)
	geofile=File.new(zone.name+'.geo','w')

	geofile.puts('*Geometry 1.1,GEN,'+zone.name+' # tag version, format, zone name')
	geofile.puts('*date # latest file modification')
	geofile.puts('Zone description')

	write_vertex(geofile,zone.pntlist)

	write_edges(geofile,zone.faces)

	write_surfaces(geofile,zone.faces)

	write_insolation(geofile)

	write_baselist(geofile,zone.faces)
	
	geofile.close()
end

# Write vertices' coordinates
def write_vertex(outfile,pnts)
	outfile.puts('# tag, X co-ord, Y co-ord, Z co-ord')
	for i in pnts
		outfile.printf("*vertex,%.5f,%.5f,%.5f #  %1d\n",i[1].to_m,i[2].to_m,i[3].to_m,i[0])
#		outfile.printf("*vertex,%.5f,%.5f,%.5f #  %1d\n",i[1],i[2],i[3],i[0])
	end
	outfile.puts('#')
end

# Write zone's edges 
def write_edges(outfile,faces)
	outfile.puts('# tag, number of vertices followed by list of associated vert')
	for i in 0...faces.length
		nv=faces[i].points.length
		str=''
		for j in faces[i].points
			str=str+','+j.id.to_s
		end
		outfile.puts('*edges,'+nv.to_s+str+'  #  '+(i+1).to_s)
	end
	outfile.puts('#')
end

# Write zone's surfaces
def write_surfaces(outfile,faces)
	outfile.puts('# surf attibutes:')
	outfile.puts('# surf name, surf position VERT/CEIL/FLOR/SLOP/UNKN')
	outfile.puts('# child of (surface name), useage (pair of tags)')
	outfile.puts('# construction name, optical name')
	outfile.puts('# boundary condition tag followed by two data items')

	for i in 0...faces.length
		check_parent(i,faces)
		outfile.puts('*surf,'+faces[i].name+','+faces[i].type+','+faces[i].parent+',-,-,-,'+faces[i].material.alpha+',UNKNOWN,00,00  #'+(i+1).to_s)
	end
	outfile.puts('#')
end

# Write data related to the insolation calculation
def write_insolation(outfile)
	outfile.puts('*insol,3,0,0,0,0 # default insolation distribution')
	outfile.puts("#\n# shading directives")
	outfile.puts('*shad_calc,none # no temporal shading requested')
	outfile.puts("#\n*insol_calc,none # no insolation requested\n#")
end

# Write base_list line
def write_baselist(outfile,faces)
	area=0.0
	list=''
	num=0
	for i in faces
		if i.type=="FLOR"
			num=num+1
			list=list+i.id.to_s+','
			area=area+i.area
		end
	end

	if num==1
		outfile.puts('*base_list,0,'+area.to_s+',1')
	else
		outfile.puts('*base_list,'+num.to_s+','+list+area.to_s+' 0')
	end
end

# Set type of surface
def set_type(normal)
	if normal[2]==1
		type='CEIL'
	elsif normal[2]==-1
		type='FLOR'
	elsif normal[2]<=0.001 and normal[2]>=-0.001
		type='VERT'
	else
		type='SLOP'
	end
	return type
end

# Checks whether or not the surface has a parent
def check_parent(i,faces)
	for j in 0...faces.length
		if j!=i and faces[i].normal==faces[j].normal and faces[i].points.length<faces[j].points.length
			count=0
			
			for pnt1 in faces[i].points
				for pnt2 in faces[j].points
					if pnt1.id==pnt2.id
						count=count+1
					end
				end
			end
			
			if count<faces[j].points.length and count>0
				faces[i].parent=faces[j].name
			end
			
		end
	end
end
