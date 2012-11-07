*Geometry 1.1,GEN,room1_04 # tag version, format, zone name
*date # latest file modification
Zone description
# tag, X co-ord, Y co-ord, Z co-ord
*vertex,20.00000,8.50000,6.50000 #  1
*vertex,15.00000,8.50000,6.50000 #  2
*vertex,15.00000,0.00000,6.50000 #  3
*vertex,20.00000,0.00000,6.50000 #  4
*vertex,20.00000,8.50000,3.50000 #  5
*vertex,15.00000,8.50000,3.50000 #  6
*vertex,20.00000,0.00000,3.50000 #  7
*vertex,20.00000,1.00000,4.70000 #  8
*vertex,20.00000,1.00000,6.20000 #  9
*vertex,20.00000,7.50000,6.20000 #  10
*vertex,20.00000,7.50000,4.70000 #  11
*vertex,15.00000,0.00000,3.50000 #  12
*vertex,16.00000,0.00000,4.70000 #  13
*vertex,16.00000,0.00000,6.20000 #  14
*vertex,19.00000,0.00000,6.20000 #  15
*vertex,19.00000,0.00000,4.70000 #  16
#
# tag, number of vertices followed by list of associated vert
*edges,4,1,2,3,4  #  1
*edges,4,5,6,2,1  #  2
*edges,10,7,5,1,4,7,8,9,10,11,8  #  3
*edges,10,12,7,4,3,12,13,14,15,16,13  #  4
*edges,4,6,5,7,12  #  5
*edges,4,6,12,3,2  #  6
*edges,4,14,13,16,15  #  7
*edges,4,10,9,8,11  #  8
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
*surf,surface_8,VERT,surface_3,-,-,-,TRAN,UNKNOWN,00,00  #8
#
*insol,3,0,0,0,0 # default insolation distribution
#
# shading directives
*shad_calc,none # no temporal shading requested
#
*insol_calc,none # no insolation requested
#
*base_list,0,42.5,1
