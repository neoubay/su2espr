*Geometry 1.1,GEN,room2_07 # tag version, format, zone name
*date # latest file modification
Zone description
# tag, X co-ord, Y co-ord, Z co-ord
*vertex,15.00000,11.50000,12.50000 #  1
*vertex,10.00000,11.50000,12.50000 #  2
*vertex,10.00000,20.00000,12.50000 #  3
*vertex,15.00000,20.00000,12.50000 #  4
*vertex,15.00000,11.50000,9.50000 #  5
*vertex,10.00000,11.50000,9.50000 #  6
*vertex,15.00000,20.00000,9.50000 #  7
*vertex,10.00000,20.00000,9.50000 #  8
*vertex,11.00000,20.00000,10.70000 #  9
*vertex,11.00000,20.00000,12.20000 #  10
*vertex,14.00000,20.00000,12.20000 #  11
*vertex,14.00000,20.00000,10.70000 #  12
#
# tag, number of vertices followed by list of associated vert
*edges,4,1,2,3,4  #  1
*edges,4,5,6,2,1  #  2
*edges,4,7,5,1,4  #  3
*edges,10,8,7,4,3,8,9,10,11,12,9  #  4
*edges,4,6,5,7,8  #  5
*edges,4,6,8,3,2  #  6
*edges,4,10,9,12,11  #  7
#
# surf attibutes:
# surf name, surf position VERT/CEIL/FLOR/SLOP/UNKN
# child of (surface name), useage (pair of tags)
# construction name, optical name
# boundary condition tag followed by two data items
*surf,surface_1,CEIL,-,-,-,-,OPAQUE,UNKNOWN,00,00  #1
*surf,surface_2,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #2
*surf,surface_3,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #3
*surf,surface_4,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #4
*surf,surface_5,FLOR,-,-,-,-,OPAQUE,UNKNOWN,00,00  #5
*surf,surface_6,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #6
*surf,surface_7,VERT,surface_4,-,-,-,TRAN,UNKNOWN,00,00  #7
#
*insol,3,0,0,0,0 # default insolation distribution
#
# shading directives
*shad_calc,none # no temporal shading requested
#
*insol_calc,none # no insolation requested
#
*base_list,0,42.5,1
