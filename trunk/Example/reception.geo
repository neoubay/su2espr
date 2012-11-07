*Geometry 1.1,GEN,reception # tag version, format, zone name
*date # latest file modification
Zone description
# tag, X co-ord, Y co-ord, Z co-ord
*vertex,20.00000,20.00000,0.00000 #  1
*vertex,0.00000,20.00000,0.00000 #  2
*vertex,0.00000,20.00000,3.50000 #  3
*vertex,5.00000,20.00000,3.50000 #  4
*vertex,10.00000,20.00000,3.50000 #  5
*vertex,15.00000,20.00000,3.50000 #  6
*vertex,20.00000,20.00000,3.50000 #  7
*vertex,20.00000,0.00000,0.00000 #  8
*vertex,20.00000,11.50000,3.50000 #  9
*vertex,20.00000,8.50000,3.50000 #  10
*vertex,20.00000,0.00000,3.50000 #  11
*vertex,19.00000,0.00000,0.00000 #  12
*vertex,16.50000,0.00000,0.00000 #  13
*vertex,0.00000,0.00000,0.00000 #  14
*vertex,0.00000,0.00000,3.50000 #  15
*vertex,0.00000,8.50000,3.50000 #  16
*vertex,0.00000,11.50000,3.50000 #  17
*vertex,1.00000,0.00000,1.20000 #  18
*vertex,15.50000,0.00000,1.20000 #  19
*vertex,15.50000,0.00000,2.70000 #  20
*vertex,1.00000,0.00000,2.70000 #  21
*vertex,15.00000,11.50000,3.50000 #  22
*vertex,16.50000,0.00000,2.70000 #  23
*vertex,19.00000,0.00000,2.70000 #  24
*vertex,15.00000,0.00000,3.50000 #  25
*vertex,10.00000,0.00000,3.50000 #  26
*vertex,5.00000,0.00000,3.50000 #  27
*vertex,5.00000,8.50000,3.50000 #  28
*vertex,10.00000,8.50000,3.50000 #  29
*vertex,15.00000,8.50000,3.50000 #  30
*vertex,10.00000,11.50000,3.50000 #  31
*vertex,5.00000,11.50000,3.50000 #  32
#
# tag, number of vertices followed by list of associated vert
*edges,7,1,2,3,4,5,6,7  #  1
*edges,6,8,1,7,9,10,11  #  2
*edges,6,2,1,8,12,13,14  #  3
*edges,6,2,14,15,16,17,3  #  4
*edges,4,18,19,20,21  #  5
*edges,4,7,6,22,9  #  6
*edges,17,13,23,24,12,8,11,25,26,27,15,14,18,21,20,19,18,14  #  7
*edges,4,24,23,13,12  #  8
*edges,4,15,27,28,16  #  9
*edges,10,17,16,28,29,30,10,9,22,31,32  #  10
*edges,4,27,26,29,28  #  11
*edges,4,26,25,30,29  #  12
*edges,4,10,30,25,11  #  13
*edges,4,17,32,4,3  #  14
*edges,4,32,31,5,4  #  15
*edges,4,31,22,6,5  #  16
#
# surf attibutes:
# surf name, surf position VERT/CEIL/FLOR/SLOP/UNKN
# child of (surface name), useage (pair of tags)
# construction name, optical name
# boundary condition tag followed by two data items
*surf,surface_1,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #1
*surf,surface_2,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #2
*surf,surface_3,FLOR,-,-,-,-,OPAQUE,UNKNOWN,00,00  #3
*surf,surface_4,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #4
*surf,surface_5,VERT,surface_7,-,-,-,TRAN,UNKNOWN,00,00  #5
*surf,surface_6,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #6
*surf,surface_7,VERT,-,-,-,-,OPAQUE,UNKNOWN,00,00  #7
*surf,surface_8,VERT,surface_7,-,-,-,OPAQUE,UNKNOWN,00,00  #8
*surf,surface_9,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #9
*surf,surface_10,CEIL,-,-,-,-,OPAQUE,UNKNOWN,00,00  #10
*surf,surface_11,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #11
*surf,surface_12,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #12
*surf,surface_13,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #13
*surf,surface_14,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #14
*surf,surface_15,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #15
*surf,surface_16,CEIL,surface_10,-,-,-,OPAQUE,UNKNOWN,00,00  #16
#
*insol,3,0,0,0,0 # default insolation distribution
#
# shading directives
*shad_calc,none # no temporal shading requested
#
*insol_calc,none # no insolation requested
#
*base_list,0,400.0,1
