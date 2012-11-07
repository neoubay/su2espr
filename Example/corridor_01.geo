*Geometry 1.1,GEN,corridor_01 # tag version, format, zone name
*date # latest file modification
Zone description
# tag, X co-ord, Y co-ord, Z co-ord
*vertex,0.00000,11.50000,3.50000 #  1
*vertex,0.00000,8.50000,3.50000 #  2
*vertex,-0.00000,8.50000,6.50000 #  3
*vertex,-0.00000,11.50000,6.50000 #  4
*vertex,20.00000,11.50000,3.50000 #  5
*vertex,15.00000,11.50000,3.50000 #  6
*vertex,15.00000,11.50000,6.50000 #  7
*vertex,20.00000,11.50000,6.50000 #  8
*vertex,5.00000,8.50000,3.50000 #  9
*vertex,5.00000,8.50000,6.50000 #  10
*vertex,5.00000,11.50000,3.50000 #  11
*vertex,10.00000,11.50000,3.50000 #  12
*vertex,20.00000,8.50000,3.50000 #  13
*vertex,15.00000,8.50000,3.50000 #  14
*vertex,10.00000,8.50000,3.50000 #  15
*vertex,10.00000,8.50000,6.50000 #  16
*vertex,15.00000,8.50000,6.50000 #  17
*vertex,20.00000,8.50000,6.50000 #  18
*vertex,10.00000,11.50000,6.50000 #  19
*vertex,5.00000,11.50000,6.50000 #  20
#
# tag, number of vertices followed by list of associated vert
*edges,4,1,2,3,4  #  1
*edges,4,5,6,7,8  #  2
*edges,4,2,9,10,3  #  3
*edges,10,2,1,11,12,6,5,13,14,15,9  #  4
*edges,10,4,3,10,16,17,18,8,7,19,20  #  5
*edges,4,13,5,8,18  #  6
*edges,4,9,15,16,10  #  7
*edges,4,15,14,17,16  #  8
*edges,4,18,17,14,13  #  9
*edges,4,4,20,11,1  #  10
*edges,4,20,19,12,11  #  11
*edges,4,19,7,6,12  #  12
#
# surf attibutes:
# surf name, surf position VERT/CEIL/FLOR/SLOP/UNKN
# child of (surface name), useage (pair of tags)
# construction name, optical name
# boundary condition tag followed by two data items
*surf,surface_1,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #1
*surf,surface_2,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #2
*surf,surface_3,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #3
*surf,surface_4,FLOR,-,-,-,-,OPAQUE,UNKNOWN,00,00  #4
*surf,surface_5,CEIL,-,-,-,-,OPAQUE,UNKNOWN,00,00  #5
*surf,surface_6,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #6
*surf,surface_7,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #7
*surf,surface_8,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #8
*surf,surface_9,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #9
*surf,surface_10,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #10
*surf,surface_11,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #11
*surf,surface_12,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #12
#
*insol,3,0,0,0,0 # default insolation distribution
#
# shading directives
*shad_calc,none # no temporal shading requested
#
*insol_calc,none # no insolation requested
#
*base_list,0,60.0,1
