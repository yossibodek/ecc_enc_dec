/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Mon Dec 27 20:46:15 2021
/////////////////////////////////////////////////////////////


module fsm_32 ( current_state, PSEL, PENABLE, clk, rst_n );
  output [1:0] current_state;
  input PSEL, PENABLE, clk, rst_n;

  wire   [1:0] next_state;

  DFFRHQX1 \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst_n), 
        .Q(current_state[1]) );
  DFFRHQX1 \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst_n), 
        .Q(current_state[0]) );
  NOR3BX1 U3 ( .AN(PSEL), .B(current_state[0]), .C(PENABLE), .Y(next_state[0])
         );
  NOR2BX1 U4 ( .AN(current_state[0]), .B(current_state[1]), .Y(next_state[1])
         );
endmodule


module APB_SLAVE_AMBA_WORD32_AMBA_ADDR_WIDTH20 ( clk, rst, PWRITE, PSEL, 
        PENABLE, PWRITE_OUT );
  input clk, rst, PWRITE, PSEL, PENABLE;
  output PWRITE_OUT;
  wire   PWRITE;
  assign PWRITE_OUT = PWRITE;

  fsm_32 state_machine ( .PSEL(PSEL), .PENABLE(PENABLE), .clk(clk), .rst_n(rst) );
endmodule


module AMBA_REG_0 ( DATA, clk, rst, EN, DATA_OUT );
  input [31:0] DATA;
  output [31:0] DATA_OUT;
  input clk, rst, EN;
  wire   n92, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n2, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n91;

  INVX1 U2 ( .A(n1), .Y(n34) );
  AOI22X1 U3 ( .A0(n71), .A1(DATA[0]), .B0(DATA_OUT[0]), .B1(n83), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(n35) );
  AOI22X1 U5 ( .A0(DATA[1]), .A1(n72), .B0(DATA_OUT[1]), .B1(n83), .Y(n3) );
  INVX1 U6 ( .A(n4), .Y(n36) );
  AOI22X1 U7 ( .A0(DATA[2]), .A1(n71), .B0(DATA_OUT[2]), .B1(n82), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n37) );
  AOI22X1 U9 ( .A0(DATA[3]), .A1(n72), .B0(DATA_OUT[3]), .B1(n82), .Y(n5) );
  INVX1 U10 ( .A(n6), .Y(n38) );
  AOI22X1 U11 ( .A0(DATA[4]), .A1(n71), .B0(DATA_OUT[4]), .B1(n82), .Y(n6) );
  INVX1 U12 ( .A(n7), .Y(n39) );
  AOI22X1 U13 ( .A0(DATA[5]), .A1(n72), .B0(DATA_OUT[5]), .B1(n81), .Y(n7) );
  INVX1 U14 ( .A(n8), .Y(n40) );
  AOI22X1 U15 ( .A0(DATA[6]), .A1(n71), .B0(DATA_OUT[6]), .B1(n81), .Y(n8) );
  INVX1 U16 ( .A(n9), .Y(n41) );
  AOI22X1 U17 ( .A0(DATA[7]), .A1(n72), .B0(DATA_OUT[7]), .B1(n81), .Y(n9) );
  INVX1 U18 ( .A(n10), .Y(n42) );
  AOI22X1 U19 ( .A0(DATA[8]), .A1(n72), .B0(DATA_OUT[8]), .B1(n80), .Y(n10) );
  INVX1 U20 ( .A(n11), .Y(n43) );
  AOI22X1 U21 ( .A0(DATA[9]), .A1(n72), .B0(DATA_OUT[9]), .B1(n80), .Y(n11) );
  INVX1 U22 ( .A(n12), .Y(n44) );
  AOI22X1 U23 ( .A0(DATA[10]), .A1(n72), .B0(DATA_OUT[10]), .B1(n80), .Y(n12)
         );
  INVX1 U24 ( .A(n13), .Y(n45) );
  AOI22X1 U25 ( .A0(DATA[11]), .A1(n72), .B0(DATA_OUT[11]), .B1(n79), .Y(n13)
         );
  INVX1 U26 ( .A(n14), .Y(n46) );
  AOI22X1 U27 ( .A0(DATA[12]), .A1(n72), .B0(DATA_OUT[12]), .B1(n79), .Y(n14)
         );
  INVX1 U28 ( .A(n15), .Y(n47) );
  AOI22X1 U29 ( .A0(DATA[13]), .A1(n72), .B0(DATA_OUT[13]), .B1(n79), .Y(n15)
         );
  INVX1 U30 ( .A(n16), .Y(n48) );
  AOI22X1 U31 ( .A0(DATA[14]), .A1(n72), .B0(DATA_OUT[14]), .B1(n78), .Y(n16)
         );
  INVX1 U32 ( .A(n17), .Y(n49) );
  AOI22X1 U33 ( .A0(DATA[15]), .A1(n72), .B0(DATA_OUT[15]), .B1(n78), .Y(n17)
         );
  INVX1 U34 ( .A(n18), .Y(n50) );
  AOI22X1 U35 ( .A0(DATA[16]), .A1(n72), .B0(DATA_OUT[16]), .B1(n78), .Y(n18)
         );
  INVX1 U36 ( .A(n19), .Y(n51) );
  AOI22X1 U37 ( .A0(DATA[17]), .A1(n72), .B0(DATA_OUT[17]), .B1(n77), .Y(n19)
         );
  INVX1 U38 ( .A(n20), .Y(n52) );
  AOI22X1 U39 ( .A0(DATA[18]), .A1(n72), .B0(DATA_OUT[18]), .B1(n77), .Y(n20)
         );
  INVX1 U40 ( .A(n21), .Y(n53) );
  AOI22X1 U41 ( .A0(DATA[19]), .A1(n72), .B0(DATA_OUT[19]), .B1(n77), .Y(n21)
         );
  INVX1 U42 ( .A(n22), .Y(n54) );
  AOI22X1 U43 ( .A0(DATA[20]), .A1(n71), .B0(DATA_OUT[20]), .B1(n76), .Y(n22)
         );
  INVX1 U44 ( .A(n23), .Y(n55) );
  AOI22X1 U45 ( .A0(DATA[21]), .A1(n71), .B0(DATA_OUT[21]), .B1(n76), .Y(n23)
         );
  INVX1 U46 ( .A(n24), .Y(n56) );
  AOI22X1 U47 ( .A0(DATA[22]), .A1(n71), .B0(DATA_OUT[22]), .B1(n76), .Y(n24)
         );
  INVX1 U48 ( .A(n25), .Y(n57) );
  AOI22X1 U49 ( .A0(DATA[23]), .A1(n71), .B0(DATA_OUT[23]), .B1(n75), .Y(n25)
         );
  INVX1 U50 ( .A(n26), .Y(n58) );
  AOI22X1 U51 ( .A0(DATA[24]), .A1(n71), .B0(DATA_OUT[24]), .B1(n75), .Y(n26)
         );
  INVX1 U52 ( .A(n27), .Y(n59) );
  AOI22X1 U53 ( .A0(DATA[25]), .A1(n71), .B0(DATA_OUT[25]), .B1(n75), .Y(n27)
         );
  INVX1 U54 ( .A(n28), .Y(n60) );
  AOI22X1 U55 ( .A0(DATA[26]), .A1(n71), .B0(DATA_OUT[26]), .B1(n74), .Y(n28)
         );
  INVX1 U56 ( .A(n29), .Y(n61) );
  AOI22X1 U57 ( .A0(DATA[27]), .A1(n71), .B0(DATA_OUT[27]), .B1(n74), .Y(n29)
         );
  INVX1 U58 ( .A(n30), .Y(n62) );
  AOI22X1 U59 ( .A0(DATA[28]), .A1(n71), .B0(DATA_OUT[28]), .B1(n74), .Y(n30)
         );
  INVX1 U60 ( .A(n31), .Y(n63) );
  AOI22X1 U61 ( .A0(DATA[29]), .A1(n71), .B0(DATA_OUT[29]), .B1(n73), .Y(n31)
         );
  INVX1 U62 ( .A(n32), .Y(n64) );
  AOI22X1 U63 ( .A0(DATA[30]), .A1(n71), .B0(DATA_OUT[30]), .B1(n73), .Y(n32)
         );
  INVX1 U64 ( .A(n33), .Y(n65) );
  AOI22X1 U65 ( .A0(DATA[31]), .A1(n71), .B0(DATA_OUT[31]), .B1(n73), .Y(n33)
         );
  DFFRHQX1 \DATA_OUT_reg[21]  ( .D(n55), .CK(clk), .RN(n67), .Q(DATA_OUT[21])
         );
  DFFRHQX1 \DATA_OUT_reg[31]  ( .D(n65), .CK(clk), .RN(n68), .Q(DATA_OUT[31])
         );
  DFFRHQX1 \DATA_OUT_reg[30]  ( .D(n64), .CK(clk), .RN(n68), .Q(DATA_OUT[30])
         );
  DFFRHQX1 \DATA_OUT_reg[29]  ( .D(n63), .CK(clk), .RN(n68), .Q(DATA_OUT[29])
         );
  DFFRHQX1 \DATA_OUT_reg[28]  ( .D(n62), .CK(clk), .RN(n68), .Q(DATA_OUT[28])
         );
  DFFRHQX1 \DATA_OUT_reg[27]  ( .D(n61), .CK(clk), .RN(n68), .Q(DATA_OUT[27])
         );
  DFFRHQX1 \DATA_OUT_reg[26]  ( .D(n60), .CK(clk), .RN(n68), .Q(DATA_OUT[26])
         );
  DFFRHQX1 \DATA_OUT_reg[25]  ( .D(n59), .CK(clk), .RN(n68), .Q(DATA_OUT[25])
         );
  DFFRHQX1 \DATA_OUT_reg[24]  ( .D(n58), .CK(clk), .RN(n68), .Q(DATA_OUT[24])
         );
  DFFRHQX1 \DATA_OUT_reg[23]  ( .D(n57), .CK(clk), .RN(n67), .Q(DATA_OUT[23])
         );
  DFFRHQX1 \DATA_OUT_reg[22]  ( .D(n56), .CK(clk), .RN(n67), .Q(DATA_OUT[22])
         );
  DFFRHQX1 \DATA_OUT_reg[20]  ( .D(n54), .CK(clk), .RN(n67), .Q(DATA_OUT[20])
         );
  DFFRHQX1 \DATA_OUT_reg[19]  ( .D(n53), .CK(clk), .RN(n67), .Q(DATA_OUT[19])
         );
  DFFRHQX1 \DATA_OUT_reg[18]  ( .D(n52), .CK(clk), .RN(n67), .Q(DATA_OUT[18])
         );
  DFFRHQX1 \DATA_OUT_reg[17]  ( .D(n51), .CK(clk), .RN(n67), .Q(DATA_OUT[17])
         );
  DFFRHQX1 \DATA_OUT_reg[16]  ( .D(n50), .CK(clk), .RN(n67), .Q(DATA_OUT[16])
         );
  DFFRHQX1 \DATA_OUT_reg[15]  ( .D(n49), .CK(clk), .RN(n67), .Q(DATA_OUT[15])
         );
  DFFRHQX1 \DATA_OUT_reg[14]  ( .D(n48), .CK(clk), .RN(n67), .Q(DATA_OUT[14])
         );
  DFFRHQX1 \DATA_OUT_reg[13]  ( .D(n47), .CK(clk), .RN(n67), .Q(DATA_OUT[13])
         );
  DFFRHQX1 \DATA_OUT_reg[12]  ( .D(n46), .CK(clk), .RN(n67), .Q(DATA_OUT[12])
         );
  DFFRHQX1 \DATA_OUT_reg[11]  ( .D(n45), .CK(clk), .RN(n66), .Q(DATA_OUT[11])
         );
  DFFRHQX1 \DATA_OUT_reg[10]  ( .D(n44), .CK(clk), .RN(n66), .Q(DATA_OUT[10])
         );
  DFFRHQX1 \DATA_OUT_reg[9]  ( .D(n43), .CK(clk), .RN(n66), .Q(DATA_OUT[9]) );
  DFFRHQX1 \DATA_OUT_reg[8]  ( .D(n42), .CK(clk), .RN(n66), .Q(DATA_OUT[8]) );
  DFFRHQX1 \DATA_OUT_reg[7]  ( .D(n41), .CK(clk), .RN(n66), .Q(DATA_OUT[7]) );
  DFFRHQX1 \DATA_OUT_reg[6]  ( .D(n40), .CK(clk), .RN(n66), .Q(DATA_OUT[6]) );
  DFFRHQX1 \DATA_OUT_reg[5]  ( .D(n39), .CK(clk), .RN(n66), .Q(DATA_OUT[5]) );
  DFFRHQX1 \DATA_OUT_reg[4]  ( .D(n38), .CK(clk), .RN(n66), .Q(DATA_OUT[4]) );
  DFFRHQX1 \DATA_OUT_reg[3]  ( .D(n37), .CK(clk), .RN(n66), .Q(DATA_OUT[3]) );
  DFFRHQX1 \DATA_OUT_reg[2]  ( .D(n36), .CK(clk), .RN(n66), .Q(DATA_OUT[2]) );
  DFFRHQX1 \DATA_OUT_reg[1]  ( .D(n35), .CK(clk), .RN(n66), .Q(DATA_OUT[1]) );
  DFFRHQX2 \DATA_OUT_reg[0]  ( .D(n34), .CK(clk), .RN(n66), .Q(n92) );
  INVX4 U66 ( .A(n92), .Y(n91) );
  INVX1 U67 ( .A(n69), .Y(n87) );
  INVX8 U68 ( .A(n91), .Y(DATA_OUT[0]) );
  INVXL U69 ( .A(n84), .Y(n83) );
  INVXL U70 ( .A(n69), .Y(n88) );
  INVXL U71 ( .A(n69), .Y(n89) );
  CLKINVX3 U72 ( .A(n87), .Y(n72) );
  CLKINVX3 U73 ( .A(n87), .Y(n71) );
  INVX1 U74 ( .A(n84), .Y(n82) );
  INVX1 U75 ( .A(n84), .Y(n81) );
  INVX1 U76 ( .A(n84), .Y(n80) );
  INVX1 U77 ( .A(n85), .Y(n79) );
  INVX1 U78 ( .A(n85), .Y(n78) );
  INVX1 U79 ( .A(n85), .Y(n77) );
  INVX1 U80 ( .A(n85), .Y(n76) );
  INVX1 U81 ( .A(n86), .Y(n75) );
  INVX1 U82 ( .A(n86), .Y(n74) );
  INVX1 U83 ( .A(n86), .Y(n73) );
  INVX1 U84 ( .A(n87), .Y(n86) );
  INVX1 U85 ( .A(n89), .Y(n84) );
  INVX1 U86 ( .A(n88), .Y(n85) );
  CLKINVX3 U87 ( .A(n2), .Y(n67) );
  CLKINVX3 U88 ( .A(n2), .Y(n68) );
  INVX1 U89 ( .A(n70), .Y(n69) );
  INVX1 U90 ( .A(EN), .Y(n70) );
  CLKINVX3 U91 ( .A(n2), .Y(n66) );
  INVX1 U92 ( .A(rst), .Y(n2) );
endmodule


module AMBA_REG_1 ( DATA, clk, rst, EN, DATA_OUT );
  input [31:0] DATA;
  output [31:0] DATA_OUT;
  input clk, rst, EN;
  wire   n2, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152;

  INVX1 U2 ( .A(n152), .Y(n120) );
  INVX1 U4 ( .A(n151), .Y(n119) );
  INVX1 U6 ( .A(n150), .Y(n118) );
  INVX1 U8 ( .A(n149), .Y(n117) );
  INVX1 U10 ( .A(n148), .Y(n116) );
  INVX1 U12 ( .A(n147), .Y(n115) );
  INVX1 U14 ( .A(n146), .Y(n114) );
  INVX1 U16 ( .A(n145), .Y(n113) );
  INVX1 U18 ( .A(n144), .Y(n112) );
  INVX1 U20 ( .A(n143), .Y(n111) );
  INVX1 U22 ( .A(n142), .Y(n110) );
  INVX1 U24 ( .A(n141), .Y(n109) );
  INVX1 U26 ( .A(n140), .Y(n108) );
  INVX1 U28 ( .A(n139), .Y(n107) );
  INVX1 U30 ( .A(n138), .Y(n106) );
  INVX1 U32 ( .A(n137), .Y(n105) );
  INVX1 U34 ( .A(n136), .Y(n104) );
  INVX1 U36 ( .A(n135), .Y(n103) );
  INVX1 U38 ( .A(n134), .Y(n102) );
  INVX1 U40 ( .A(n133), .Y(n101) );
  INVX1 U42 ( .A(n132), .Y(n100) );
  INVX1 U44 ( .A(n131), .Y(n99) );
  INVX1 U46 ( .A(n130), .Y(n98) );
  INVX1 U48 ( .A(n129), .Y(n97) );
  INVX1 U50 ( .A(n128), .Y(n96) );
  INVX1 U52 ( .A(n127), .Y(n95) );
  INVX1 U54 ( .A(n126), .Y(n94) );
  INVX1 U56 ( .A(n125), .Y(n93) );
  INVX1 U58 ( .A(n124), .Y(n92) );
  INVX1 U60 ( .A(n123), .Y(n91) );
  INVX1 U62 ( .A(n122), .Y(n90) );
  INVX1 U64 ( .A(n121), .Y(n89) );
  DFFRHQX1 \DATA_OUT_reg[5]  ( .D(n115), .CK(clk), .RN(n66), .Q(DATA_OUT[5])
         );
  DFFRHQX1 \DATA_OUT_reg[0]  ( .D(n120), .CK(clk), .RN(n66), .Q(DATA_OUT[0])
         );
  DFFRHQX1 \DATA_OUT_reg[1]  ( .D(n119), .CK(clk), .RN(n66), .Q(DATA_OUT[1])
         );
  DFFRHQX1 \DATA_OUT_reg[3]  ( .D(n117), .CK(clk), .RN(n66), .Q(DATA_OUT[3])
         );
  DFFRHQX1 \DATA_OUT_reg[2]  ( .D(n118), .CK(clk), .RN(n66), .Q(DATA_OUT[2])
         );
  DFFRHQX1 \DATA_OUT_reg[4]  ( .D(n116), .CK(clk), .RN(n66), .Q(DATA_OUT[4])
         );
  DFFRHQX1 \DATA_OUT_reg[24]  ( .D(n96), .CK(clk), .RN(n68), .Q(DATA_OUT[24])
         );
  DFFRHQX1 \DATA_OUT_reg[21]  ( .D(n99), .CK(clk), .RN(n67), .Q(DATA_OUT[21])
         );
  DFFRHQX1 \DATA_OUT_reg[17]  ( .D(n103), .CK(clk), .RN(n67), .Q(DATA_OUT[17])
         );
  DFFRHQX1 \DATA_OUT_reg[13]  ( .D(n107), .CK(clk), .RN(n67), .Q(DATA_OUT[13])
         );
  DFFRHQX1 \DATA_OUT_reg[12]  ( .D(n108), .CK(clk), .RN(n67), .Q(DATA_OUT[12])
         );
  DFFRHQX1 \DATA_OUT_reg[18]  ( .D(n102), .CK(clk), .RN(n67), .Q(DATA_OUT[18])
         );
  DFFRHQX1 \DATA_OUT_reg[9]  ( .D(n111), .CK(clk), .RN(n66), .Q(DATA_OUT[9])
         );
  DFFRHQX1 \DATA_OUT_reg[25]  ( .D(n95), .CK(clk), .RN(n68), .Q(DATA_OUT[25])
         );
  DFFRHQX1 \DATA_OUT_reg[11]  ( .D(n109), .CK(clk), .RN(n66), .Q(DATA_OUT[11])
         );
  DFFRHQX1 \DATA_OUT_reg[10]  ( .D(n110), .CK(clk), .RN(n66), .Q(DATA_OUT[10])
         );
  DFFRHQX1 \DATA_OUT_reg[8]  ( .D(n112), .CK(clk), .RN(n66), .Q(DATA_OUT[8])
         );
  DFFRHQX1 \DATA_OUT_reg[19]  ( .D(n101), .CK(clk), .RN(n67), .Q(DATA_OUT[19])
         );
  DFFRHQX1 \DATA_OUT_reg[16]  ( .D(n104), .CK(clk), .RN(n67), .Q(DATA_OUT[16])
         );
  DFFRHQX1 \DATA_OUT_reg[20]  ( .D(n100), .CK(clk), .RN(n67), .Q(DATA_OUT[20])
         );
  DFFRHQX1 \DATA_OUT_reg[15]  ( .D(n105), .CK(clk), .RN(n67), .Q(DATA_OUT[15])
         );
  DFFRHQX1 \DATA_OUT_reg[14]  ( .D(n106), .CK(clk), .RN(n67), .Q(DATA_OUT[14])
         );
  DFFRHQX1 \DATA_OUT_reg[28]  ( .D(n92), .CK(clk), .RN(n68), .Q(DATA_OUT[28])
         );
  DFFRHQX1 \DATA_OUT_reg[23]  ( .D(n97), .CK(clk), .RN(n67), .Q(DATA_OUT[23])
         );
  DFFRHQX1 \DATA_OUT_reg[22]  ( .D(n98), .CK(clk), .RN(n67), .Q(DATA_OUT[22])
         );
  DFFRHQX1 \DATA_OUT_reg[31]  ( .D(n89), .CK(clk), .RN(n68), .Q(DATA_OUT[31])
         );
  DFFRHQX1 \DATA_OUT_reg[30]  ( .D(n90), .CK(clk), .RN(n68), .Q(DATA_OUT[30])
         );
  DFFRHQX1 \DATA_OUT_reg[27]  ( .D(n93), .CK(clk), .RN(n68), .Q(DATA_OUT[27])
         );
  DFFRHQX1 \DATA_OUT_reg[29]  ( .D(n91), .CK(clk), .RN(n68), .Q(DATA_OUT[29])
         );
  DFFRHQX1 \DATA_OUT_reg[26]  ( .D(n94), .CK(clk), .RN(n68), .Q(DATA_OUT[26])
         );
  DFFRHQX1 \DATA_OUT_reg[7]  ( .D(n113), .CK(clk), .RN(n66), .Q(DATA_OUT[7])
         );
  DFFRHQX1 \DATA_OUT_reg[6]  ( .D(n114), .CK(clk), .RN(n66), .Q(DATA_OUT[6])
         );
  INVX1 U3 ( .A(n69), .Y(n86) );
  INVXL U5 ( .A(n69), .Y(n88) );
  INVXL U7 ( .A(n69), .Y(n87) );
  AOI22XL U9 ( .A0(DATA[8]), .A1(n72), .B0(DATA_OUT[8]), .B1(n80), .Y(n144) );
  AOI22XL U11 ( .A0(DATA[10]), .A1(n72), .B0(DATA_OUT[10]), .B1(n80), .Y(n142)
         );
  AOI22XL U13 ( .A0(DATA[11]), .A1(n72), .B0(DATA_OUT[11]), .B1(n79), .Y(n141)
         );
  AOI22XL U15 ( .A0(DATA[14]), .A1(n72), .B0(DATA_OUT[14]), .B1(n78), .Y(n138)
         );
  AOI22XL U17 ( .A0(DATA[15]), .A1(n72), .B0(DATA_OUT[15]), .B1(n78), .Y(n137)
         );
  AOI22XL U19 ( .A0(DATA[20]), .A1(n71), .B0(DATA_OUT[20]), .B1(n76), .Y(n132)
         );
  AOI22XL U21 ( .A0(DATA[25]), .A1(n71), .B0(DATA_OUT[25]), .B1(n75), .Y(n127)
         );
  AOI22XL U23 ( .A0(DATA[26]), .A1(n71), .B0(DATA_OUT[26]), .B1(n74), .Y(n126)
         );
  AOI22XL U25 ( .A0(DATA[29]), .A1(n71), .B0(DATA_OUT[29]), .B1(n73), .Y(n123)
         );
  AOI22XL U27 ( .A0(DATA[2]), .A1(n71), .B0(DATA_OUT[2]), .B1(n82), .Y(n150)
         );
  AOI22XL U29 ( .A0(DATA[3]), .A1(n72), .B0(DATA_OUT[3]), .B1(n82), .Y(n149)
         );
  AOI22XL U31 ( .A0(DATA[4]), .A1(n71), .B0(DATA_OUT[4]), .B1(n82), .Y(n148)
         );
  AOI22XL U33 ( .A0(DATA[7]), .A1(n84), .B0(DATA_OUT[7]), .B1(n81), .Y(n145)
         );
  AOI22XL U35 ( .A0(DATA[9]), .A1(n72), .B0(DATA_OUT[9]), .B1(n80), .Y(n143)
         );
  AOI22XL U37 ( .A0(DATA[12]), .A1(n72), .B0(DATA_OUT[12]), .B1(n79), .Y(n140)
         );
  AOI22XL U39 ( .A0(DATA[13]), .A1(n72), .B0(DATA_OUT[13]), .B1(n79), .Y(n139)
         );
  AOI22XL U41 ( .A0(DATA[16]), .A1(n72), .B0(DATA_OUT[16]), .B1(n78), .Y(n136)
         );
  AOI22XL U43 ( .A0(DATA[17]), .A1(n72), .B0(DATA_OUT[17]), .B1(n77), .Y(n135)
         );
  AOI22XL U45 ( .A0(DATA[18]), .A1(n72), .B0(DATA_OUT[18]), .B1(n77), .Y(n134)
         );
  AOI22XL U47 ( .A0(DATA[19]), .A1(n72), .B0(DATA_OUT[19]), .B1(n77), .Y(n133)
         );
  AOI22XL U49 ( .A0(DATA[21]), .A1(n71), .B0(DATA_OUT[21]), .B1(n76), .Y(n131)
         );
  AOI22XL U51 ( .A0(DATA[22]), .A1(n71), .B0(DATA_OUT[22]), .B1(n76), .Y(n130)
         );
  AOI22XL U53 ( .A0(DATA[23]), .A1(n71), .B0(DATA_OUT[23]), .B1(n75), .Y(n129)
         );
  AOI22XL U55 ( .A0(DATA[24]), .A1(n71), .B0(DATA_OUT[24]), .B1(n75), .Y(n128)
         );
  AOI22XL U57 ( .A0(DATA[27]), .A1(n71), .B0(DATA_OUT[27]), .B1(n74), .Y(n125)
         );
  AOI22XL U59 ( .A0(DATA[28]), .A1(n71), .B0(DATA_OUT[28]), .B1(n74), .Y(n124)
         );
  AOI22XL U61 ( .A0(DATA[30]), .A1(n71), .B0(DATA_OUT[30]), .B1(n73), .Y(n122)
         );
  AOI22XL U63 ( .A0(DATA[31]), .A1(n71), .B0(DATA_OUT[31]), .B1(n73), .Y(n121)
         );
  AOI22XL U65 ( .A0(n85), .A1(DATA[0]), .B0(DATA_OUT[0]), .B1(n82), .Y(n152)
         );
  AOI22XL U66 ( .A0(DATA[1]), .A1(n83), .B0(DATA_OUT[1]), .B1(n82), .Y(n151)
         );
  AOI22XL U67 ( .A0(DATA[5]), .A1(n72), .B0(DATA_OUT[5]), .B1(n81), .Y(n147)
         );
  AOI22XL U68 ( .A0(DATA[6]), .A1(n72), .B0(DATA_OUT[6]), .B1(n81), .Y(n146)
         );
  CLKINVX3 U69 ( .A(n86), .Y(n72) );
  CLKINVX3 U70 ( .A(n86), .Y(n71) );
  INVX1 U71 ( .A(n83), .Y(n82) );
  INVX1 U72 ( .A(n83), .Y(n81) );
  INVX1 U73 ( .A(n83), .Y(n80) );
  INVX1 U74 ( .A(n84), .Y(n79) );
  INVX1 U75 ( .A(n84), .Y(n78) );
  INVX1 U76 ( .A(n84), .Y(n77) );
  INVX1 U77 ( .A(n84), .Y(n76) );
  INVX1 U78 ( .A(n85), .Y(n75) );
  INVX1 U79 ( .A(n85), .Y(n74) );
  INVX1 U80 ( .A(n85), .Y(n73) );
  INVX1 U81 ( .A(n86), .Y(n85) );
  INVX1 U82 ( .A(n88), .Y(n83) );
  INVX1 U83 ( .A(n87), .Y(n84) );
  CLKINVX3 U84 ( .A(n2), .Y(n67) );
  CLKINVX3 U85 ( .A(n2), .Y(n68) );
  CLKINVX3 U86 ( .A(n2), .Y(n66) );
  INVX1 U87 ( .A(n70), .Y(n69) );
  INVX1 U88 ( .A(EN), .Y(n70) );
  INVX1 U89 ( .A(rst), .Y(n2) );
endmodule


module AMBA_REG_2 ( DATA, clk, rst, EN, DATA_OUT );
  input [31:0] DATA;
  output [31:0] DATA_OUT;
  input clk, rst, EN;
  wire   n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n2,
         n66, n88, n89, n90, n91, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176;

  DFFRHQX4 \DATA_OUT_reg[29]  ( .D(n115), .CK(clk), .RN(n91), .Q(n179) );
  DFFRHQX4 \DATA_OUT_reg[28]  ( .D(n116), .CK(clk), .RN(n91), .Q(n180) );
  DFFRHQX4 \DATA_OUT_reg[27]  ( .D(n117), .CK(clk), .RN(n91), .Q(n181) );
  DFFRHQX4 \DATA_OUT_reg[24]  ( .D(n120), .CK(clk), .RN(n91), .Q(n184) );
  DFFRHQX4 \DATA_OUT_reg[23]  ( .D(n121), .CK(clk), .RN(n90), .Q(DATA_OUT[23])
         );
  DFFRHQX4 \DATA_OUT_reg[22]  ( .D(n122), .CK(clk), .RN(n90), .Q(DATA_OUT[22])
         );
  DFFRHQX4 \DATA_OUT_reg[21]  ( .D(n123), .CK(clk), .RN(n90), .Q(DATA_OUT[21])
         );
  DFFRHQX4 \DATA_OUT_reg[20]  ( .D(n124), .CK(clk), .RN(n90), .Q(DATA_OUT[20])
         );
  DFFRHQX4 \DATA_OUT_reg[19]  ( .D(n125), .CK(clk), .RN(n90), .Q(DATA_OUT[19])
         );
  DFFRHQX4 \DATA_OUT_reg[18]  ( .D(n126), .CK(clk), .RN(n90), .Q(DATA_OUT[18])
         );
  DFFRHQX4 \DATA_OUT_reg[15]  ( .D(n129), .CK(clk), .RN(n90), .Q(n187) );
  DFFRHQX4 \DATA_OUT_reg[14]  ( .D(n130), .CK(clk), .RN(n90), .Q(n188) );
  DFFRHQX4 \DATA_OUT_reg[12]  ( .D(n132), .CK(clk), .RN(n90), .Q(DATA_OUT[12])
         );
  DFFRHQX4 \DATA_OUT_reg[9]  ( .D(n135), .CK(clk), .RN(n89), .Q(n190) );
  DFFRHQX4 \DATA_OUT_reg[8]  ( .D(n136), .CK(clk), .RN(n89), .Q(n191) );
  DFFRHQX4 \DATA_OUT_reg[5]  ( .D(n139), .CK(clk), .RN(n89), .Q(n194) );
  DFFRHQX4 \DATA_OUT_reg[4]  ( .D(n140), .CK(clk), .RN(n89), .Q(n195) );
  INVX1 U2 ( .A(n176), .Y(n144) );
  INVX1 U4 ( .A(n175), .Y(n143) );
  INVX1 U6 ( .A(n174), .Y(n142) );
  AOI22X1 U7 ( .A0(DATA[2]), .A1(n97), .B0(DATA_OUT[2]), .B1(n106), .Y(n174)
         );
  INVX1 U8 ( .A(n173), .Y(n141) );
  INVX1 U10 ( .A(n172), .Y(n140) );
  AOI22X1 U11 ( .A0(DATA[4]), .A1(n97), .B0(DATA_OUT[4]), .B1(n106), .Y(n172)
         );
  INVX1 U12 ( .A(n171), .Y(n139) );
  AOI22X1 U13 ( .A0(DATA[5]), .A1(n97), .B0(DATA_OUT[5]), .B1(n105), .Y(n171)
         );
  INVX1 U14 ( .A(n170), .Y(n138) );
  AOI22X1 U15 ( .A0(DATA[6]), .A1(n97), .B0(DATA_OUT[6]), .B1(n105), .Y(n170)
         );
  INVX1 U16 ( .A(n169), .Y(n137) );
  AOI22X1 U17 ( .A0(DATA[7]), .A1(n97), .B0(DATA_OUT[7]), .B1(n112), .Y(n169)
         );
  INVX1 U18 ( .A(n168), .Y(n136) );
  INVX1 U20 ( .A(n167), .Y(n135) );
  AOI22X1 U21 ( .A0(DATA[9]), .A1(n96), .B0(DATA_OUT[9]), .B1(n105), .Y(n167)
         );
  INVX1 U22 ( .A(n166), .Y(n134) );
  AOI22X1 U23 ( .A0(DATA[10]), .A1(n96), .B0(DATA_OUT[10]), .B1(n105), .Y(n166) );
  INVX1 U24 ( .A(n165), .Y(n133) );
  AOI22X1 U25 ( .A0(DATA[11]), .A1(n96), .B0(DATA_OUT[11]), .B1(n104), .Y(n165) );
  INVX1 U26 ( .A(n164), .Y(n132) );
  AOI22X1 U27 ( .A0(DATA[12]), .A1(n96), .B0(DATA_OUT[12]), .B1(n104), .Y(n164) );
  INVX1 U28 ( .A(n163), .Y(n131) );
  AOI22X1 U29 ( .A0(DATA[13]), .A1(n96), .B0(DATA_OUT[13]), .B1(n104), .Y(n163) );
  INVX1 U30 ( .A(n162), .Y(n130) );
  AOI22X1 U31 ( .A0(DATA[14]), .A1(n96), .B0(DATA_OUT[14]), .B1(n103), .Y(n162) );
  INVX1 U32 ( .A(n161), .Y(n129) );
  AOI22X1 U33 ( .A0(DATA[15]), .A1(n96), .B0(DATA_OUT[15]), .B1(n103), .Y(n161) );
  INVX1 U34 ( .A(n160), .Y(n128) );
  INVX1 U36 ( .A(n159), .Y(n127) );
  INVX1 U38 ( .A(n158), .Y(n126) );
  AOI22X1 U39 ( .A0(DATA[18]), .A1(n96), .B0(DATA_OUT[18]), .B1(n102), .Y(n158) );
  INVX1 U40 ( .A(n157), .Y(n125) );
  AOI22X1 U41 ( .A0(DATA[19]), .A1(n96), .B0(DATA_OUT[19]), .B1(n102), .Y(n157) );
  INVX1 U42 ( .A(n156), .Y(n124) );
  AOI22X1 U43 ( .A0(DATA[20]), .A1(n95), .B0(DATA_OUT[20]), .B1(n101), .Y(n156) );
  INVX1 U44 ( .A(n155), .Y(n123) );
  AOI22X1 U45 ( .A0(DATA[21]), .A1(n95), .B0(DATA_OUT[21]), .B1(n101), .Y(n155) );
  INVX1 U46 ( .A(n154), .Y(n122) );
  AOI22X1 U47 ( .A0(DATA[22]), .A1(n95), .B0(DATA_OUT[22]), .B1(n101), .Y(n154) );
  INVX1 U48 ( .A(n153), .Y(n121) );
  AOI22X1 U49 ( .A0(DATA[23]), .A1(n95), .B0(DATA_OUT[23]), .B1(n100), .Y(n153) );
  INVX1 U50 ( .A(n152), .Y(n120) );
  INVX1 U52 ( .A(n151), .Y(n119) );
  AOI22X1 U53 ( .A0(DATA[25]), .A1(n95), .B0(DATA_OUT[25]), .B1(n100), .Y(n151) );
  INVX1 U54 ( .A(n150), .Y(n118) );
  AOI22X1 U55 ( .A0(DATA[26]), .A1(n95), .B0(DATA_OUT[26]), .B1(n99), .Y(n150)
         );
  INVX1 U56 ( .A(n149), .Y(n117) );
  AOI22X1 U57 ( .A0(DATA[27]), .A1(n95), .B0(DATA_OUT[27]), .B1(n99), .Y(n149)
         );
  INVX1 U60 ( .A(n147), .Y(n115) );
  AOI22X1 U61 ( .A0(DATA[29]), .A1(n95), .B0(DATA_OUT[29]), .B1(n98), .Y(n147)
         );
  INVX1 U62 ( .A(n146), .Y(n114) );
  AOI22X1 U63 ( .A0(DATA[30]), .A1(n95), .B0(DATA_OUT[30]), .B1(n98), .Y(n146)
         );
  INVX1 U64 ( .A(n145), .Y(n113) );
  AOI22X1 U65 ( .A0(DATA[31]), .A1(n95), .B0(DATA_OUT[31]), .B1(n98), .Y(n145)
         );
  DFFRHQX4 \DATA_OUT_reg[26]  ( .D(n118), .CK(clk), .RN(n91), .Q(n182) );
  DFFRHQX4 \DATA_OUT_reg[25]  ( .D(n119), .CK(clk), .RN(n91), .Q(n183) );
  DFFRHQX4 \DATA_OUT_reg[16]  ( .D(n128), .CK(clk), .RN(n90), .Q(n186) );
  DFFRHQX4 \DATA_OUT_reg[2]  ( .D(n142), .CK(clk), .RN(n89), .Q(n197) );
  DFFRHQX4 \DATA_OUT_reg[3]  ( .D(n141), .CK(clk), .RN(n89), .Q(n196) );
  DFFRHQX4 \DATA_OUT_reg[10]  ( .D(n134), .CK(clk), .RN(n89), .Q(DATA_OUT[10])
         );
  DFFRHQX4 \DATA_OUT_reg[11]  ( .D(n133), .CK(clk), .RN(n89), .Q(DATA_OUT[11])
         );
  DFFRHQX4 \DATA_OUT_reg[13]  ( .D(n131), .CK(clk), .RN(n90), .Q(n189) );
  DFFRHQX2 \DATA_OUT_reg[31]  ( .D(n113), .CK(clk), .RN(n91), .Q(n177) );
  DFFRHQX2 \DATA_OUT_reg[1]  ( .D(n143), .CK(clk), .RN(n89), .Q(n198) );
  DFFRHQX2 \DATA_OUT_reg[0]  ( .D(n144), .CK(clk), .RN(n89), .Q(DATA_OUT[0])
         );
  DFFRHQX4 \DATA_OUT_reg[6]  ( .D(n138), .CK(clk), .RN(n89), .Q(n193) );
  DFFRHQX4 \DATA_OUT_reg[7]  ( .D(n137), .CK(clk), .RN(n89), .Q(n192) );
  DFFRHQX4 \DATA_OUT_reg[30]  ( .D(n114), .CK(clk), .RN(n91), .Q(n178) );
  DFFRHQX4 \DATA_OUT_reg[17]  ( .D(n127), .CK(clk), .RN(n90), .Q(n185) );
  CLKINVX3 U3 ( .A(n185), .Y(n66) );
  DLY1X1 U5 ( .A(DATA_OUT[8]), .Y(n2) );
  BUFX16 U9 ( .A(n195), .Y(DATA_OUT[4]) );
  BUFX8 U19 ( .A(n183), .Y(DATA_OUT[25]) );
  BUFX8 U35 ( .A(n179), .Y(DATA_OUT[29]) );
  BUFX20 U37 ( .A(n178), .Y(DATA_OUT[30]) );
  BUFX20 U51 ( .A(n192), .Y(DATA_OUT[7]) );
  BUFX20 U58 ( .A(n193), .Y(DATA_OUT[6]) );
  BUFX16 U59 ( .A(n177), .Y(DATA_OUT[31]) );
  CLKINVX20 U66 ( .A(n66), .Y(DATA_OUT[17]) );
  BUFX20 U67 ( .A(n184), .Y(DATA_OUT[24]) );
  CLKBUFX8 U68 ( .A(n197), .Y(DATA_OUT[2]) );
  BUFX16 U69 ( .A(n196), .Y(DATA_OUT[3]) );
  BUFX12 U70 ( .A(n194), .Y(DATA_OUT[5]) );
  BUFX16 U71 ( .A(n190), .Y(DATA_OUT[9]) );
  BUFX16 U72 ( .A(n189), .Y(DATA_OUT[13]) );
  BUFX12 U73 ( .A(n188), .Y(DATA_OUT[14]) );
  BUFX8 U74 ( .A(n187), .Y(DATA_OUT[15]) );
  CLKBUFX8 U75 ( .A(n186), .Y(DATA_OUT[16]) );
  CLKBUFX8 U76 ( .A(n182), .Y(DATA_OUT[26]) );
  CLKBUFX8 U77 ( .A(n181), .Y(DATA_OUT[27]) );
  INVX1 U78 ( .A(n148), .Y(n116) );
  INVX1 U79 ( .A(n93), .Y(n110) );
  AOI22XL U80 ( .A0(DATA[3]), .A1(n97), .B0(DATA_OUT[3]), .B1(n106), .Y(n173)
         );
  AOI22XL U81 ( .A0(DATA[17]), .A1(n96), .B0(DATA_OUT[17]), .B1(n102), .Y(n159) );
  AOI22XL U82 ( .A0(DATA[8]), .A1(n96), .B0(n2), .B1(n105), .Y(n168) );
  BUFX20 U83 ( .A(n180), .Y(DATA_OUT[28]) );
  BUFX20 U84 ( .A(n191), .Y(DATA_OUT[8]) );
  AOI22XL U85 ( .A0(DATA[28]), .A1(n95), .B0(DATA_OUT[28]), .B1(n99), .Y(n148)
         );
  AOI22XL U86 ( .A0(DATA[24]), .A1(n95), .B0(DATA_OUT[24]), .B1(n100), .Y(n152) );
  INVXL U87 ( .A(n93), .Y(n112) );
  INVXL U88 ( .A(n93), .Y(n111) );
  CLKINVX3 U89 ( .A(n110), .Y(n95) );
  CLKINVX3 U90 ( .A(n110), .Y(n96) );
  CLKINVX3 U91 ( .A(n110), .Y(n97) );
  INVX1 U92 ( .A(n107), .Y(n106) );
  INVX1 U93 ( .A(n107), .Y(n105) );
  INVX1 U94 ( .A(n108), .Y(n104) );
  INVX1 U95 ( .A(n108), .Y(n102) );
  INVX1 U96 ( .A(n108), .Y(n101) );
  INVX1 U97 ( .A(n109), .Y(n100) );
  INVX1 U98 ( .A(n109), .Y(n99) );
  INVX1 U99 ( .A(n109), .Y(n98) );
  INVX1 U100 ( .A(n108), .Y(n103) );
  INVX1 U101 ( .A(n110), .Y(n109) );
  INVX1 U102 ( .A(n112), .Y(n107) );
  INVX1 U103 ( .A(n111), .Y(n108) );
  CLKINVX3 U104 ( .A(n88), .Y(n90) );
  CLKINVX3 U105 ( .A(n88), .Y(n91) );
  CLKINVX3 U106 ( .A(n88), .Y(n89) );
  INVX1 U107 ( .A(n94), .Y(n93) );
  INVX1 U108 ( .A(EN), .Y(n94) );
  INVX1 U109 ( .A(rst), .Y(n88) );
  AOI22XL U110 ( .A0(DATA[16]), .A1(n96), .B0(DATA_OUT[16]), .B1(n103), .Y(
        n160) );
  BUFX20 U111 ( .A(n198), .Y(DATA_OUT[1]) );
  AOI22XL U112 ( .A0(n97), .A1(DATA[0]), .B0(DATA_OUT[0]), .B1(n106), .Y(n176)
         );
  AOI22XL U113 ( .A0(DATA[1]), .A1(n97), .B0(DATA_OUT[1]), .B1(n106), .Y(n175)
         );
endmodule


module AMBA_REG_3 ( DATA, clk, rst, EN, DATA_OUT );
  input [31:0] DATA;
  output [31:0] DATA_OUT;
  input clk, rst, EN;
  wire   n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n2, n80, n81, n82, n83, n84, n85, n86, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171;

  DFFRHQX4 \DATA_OUT_reg[23]  ( .D(n116), .CK(clk), .RN(n83), .Q(n174) );
  DFFRHQX4 \DATA_OUT_reg[22]  ( .D(n117), .CK(clk), .RN(n83), .Q(DATA_OUT[22])
         );
  DFFRHQX4 \DATA_OUT_reg[20]  ( .D(n119), .CK(clk), .RN(n83), .Q(DATA_OUT[20])
         );
  DFFRHQX4 \DATA_OUT_reg[19]  ( .D(n120), .CK(clk), .RN(n83), .Q(DATA_OUT[19])
         );
  DFFRHQX4 \DATA_OUT_reg[18]  ( .D(n121), .CK(clk), .RN(n83), .Q(n176) );
  DFFRHQX4 \DATA_OUT_reg[17]  ( .D(n122), .CK(clk), .RN(n83), .Q(n177) );
  DFFRHQX4 \DATA_OUT_reg[16]  ( .D(n123), .CK(clk), .RN(n83), .Q(DATA_OUT[16])
         );
  DFFRHQX4 \DATA_OUT_reg[15]  ( .D(n124), .CK(clk), .RN(n83), .Q(DATA_OUT[15])
         );
  DFFRHQX4 \DATA_OUT_reg[14]  ( .D(n125), .CK(clk), .RN(n83), .Q(n178) );
  DFFRHQX4 \DATA_OUT_reg[13]  ( .D(n126), .CK(clk), .RN(n83), .Q(DATA_OUT[13])
         );
  DFFRHQX4 \DATA_OUT_reg[12]  ( .D(n127), .CK(clk), .RN(n83), .Q(DATA_OUT[12])
         );
  DFFRHQX4 \DATA_OUT_reg[11]  ( .D(n128), .CK(clk), .RN(n82), .Q(DATA_OUT[11])
         );
  DFFRHQX4 \DATA_OUT_reg[10]  ( .D(n129), .CK(clk), .RN(n82), .Q(n179) );
  DFFRHQX4 \DATA_OUT_reg[9]  ( .D(n130), .CK(clk), .RN(n82), .Q(DATA_OUT[9])
         );
  DFFRHQX4 \DATA_OUT_reg[8]  ( .D(n131), .CK(clk), .RN(n82), .Q(DATA_OUT[8])
         );
  DFFRHQX4 \DATA_OUT_reg[2]  ( .D(n137), .CK(clk), .RN(n82), .Q(n184) );
  DFFRHQX4 \DATA_OUT_reg[1]  ( .D(n138), .CK(clk), .RN(n82), .Q(n185) );
  DFFRHQX4 \DATA_OUT_reg[0]  ( .D(n139), .CK(clk), .RN(n82), .Q(n186) );
  INVX1 U2 ( .A(n171), .Y(n139) );
  AOI22X1 U3 ( .A0(n92), .A1(DATA[0]), .B0(DATA_OUT[0]), .B1(n102), .Y(n171)
         );
  INVX1 U4 ( .A(n170), .Y(n138) );
  AOI22X1 U5 ( .A0(DATA[1]), .A1(n92), .B0(DATA_OUT[1]), .B1(n102), .Y(n170)
         );
  INVX1 U6 ( .A(n169), .Y(n137) );
  AOI22X1 U7 ( .A0(DATA[2]), .A1(n92), .B0(DATA_OUT[2]), .B1(n102), .Y(n169)
         );
  INVX1 U8 ( .A(n168), .Y(n136) );
  AOI22X1 U9 ( .A0(DATA[3]), .A1(n92), .B0(DATA_OUT[3]), .B1(n102), .Y(n168)
         );
  INVX1 U10 ( .A(n167), .Y(n135) );
  AOI22X1 U11 ( .A0(DATA[4]), .A1(n92), .B0(DATA_OUT[4]), .B1(n102), .Y(n167)
         );
  INVX1 U12 ( .A(n166), .Y(n134) );
  INVX1 U14 ( .A(n165), .Y(n133) );
  AOI22X1 U15 ( .A0(DATA[6]), .A1(n92), .B0(DATA_OUT[6]), .B1(n101), .Y(n165)
         );
  INVX1 U16 ( .A(n164), .Y(n132) );
  AOI22X1 U17 ( .A0(DATA[7]), .A1(n92), .B0(DATA_OUT[7]), .B1(n101), .Y(n164)
         );
  INVX1 U18 ( .A(n163), .Y(n131) );
  INVX1 U20 ( .A(n162), .Y(n130) );
  AOI22X1 U21 ( .A0(DATA[9]), .A1(n91), .B0(DATA_OUT[9]), .B1(n100), .Y(n162)
         );
  INVX1 U22 ( .A(n161), .Y(n129) );
  AOI22X1 U23 ( .A0(DATA[10]), .A1(n91), .B0(DATA_OUT[10]), .B1(n100), .Y(n161) );
  INVX1 U24 ( .A(n160), .Y(n128) );
  AOI22X1 U25 ( .A0(DATA[11]), .A1(n91), .B0(DATA_OUT[11]), .B1(n99), .Y(n160)
         );
  INVX1 U26 ( .A(n159), .Y(n127) );
  AOI22X1 U27 ( .A0(DATA[12]), .A1(n91), .B0(DATA_OUT[12]), .B1(n99), .Y(n159)
         );
  INVX1 U28 ( .A(n158), .Y(n126) );
  AOI22X1 U29 ( .A0(DATA[13]), .A1(n91), .B0(DATA_OUT[13]), .B1(n99), .Y(n158)
         );
  INVX1 U30 ( .A(n157), .Y(n125) );
  AOI22X1 U31 ( .A0(DATA[14]), .A1(n91), .B0(DATA_OUT[14]), .B1(n98), .Y(n157)
         );
  INVX1 U32 ( .A(n156), .Y(n124) );
  AOI22X1 U33 ( .A0(DATA[15]), .A1(n91), .B0(DATA_OUT[15]), .B1(n98), .Y(n156)
         );
  INVX1 U34 ( .A(n155), .Y(n123) );
  AOI22X1 U35 ( .A0(DATA[16]), .A1(n91), .B0(DATA_OUT[16]), .B1(n98), .Y(n155)
         );
  INVX1 U36 ( .A(n154), .Y(n122) );
  AOI22X1 U37 ( .A0(DATA[17]), .A1(n91), .B0(DATA_OUT[17]), .B1(n97), .Y(n154)
         );
  INVX1 U38 ( .A(n153), .Y(n121) );
  AOI22X1 U39 ( .A0(DATA[18]), .A1(n91), .B0(DATA_OUT[18]), .B1(n97), .Y(n153)
         );
  INVX1 U40 ( .A(n152), .Y(n120) );
  AOI22X1 U41 ( .A0(DATA[19]), .A1(n91), .B0(DATA_OUT[19]), .B1(n97), .Y(n152)
         );
  INVX1 U42 ( .A(n151), .Y(n119) );
  AOI22X1 U43 ( .A0(DATA[20]), .A1(n90), .B0(DATA_OUT[20]), .B1(n96), .Y(n151)
         );
  INVX1 U44 ( .A(n150), .Y(n118) );
  INVX1 U46 ( .A(n149), .Y(n117) );
  AOI22X1 U47 ( .A0(DATA[22]), .A1(n90), .B0(DATA_OUT[22]), .B1(n96), .Y(n149)
         );
  INVX1 U48 ( .A(n148), .Y(n116) );
  AOI22X1 U49 ( .A0(DATA[23]), .A1(n90), .B0(DATA_OUT[23]), .B1(n95), .Y(n148)
         );
  INVX1 U50 ( .A(n147), .Y(n115) );
  AOI22X1 U51 ( .A0(DATA[24]), .A1(n90), .B0(DATA_OUT[24]), .B1(n95), .Y(n147)
         );
  INVX1 U52 ( .A(n146), .Y(n114) );
  INVX1 U54 ( .A(n145), .Y(n113) );
  INVX1 U56 ( .A(n144), .Y(n112) );
  INVX1 U58 ( .A(n143), .Y(n111) );
  INVX1 U60 ( .A(n142), .Y(n110) );
  INVX1 U62 ( .A(n141), .Y(n109) );
  INVX1 U64 ( .A(n140), .Y(n108) );
  DFFRX4 \DATA_OUT_reg[5]  ( .D(n134), .CK(clk), .RN(rst), .Q(DATA_OUT[5]) );
  DFFRX4 \DATA_OUT_reg[21]  ( .D(n118), .CK(clk), .RN(n83), .Q(n175) );
  DFFRHQX1 \DATA_OUT_reg[28]  ( .D(n111), .CK(clk), .RN(n84), .Q(DATA_OUT[28])
         );
  DFFRHQX1 \DATA_OUT_reg[30]  ( .D(n109), .CK(clk), .RN(n84), .Q(DATA_OUT[30])
         );
  DFFRHQX1 \DATA_OUT_reg[29]  ( .D(n110), .CK(clk), .RN(n84), .Q(DATA_OUT[29])
         );
  DFFRHQX1 \DATA_OUT_reg[26]  ( .D(n113), .CK(clk), .RN(n84), .Q(DATA_OUT[26])
         );
  DFFRHQX1 \DATA_OUT_reg[31]  ( .D(n108), .CK(clk), .RN(n84), .Q(DATA_OUT[31])
         );
  DFFRHQX1 \DATA_OUT_reg[27]  ( .D(n112), .CK(clk), .RN(n84), .Q(DATA_OUT[27])
         );
  DFFRHQX2 \DATA_OUT_reg[3]  ( .D(n136), .CK(clk), .RN(n82), .Q(n183) );
  DFFRHQX2 \DATA_OUT_reg[25]  ( .D(n114), .CK(clk), .RN(n84), .Q(n172) );
  DFFRHQX2 \DATA_OUT_reg[24]  ( .D(n115), .CK(clk), .RN(n84), .Q(n173) );
  DFFRHQX2 \DATA_OUT_reg[6]  ( .D(n133), .CK(clk), .RN(n82), .Q(n181) );
  DFFRHQX2 \DATA_OUT_reg[4]  ( .D(n135), .CK(clk), .RN(n82), .Q(n182) );
  DFFRHQX4 \DATA_OUT_reg[7]  ( .D(n132), .CK(clk), .RN(n82), .Q(n180) );
  BUFX16 U13 ( .A(n174), .Y(DATA_OUT[23]) );
  INVX20 U19 ( .A(n2), .Y(DATA_OUT[25]) );
  INVX4 U45 ( .A(n172), .Y(n2) );
  BUFX16 U53 ( .A(n182), .Y(DATA_OUT[4]) );
  BUFX12 U55 ( .A(n173), .Y(DATA_OUT[24]) );
  CLKBUFX8 U57 ( .A(n186), .Y(DATA_OUT[0]) );
  CLKBUFX8 U59 ( .A(n185), .Y(DATA_OUT[1]) );
  BUFX8 U61 ( .A(n183), .Y(DATA_OUT[3]) );
  CLKBUFX8 U63 ( .A(n178), .Y(DATA_OUT[14]) );
  BUFX12 U65 ( .A(n175), .Y(DATA_OUT[21]) );
  INVX1 U66 ( .A(n88), .Y(n106) );
  CLKBUFX8 U67 ( .A(n184), .Y(DATA_OUT[2]) );
  AOI22XL U68 ( .A0(DATA[8]), .A1(n91), .B0(DATA_OUT[8]), .B1(n100), .Y(n163)
         );
  AOI22XL U69 ( .A0(DATA[25]), .A1(n90), .B0(DATA_OUT[25]), .B1(n95), .Y(n146)
         );
  AOI22XL U70 ( .A0(DATA[5]), .A1(n92), .B0(DATA_OUT[5]), .B1(n101), .Y(n166)
         );
  BUFX20 U71 ( .A(n179), .Y(DATA_OUT[10]) );
  BUFX20 U72 ( .A(n176), .Y(DATA_OUT[18]) );
  INVXL U73 ( .A(n88), .Y(n107) );
  AOI22XL U74 ( .A0(DATA[26]), .A1(n90), .B0(DATA_OUT[26]), .B1(n94), .Y(n145)
         );
  AOI22XL U75 ( .A0(DATA[27]), .A1(n90), .B0(DATA_OUT[27]), .B1(n94), .Y(n144)
         );
  AOI22XL U76 ( .A0(DATA[28]), .A1(n90), .B0(DATA_OUT[28]), .B1(n94), .Y(n143)
         );
  AOI22XL U77 ( .A0(DATA[29]), .A1(n90), .B0(DATA_OUT[29]), .B1(n93), .Y(n142)
         );
  AOI22XL U78 ( .A0(DATA[30]), .A1(n90), .B0(DATA_OUT[30]), .B1(n93), .Y(n141)
         );
  AOI22XL U79 ( .A0(DATA[31]), .A1(n90), .B0(DATA_OUT[31]), .B1(n93), .Y(n140)
         );
  CLKINVX3 U80 ( .A(n106), .Y(n91) );
  CLKINVX3 U81 ( .A(n106), .Y(n90) );
  CLKINVX3 U82 ( .A(n106), .Y(n92) );
  INVX1 U83 ( .A(n103), .Y(n102) );
  INVX1 U84 ( .A(n103), .Y(n101) );
  INVX1 U85 ( .A(n103), .Y(n100) );
  INVX1 U86 ( .A(n104), .Y(n99) );
  INVX1 U87 ( .A(n104), .Y(n98) );
  INVX1 U88 ( .A(n104), .Y(n97) );
  INVX1 U89 ( .A(n105), .Y(n95) );
  INVX1 U90 ( .A(n105), .Y(n94) );
  INVX1 U91 ( .A(n105), .Y(n93) );
  INVX1 U92 ( .A(n104), .Y(n96) );
  INVX1 U93 ( .A(n106), .Y(n105) );
  INVX1 U94 ( .A(n107), .Y(n103) );
  INVX1 U95 ( .A(n107), .Y(n104) );
  CLKINVX3 U96 ( .A(n85), .Y(n83) );
  CLKINVX3 U97 ( .A(n85), .Y(n84) );
  CLKINVX3 U98 ( .A(n86), .Y(n82) );
  INVX1 U99 ( .A(n80), .Y(n86) );
  INVX1 U100 ( .A(n80), .Y(n85) );
  INVX1 U101 ( .A(n89), .Y(n88) );
  INVX1 U102 ( .A(EN), .Y(n89) );
  INVX1 U103 ( .A(n81), .Y(n80) );
  INVX1 U104 ( .A(rst), .Y(n81) );
  AOI22XL U105 ( .A0(DATA[21]), .A1(n90), .B0(DATA_OUT[21]), .B1(n96), .Y(n150) );
  BUFX20 U106 ( .A(n180), .Y(DATA_OUT[7]) );
  BUFX20 U107 ( .A(n181), .Y(DATA_OUT[6]) );
  BUFX20 U108 ( .A(n177), .Y(DATA_OUT[17]) );
endmodule


module REG_BANK_AMBA_WORD32_AMBA_ADDR_WIDTH20 ( clk, rst, PADDR, PWDATA, WRITE, 
        PRDATA, SEL, DATA_IN, CODEWORD_WIDTH, operation_done, NOISE );
  input [19:0] PADDR;
  input [31:0] PWDATA;
  output [31:0] PRDATA;
  output [31:0] SEL;
  output [31:0] DATA_IN;
  output [31:0] CODEWORD_WIDTH;
  output [31:0] NOISE;
  input clk, rst, WRITE;
  output operation_done;
  wire   n88, n89, n90, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, n2, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n4, n77, n78, n80, n81,
         n82, n83, n84, n85, n86, n87;
  wire   [3:1] EN;
  assign PRDATA[0] = N47;
  assign PRDATA[1] = N48;
  assign PRDATA[2] = N49;
  assign PRDATA[3] = N50;
  assign PRDATA[4] = N51;
  assign PRDATA[5] = N52;
  assign PRDATA[6] = N53;
  assign PRDATA[7] = N54;
  assign PRDATA[8] = N55;
  assign PRDATA[9] = N56;
  assign PRDATA[10] = N57;
  assign PRDATA[11] = N58;
  assign PRDATA[12] = N59;
  assign PRDATA[13] = N60;
  assign PRDATA[14] = N61;
  assign PRDATA[15] = N62;
  assign PRDATA[16] = N63;
  assign PRDATA[17] = N64;
  assign PRDATA[18] = N65;
  assign PRDATA[19] = N66;
  assign PRDATA[20] = N67;
  assign PRDATA[21] = N68;
  assign PRDATA[22] = N69;
  assign PRDATA[23] = N70;
  assign PRDATA[24] = N71;
  assign PRDATA[25] = N72;
  assign PRDATA[26] = N73;
  assign PRDATA[27] = N74;
  assign PRDATA[28] = N75;
  assign PRDATA[29] = N76;
  assign PRDATA[30] = N77;
  assign PRDATA[31] = N78;

  AMBA_REG_0 ctrl ( .DATA(PWDATA), .clk(clk), .rst(n77), .EN(operation_done), 
        .DATA_OUT(SEL) );
  AMBA_REG_3 datain ( .DATA(PWDATA), .clk(clk), .rst(n77), .EN(EN[1]), 
        .DATA_OUT({DATA_IN[31:13], n88, DATA_IN[11:6], n89, DATA_IN[4:0]}) );
  AMBA_REG_2 codewordwidth ( .DATA(PWDATA), .clk(clk), .rst(n77), .EN(EN[2]), 
        .DATA_OUT({CODEWORD_WIDTH[31:1], n90}) );
  AMBA_REG_1 noise ( .DATA(PWDATA), .clk(clk), .rst(n77), .EN(EN[3]), 
        .DATA_OUT(NOISE) );
  DLY1X1 U3 ( .A(CODEWORD_WIDTH[8]), .Y(n4) );
  INVX1 U4 ( .A(WRITE), .Y(n7) );
  BUFX8 U5 ( .A(n89), .Y(DATA_IN[5]) );
  NOR2X1 U6 ( .A(n8), .B(n7), .Y(operation_done) );
  NAND3X1 U7 ( .A(n75), .B(n6), .C(PADDR[3]), .Y(n73) );
  NAND3X1 U8 ( .A(n75), .B(n5), .C(PADDR[2]), .Y(n76) );
  NAND3X1 U9 ( .A(PADDR[2]), .B(n75), .C(PADDR[3]), .Y(n74) );
  BUFX8 U10 ( .A(n88), .Y(DATA_IN[12]) );
  AOI22XL U11 ( .A0(NOISE[3]), .A1(n87), .B0(CODEWORD_WIDTH[3]), .B1(n85), .Y(
        n66) );
  AOI22XL U12 ( .A0(NOISE[8]), .A1(n86), .B0(n4), .B1(n85), .Y(n56) );
  NOR2X2 U13 ( .A(PADDR[0]), .B(PADDR[1]), .Y(n75) );
  AOI22XL U14 ( .A0(DATA_IN[28]), .A1(n82), .B0(SEL[28]), .B1(n81), .Y(n15) );
  AOI22XL U15 ( .A0(DATA_IN[31]), .A1(n82), .B0(SEL[31]), .B1(n81), .Y(n9) );
  AOI22XL U16 ( .A0(DATA_IN[26]), .A1(n82), .B0(SEL[26]), .B1(n81), .Y(n19) );
  AOI22XL U17 ( .A0(DATA_IN[29]), .A1(n82), .B0(SEL[29]), .B1(n81), .Y(n13) );
  AOI22XL U18 ( .A0(DATA_IN[27]), .A1(n82), .B0(SEL[27]), .B1(n81), .Y(n17) );
  AOI22XL U19 ( .A0(DATA_IN[30]), .A1(n82), .B0(SEL[30]), .B1(n80), .Y(n11) );
  CLKINVX3 U20 ( .A(n8), .Y(n80) );
  CLKINVX3 U21 ( .A(n8), .Y(n81) );
  CLKINVX3 U22 ( .A(n76), .Y(n83) );
  CLKINVX3 U23 ( .A(n74), .Y(n86) );
  CLKINVX3 U24 ( .A(n73), .Y(n85) );
  CLKINVX3 U25 ( .A(n74), .Y(n87) );
  CLKINVX3 U26 ( .A(n76), .Y(n82) );
  CLKINVX3 U27 ( .A(n73), .Y(n84) );
  NAND3X1 U28 ( .A(n6), .B(n5), .C(n75), .Y(n8) );
  NOR2X1 U29 ( .A(n7), .B(n76), .Y(EN[1]) );
  NOR2X1 U30 ( .A(n7), .B(n73), .Y(EN[2]) );
  NOR2X1 U31 ( .A(n7), .B(n74), .Y(EN[3]) );
  INVX1 U32 ( .A(n73), .Y(n2) );
  INVX1 U33 ( .A(PADDR[2]), .Y(n6) );
  INVX1 U34 ( .A(PADDR[3]), .Y(n5) );
  NAND2X1 U35 ( .A(n31), .B(n32), .Y(N67) );
  AOI22XL U36 ( .A0(DATA_IN[20]), .A1(n82), .B0(SEL[20]), .B1(n81), .Y(n31) );
  NAND2X1 U37 ( .A(n33), .B(n34), .Y(N66) );
  AOI22XL U38 ( .A0(DATA_IN[19]), .A1(n83), .B0(SEL[19]), .B1(n80), .Y(n33) );
  AOI22XL U39 ( .A0(NOISE[19]), .A1(n86), .B0(CODEWORD_WIDTH[19]), .B1(n85), 
        .Y(n34) );
  NAND2X1 U40 ( .A(n29), .B(n30), .Y(N68) );
  AOI22XL U41 ( .A0(NOISE[21]), .A1(n87), .B0(CODEWORD_WIDTH[21]), .B1(n84), 
        .Y(n30) );
  NAND2X1 U42 ( .A(n71), .B(n72), .Y(N47) );
  AOI22XL U43 ( .A0(DATA_IN[0]), .A1(n83), .B0(SEL[0]), .B1(n81), .Y(n71) );
  NAND2X1 U44 ( .A(n69), .B(n70), .Y(N48) );
  AOI22XL U45 ( .A0(DATA_IN[1]), .A1(n82), .B0(SEL[1]), .B1(n81), .Y(n69) );
  NAND2X1 U46 ( .A(n59), .B(n60), .Y(N53) );
  AOI22XL U47 ( .A0(DATA_IN[6]), .A1(n83), .B0(SEL[6]), .B1(n81), .Y(n59) );
  NAND2X1 U48 ( .A(n45), .B(n46), .Y(N60) );
  AOI22XL U49 ( .A0(DATA_IN[13]), .A1(n83), .B0(SEL[13]), .B1(n80), .Y(n45) );
  NAND2X1 U50 ( .A(n39), .B(n40), .Y(N63) );
  AOI22XL U51 ( .A0(DATA_IN[16]), .A1(n83), .B0(SEL[16]), .B1(n80), .Y(n39) );
  NAND2X1 U52 ( .A(n23), .B(n24), .Y(N71) );
  AOI22XL U53 ( .A0(DATA_IN[24]), .A1(n82), .B0(SEL[24]), .B1(n80), .Y(n23) );
  NAND2X1 U54 ( .A(n15), .B(n16), .Y(N75) );
  NAND2X1 U55 ( .A(n9), .B(n10), .Y(N78) );
  NAND2X1 U56 ( .A(n49), .B(n50), .Y(N58) );
  AOI22XL U57 ( .A0(DATA_IN[11]), .A1(n83), .B0(SEL[11]), .B1(n80), .Y(n49) );
  NAND2X1 U58 ( .A(n51), .B(n52), .Y(N57) );
  AOI22XL U59 ( .A0(DATA_IN[10]), .A1(n83), .B0(SEL[10]), .B1(n80), .Y(n51) );
  NAND2X1 U60 ( .A(n67), .B(n68), .Y(N49) );
  AOI22XL U61 ( .A0(DATA_IN[2]), .A1(n82), .B0(SEL[2]), .B1(n81), .Y(n67) );
  NAND2X1 U62 ( .A(n65), .B(n66), .Y(N50) );
  AOI22XL U63 ( .A0(DATA_IN[3]), .A1(n83), .B0(SEL[3]), .B1(n81), .Y(n65) );
  NAND2X1 U64 ( .A(n63), .B(n64), .Y(N51) );
  AOI22XL U65 ( .A0(DATA_IN[4]), .A1(n82), .B0(SEL[4]), .B1(n81), .Y(n63) );
  NAND2X1 U66 ( .A(n57), .B(n58), .Y(N54) );
  AOI22XL U67 ( .A0(DATA_IN[7]), .A1(n82), .B0(SEL[7]), .B1(n81), .Y(n57) );
  NAND2X1 U68 ( .A(n55), .B(n56), .Y(N55) );
  AOI22XL U69 ( .A0(DATA_IN[8]), .A1(n83), .B0(SEL[8]), .B1(n80), .Y(n55) );
  NAND2X1 U70 ( .A(n43), .B(n44), .Y(N61) );
  AOI22XL U71 ( .A0(DATA_IN[14]), .A1(n83), .B0(SEL[14]), .B1(n80), .Y(n43) );
  NAND2X1 U72 ( .A(n41), .B(n42), .Y(N62) );
  AOI22XL U73 ( .A0(DATA_IN[15]), .A1(n83), .B0(SEL[15]), .B1(n80), .Y(n41) );
  NAND2X1 U74 ( .A(n21), .B(n22), .Y(N72) );
  AOI22XL U75 ( .A0(DATA_IN[25]), .A1(n82), .B0(SEL[25]), .B1(n81), .Y(n21) );
  NAND2X1 U76 ( .A(n19), .B(n20), .Y(N73) );
  NAND2X1 U77 ( .A(n13), .B(n14), .Y(N76) );
  NAND2X1 U78 ( .A(n47), .B(n48), .Y(N59) );
  AOI22XL U79 ( .A0(DATA_IN[12]), .A1(n83), .B0(SEL[12]), .B1(n80), .Y(n47) );
  AOI22XL U80 ( .A0(NOISE[12]), .A1(n86), .B0(CODEWORD_WIDTH[12]), .B1(n85), 
        .Y(n48) );
  NAND2X1 U81 ( .A(n27), .B(n28), .Y(N69) );
  AOI22XL U82 ( .A0(DATA_IN[22]), .A1(n82), .B0(SEL[22]), .B1(n80), .Y(n27) );
  AOI22XL U83 ( .A0(NOISE[22]), .A1(n87), .B0(CODEWORD_WIDTH[22]), .B1(n84), 
        .Y(n28) );
  NAND2X1 U84 ( .A(n37), .B(n38), .Y(N64) );
  AOI22XL U85 ( .A0(DATA_IN[17]), .A1(n83), .B0(SEL[17]), .B1(n80), .Y(n37) );
  AOI22XL U86 ( .A0(NOISE[17]), .A1(n86), .B0(CODEWORD_WIDTH[17]), .B1(n85), 
        .Y(n38) );
  NAND2X1 U87 ( .A(n35), .B(n36), .Y(N65) );
  AOI22XL U88 ( .A0(DATA_IN[18]), .A1(n83), .B0(SEL[18]), .B1(n80), .Y(n35) );
  AOI22XL U89 ( .A0(NOISE[18]), .A1(n86), .B0(CODEWORD_WIDTH[18]), .B1(n85), 
        .Y(n36) );
  NAND2X1 U90 ( .A(n25), .B(n26), .Y(N70) );
  AOI22XL U91 ( .A0(DATA_IN[23]), .A1(n82), .B0(SEL[23]), .B1(n81), .Y(n25) );
  AOI22XL U92 ( .A0(NOISE[23]), .A1(n87), .B0(CODEWORD_WIDTH[23]), .B1(n84), 
        .Y(n26) );
  NAND2X1 U93 ( .A(n53), .B(n54), .Y(N56) );
  AOI22XL U94 ( .A0(NOISE[9]), .A1(n86), .B0(CODEWORD_WIDTH[9]), .B1(n85), .Y(
        n54) );
  AOI22XL U95 ( .A0(DATA_IN[9]), .A1(n83), .B0(SEL[9]), .B1(n80), .Y(n53) );
  NAND2X1 U96 ( .A(n17), .B(n18), .Y(N74) );
  AOI22XL U97 ( .A0(NOISE[27]), .A1(n87), .B0(CODEWORD_WIDTH[27]), .B1(n84), 
        .Y(n18) );
  NAND2X1 U98 ( .A(n11), .B(n12), .Y(N77) );
  AOI22XL U99 ( .A0(NOISE[30]), .A1(n87), .B0(CODEWORD_WIDTH[30]), .B1(n84), 
        .Y(n12) );
  NAND2X1 U100 ( .A(n61), .B(n62), .Y(N52) );
  AOI22XL U101 ( .A0(DATA_IN[5]), .A1(n83), .B0(SEL[5]), .B1(n81), .Y(n61) );
  AOI22XL U102 ( .A0(NOISE[5]), .A1(n87), .B0(CODEWORD_WIDTH[5]), .B1(n85), 
        .Y(n62) );
  INVX1 U103 ( .A(n78), .Y(n77) );
  INVX1 U104 ( .A(rst), .Y(n78) );
  AOI22X1 U105 ( .A0(NOISE[10]), .A1(n86), .B0(CODEWORD_WIDTH[10]), .B1(n85), 
        .Y(n52) );
  AOI22XL U106 ( .A0(DATA_IN[21]), .A1(n82), .B0(SEL[21]), .B1(n80), .Y(n29)
         );
  AOI22X1 U107 ( .A0(NOISE[20]), .A1(n87), .B0(CODEWORD_WIDTH[20]), .B1(n84), 
        .Y(n32) );
  AOI22X1 U108 ( .A0(NOISE[11]), .A1(n86), .B0(CODEWORD_WIDTH[11]), .B1(n85), 
        .Y(n50) );
  AOI22XL U109 ( .A0(NOISE[16]), .A1(n86), .B0(CODEWORD_WIDTH[16]), .B1(n85), 
        .Y(n40) );
  AOI22X1 U110 ( .A0(NOISE[26]), .A1(n86), .B0(CODEWORD_WIDTH[26]), .B1(n84), 
        .Y(n20) );
  AOI22XL U111 ( .A0(NOISE[24]), .A1(n86), .B0(CODEWORD_WIDTH[24]), .B1(n84), 
        .Y(n24) );
  AOI22X1 U112 ( .A0(NOISE[25]), .A1(n87), .B0(CODEWORD_WIDTH[25]), .B1(n84), 
        .Y(n22) );
  AOI22X1 U113 ( .A0(NOISE[2]), .A1(n87), .B0(CODEWORD_WIDTH[2]), .B1(n84), 
        .Y(n68) );
  AOI22XL U114 ( .A0(NOISE[28]), .A1(n87), .B0(CODEWORD_WIDTH[28]), .B1(n84), 
        .Y(n16) );
  AOI22X1 U115 ( .A0(NOISE[15]), .A1(n86), .B0(CODEWORD_WIDTH[15]), .B1(n85), 
        .Y(n42) );
  AOI22XL U116 ( .A0(NOISE[13]), .A1(n86), .B0(CODEWORD_WIDTH[13]), .B1(n85), 
        .Y(n46) );
  AOI22X1 U117 ( .A0(NOISE[4]), .A1(n87), .B0(CODEWORD_WIDTH[4]), .B1(n2), .Y(
        n64) );
  AOI22X1 U118 ( .A0(NOISE[29]), .A1(n86), .B0(CODEWORD_WIDTH[29]), .B1(n84), 
        .Y(n14) );
  AOI22X1 U119 ( .A0(NOISE[14]), .A1(n86), .B0(CODEWORD_WIDTH[14]), .B1(n85), 
        .Y(n44) );
  AOI22XL U120 ( .A0(NOISE[6]), .A1(n87), .B0(CODEWORD_WIDTH[6]), .B1(n84), 
        .Y(n60) );
  AOI22X1 U121 ( .A0(NOISE[7]), .A1(n87), .B0(CODEWORD_WIDTH[7]), .B1(n2), .Y(
        n58) );
  AOI22XL U122 ( .A0(NOISE[31]), .A1(n86), .B0(CODEWORD_WIDTH[31]), .B1(n84), 
        .Y(n10) );
  BUFX20 U123 ( .A(n90), .Y(CODEWORD_WIDTH[0]) );
  AOI22XL U124 ( .A0(NOISE[0]), .A1(n87), .B0(CODEWORD_WIDTH[0]), .B1(n85), 
        .Y(n72) );
  AOI22XL U125 ( .A0(NOISE[1]), .A1(n87), .B0(CODEWORD_WIDTH[1]), .B1(n84), 
        .Y(n70) );
endmodule


module Encoder_DATA_WIDTH32_AMBA_WORD32 ( info, CODEWORD_WIDTH, codeword );
  input [31:0] info;
  input [31:0] CODEWORD_WIDTH;
  output [31:0] codeword;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n14, n16, n17, n19,
         n20, n21, n23, n24, n25, n26, n27, n28, n29, n31, n32, n33, n34, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n81, n82, n83, n84, n85, n86, n87, n88, n89, n91, n10, n15, n18,
         n22, n30, n35, n80, n90, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135;

  XOR2X4 U14 ( .A(info[12]), .B(n32), .Y(n25) );
  XOR2X4 U15 ( .A(info[18]), .B(info[14]), .Y(n32) );
  XOR2X4 U24 ( .A(n9), .B(n46), .Y(n37) );
  AOI2BB1X4 U25 ( .A0N(n41), .A1N(n30), .B0(n108), .Y(n38) );
  XNOR2X4 U26 ( .A(n47), .B(n48), .Y(n41) );
  XNOR2X4 U29 ( .A(n50), .B(info[19]), .Y(n33) );
  NOR2X4 U30 ( .A(n132), .B(n1), .Y(codeword[31]) );
  XOR2X4 U34 ( .A(n53), .B(n56), .Y(n52) );
  XOR2X4 U36 ( .A(info[8]), .B(info[9]), .Y(n44) );
  XOR2X4 U37 ( .A(info[7]), .B(info[10]), .Y(n46) );
  XNOR2X4 U40 ( .A(n58), .B(n59), .Y(n55) );
  XOR2X4 U43 ( .A(info[16]), .B(n49), .Y(n31) );
  XOR2X4 U44 ( .A(info[22]), .B(info[25]), .Y(n49) );
  AND2X4 U45 ( .A(info[23]), .B(n135), .Y(codeword[29]) );
  NOR2BX4 U48 ( .AN(info[20]), .B(n30), .Y(codeword[26]) );
  XOR2X4 U60 ( .A(n68), .B(n69), .Y(n64) );
  XOR2X4 U62 ( .A(info[20]), .B(n23), .Y(n50) );
  XOR2X4 U65 ( .A(n71), .B(n72), .Y(n68) );
  XOR2X4 U69 ( .A(info[2]), .B(info[3]), .Y(n57) );
  NOR2BX4 U72 ( .AN(info[11]), .B(n30), .Y(codeword[17]) );
  XOR2X4 U83 ( .A(n77), .B(n78), .Y(n74) );
  XOR2X4 U84 ( .A(n34), .B(n79), .Y(n78) );
  XNOR2X4 U88 ( .A(info[15]), .B(n27), .Y(n60) );
  XOR2X4 U89 ( .A(info[17]), .B(info[23]), .Y(n27) );
  XOR2X4 U90 ( .A(n81), .B(n70), .Y(n77) );
  AND4X4 U93 ( .A(n85), .B(n83), .C(n84), .D(n82), .Y(n76) );
  AND4X4 U94 ( .A(n88), .B(n89), .C(n87), .D(n86), .Y(n85) );
  NOR4X4 U101 ( .A(CODEWORD_WIDTH[23]), .B(CODEWORD_WIDTH[22]), .C(
        CODEWORD_WIDTH[21]), .D(CODEWORD_WIDTH[20]), .Y(n83) );
  NOR4X4 U102 ( .A(CODEWORD_WIDTH[1]), .B(CODEWORD_WIDTH[19]), .C(
        CODEWORD_WIDTH[18]), .D(CODEWORD_WIDTH[17]), .Y(n82) );
  XOR2X4 U104 ( .A(n75), .B(n91), .Y(n81) );
  XOR2X4 U105 ( .A(info[8]), .B(n45), .Y(n91) );
  XOR2X4 U107 ( .A(n11), .B(n42), .Y(n75) );
  XOR2X4 U108 ( .A(info[0]), .B(info[1]), .Y(n42) );
  CLKBUFX8 U2 ( .A(n107), .Y(n10) );
  OR2XL U3 ( .A(n123), .B(n14), .Y(n80) );
  INVX4 U4 ( .A(info[0]), .Y(n14) );
  OR2X4 U5 ( .A(n20), .B(n96), .Y(n90) );
  NAND3X4 U6 ( .A(n134), .B(n41), .C(n39), .Y(n40) );
  CLKINVX3 U7 ( .A(n134), .Y(n103) );
  INVX20 U8 ( .A(n30), .Y(n134) );
  XOR2X2 U9 ( .A(n23), .B(n24), .Y(n128) );
  XNOR2X2 U10 ( .A(n25), .B(info[11]), .Y(n24) );
  XNOR2X4 U11 ( .A(n21), .B(n128), .Y(n20) );
  BUFX16 U12 ( .A(n16), .Y(n108) );
  CLKINVX8 U13 ( .A(n123), .Y(n16) );
  XNOR2X4 U16 ( .A(info[2]), .B(n42), .Y(n36) );
  XOR2X2 U17 ( .A(n50), .B(n70), .Y(n69) );
  OR4X4 U18 ( .A(CODEWORD_WIDTH[16]), .B(CODEWORD_WIDTH[15]), .C(
        CODEWORD_WIDTH[14]), .D(CODEWORD_WIDTH[13]), .Y(n129) );
  XOR2X4 U19 ( .A(info[4]), .B(info[6]), .Y(n45) );
  NOR4X4 U20 ( .A(CODEWORD_WIDTH[27]), .B(CODEWORD_WIDTH[26]), .C(
        CODEWORD_WIDTH[25]), .D(CODEWORD_WIDTH[24]), .Y(n86) );
  XOR2X4 U21 ( .A(info[21]), .B(info[24]), .Y(n23) );
  XOR2X2 U22 ( .A(info[9]), .B(info[6]), .Y(n72) );
  INVX2 U23 ( .A(CODEWORD_WIDTH[0]), .Y(n95) );
  INVX8 U27 ( .A(info[5]), .Y(n9) );
  INVXL U28 ( .A(info[6]), .Y(n8) );
  XOR2X1 U31 ( .A(info[17]), .B(info[16]), .Y(n66) );
  XOR2X1 U32 ( .A(n13), .B(n57), .Y(n53) );
  OR2X2 U33 ( .A(n11), .B(n123), .Y(n109) );
  OR2X2 U35 ( .A(n61), .B(n123), .Y(n117) );
  XOR2X2 U38 ( .A(n29), .B(n124), .Y(n28) );
  XOR2X2 U39 ( .A(n25), .B(n31), .Y(n124) );
  NOR2BX2 U41 ( .AN(info[12]), .B(n30), .Y(codeword[18]) );
  BUFX20 U42 ( .A(n133), .Y(n18) );
  NOR2X4 U46 ( .A(n132), .B(n4), .Y(codeword[16]) );
  BUFX8 U47 ( .A(n107), .Y(n15) );
  BUFX3 U49 ( .A(n19), .Y(n107) );
  CLKBUFX20 U50 ( .A(n133), .Y(n22) );
  CLKBUFX20 U51 ( .A(n133), .Y(n30) );
  BUFX4 U52 ( .A(n17), .Y(n106) );
  OAI222X4 U53 ( .A0(n73), .A1(n123), .B0(n74), .B1(n131), .C0(n75), .C1(n15), 
        .Y(codeword[0]) );
  XOR2X1 U54 ( .A(n81), .B(info[10]), .Y(n73) );
  BUFX20 U55 ( .A(n106), .Y(n123) );
  CLKINVX3 U56 ( .A(info[4]), .Y(n98) );
  INVX1 U57 ( .A(info[2]), .Y(n12) );
  XOR2X2 U58 ( .A(n43), .B(n44), .Y(n39) );
  INVX4 U59 ( .A(n122), .Y(n96) );
  AND2X2 U61 ( .A(info[16]), .B(n122), .Y(codeword[22]) );
  INVX8 U63 ( .A(n132), .Y(n122) );
  AND2X4 U64 ( .A(n100), .B(n102), .Y(n35) );
  AND2X2 U66 ( .A(info[18]), .B(n134), .Y(codeword[24]) );
  INVX3 U67 ( .A(n22), .Y(n135) );
  OR2X1 U68 ( .A(n13), .B(n15), .Y(n92) );
  NAND3X4 U70 ( .A(n80), .B(n90), .C(n92), .Y(codeword[5]) );
  INVX4 U71 ( .A(info[1]), .Y(n13) );
  XOR2X4 U73 ( .A(n60), .B(n31), .Y(n58) );
  OAI22X4 U74 ( .A0(n123), .A1(n6), .B0(n131), .B1(n7), .Y(codeword[13]) );
  NOR2X4 U75 ( .A(n131), .B(n2), .Y(codeword[30]) );
  NOR2X4 U76 ( .A(n93), .B(n18), .Y(codeword[25]) );
  CLKINVX20 U77 ( .A(info[19]), .Y(n93) );
  BUFX4 U78 ( .A(n106), .Y(n130) );
  OR2X2 U79 ( .A(n123), .B(n98), .Y(n111) );
  NOR2X4 U80 ( .A(n94), .B(n131), .Y(codeword[19]) );
  CLKINVX20 U81 ( .A(info[13]), .Y(n94) );
  XOR2X4 U82 ( .A(info[13]), .B(info[11]), .Y(n125) );
  XOR2X1 U85 ( .A(info[13]), .B(info[12]), .Y(n67) );
  XOR2X2 U86 ( .A(info[25]), .B(info[10]), .Y(n70) );
  NAND2X4 U87 ( .A(n35), .B(n101), .Y(codeword[6]) );
  OR2X4 U91 ( .A(n123), .B(n13), .Y(n100) );
  OR2X4 U92 ( .A(n12), .B(n10), .Y(n102) );
  NAND2X4 U95 ( .A(n95), .B(n76), .Y(n19) );
  XOR2XL U96 ( .A(info[7]), .B(info[10]), .Y(n97) );
  XOR2X2 U97 ( .A(n68), .B(info[10]), .Y(n61) );
  XOR2X4 U98 ( .A(n63), .B(info[5]), .Y(n71) );
  CLKINVXL U99 ( .A(info[25]), .Y(n1) );
  OR2X4 U100 ( .A(n123), .B(n4), .Y(n120) );
  XOR2X4 U103 ( .A(n37), .B(n98), .Y(n127) );
  OAI2BB2X4 U106 ( .B0(n22), .B1(n6), .A0N(n16), .A1N(n99), .Y(codeword[14])
         );
  CLKINVX20 U109 ( .A(n5), .Y(n99) );
  OR2X2 U110 ( .A(n132), .B(n9), .Y(n116) );
  OR2X4 U111 ( .A(n30), .B(n14), .Y(n101) );
  BUFX20 U112 ( .A(n132), .Y(n131) );
  OR2X4 U113 ( .A(n22), .B(n12), .Y(n110) );
  NOR2X4 U114 ( .A(n104), .B(n132), .Y(codeword[27]) );
  CLKINVX20 U115 ( .A(info[21]), .Y(n104) );
  NOR2X4 U116 ( .A(n18), .B(n105), .Y(codeword[21]) );
  CLKINVX20 U117 ( .A(info[15]), .Y(n105) );
  NAND2X4 U118 ( .A(CODEWORD_WIDTH[0]), .B(n76), .Y(n17) );
  CLKINVX20 U119 ( .A(n126), .Y(n133) );
  OR2X4 U120 ( .A(n62), .B(n103), .Y(n118) );
  XOR2X4 U121 ( .A(n26), .B(n27), .Y(n21) );
  XOR2X4 U122 ( .A(n33), .B(n49), .Y(n47) );
  NOR3BX4 U123 ( .AN(n114), .B(CODEWORD_WIDTH[7]), .C(CODEWORD_WIDTH[6]), .Y(
        n89) );
  OR2X1 U124 ( .A(n63), .B(n15), .Y(n119) );
  OAI222X4 U125 ( .A0(n130), .A1(n26), .B0(n28), .B1(n22), .C0(n15), .C1(n14), 
        .Y(codeword[4]) );
  CLKINVX20 U126 ( .A(n126), .Y(n132) );
  XOR2X4 U127 ( .A(n64), .B(n65), .Y(n62) );
  OR2X2 U128 ( .A(n123), .B(n8), .Y(n115) );
  NOR2X4 U129 ( .A(n113), .B(CODEWORD_WIDTH[31]), .Y(n88) );
  OR2X4 U130 ( .A(n132), .B(n5), .Y(n121) );
  NAND2X4 U131 ( .A(n109), .B(n110), .Y(codeword[8]) );
  OR2X4 U132 ( .A(n22), .B(n11), .Y(n112) );
  NAND2X4 U133 ( .A(n111), .B(n112), .Y(codeword[9]) );
  OR3X4 U134 ( .A(CODEWORD_WIDTH[5]), .B(CODEWORD_WIDTH[4]), .C(
        CODEWORD_WIDTH[3]), .Y(n113) );
  NOR2X4 U135 ( .A(CODEWORD_WIDTH[9]), .B(CODEWORD_WIDTH[8]), .Y(n114) );
  INVX20 U136 ( .A(info[3]), .Y(n11) );
  NAND2X4 U137 ( .A(n115), .B(n116), .Y(codeword[11]) );
  NOR4X4 U138 ( .A(CODEWORD_WIDTH[30]), .B(CODEWORD_WIDTH[2]), .C(
        CODEWORD_WIDTH[29]), .D(CODEWORD_WIDTH[28]), .Y(n87) );
  NAND3X4 U139 ( .A(n117), .B(n118), .C(n119), .Y(codeword[1]) );
  XOR2X4 U140 ( .A(n14), .B(n57), .Y(n63) );
  INVXL U141 ( .A(info[10]), .Y(n4) );
  INVXL U142 ( .A(info[9]), .Y(n5) );
  NAND2X4 U143 ( .A(n120), .B(n121), .Y(codeword[15]) );
  XOR2XL U144 ( .A(info[24]), .B(info[14]), .Y(n59) );
  NOR2X2 U145 ( .A(n131), .B(n3), .Y(codeword[23]) );
  XNOR2X4 U146 ( .A(n60), .B(n125), .Y(n34) );
  AOI2BB1X4 U147 ( .A0N(n55), .A1N(n96), .B0(n108), .Y(n51) );
  INVXL U148 ( .A(info[8]), .Y(n6) );
  NAND3X4 U149 ( .A(n134), .B(n55), .C(n52), .Y(n54) );
  XOR2X4 U150 ( .A(n33), .B(n34), .Y(n29) );
  AND2X4 U151 ( .A(info[22]), .B(n134), .Y(codeword[28]) );
  AND2X4 U152 ( .A(n17), .B(n19), .Y(n126) );
  INVXL U153 ( .A(info[17]), .Y(n3) );
  XOR2X4 U154 ( .A(n127), .B(n36), .Y(n26) );
  INVXL U155 ( .A(info[24]), .Y(n2) );
  INVXL U156 ( .A(info[7]), .Y(n7) );
  NOR4X4 U157 ( .A(n129), .B(CODEWORD_WIDTH[12]), .C(CODEWORD_WIDTH[10]), .D(
        CODEWORD_WIDTH[11]), .Y(n84) );
  XOR2XL U158 ( .A(info[23]), .B(info[18]), .Y(n48) );
  XOR2X1 U159 ( .A(info[21]), .B(info[19]), .Y(n79) );
  NOR2BXL U160 ( .AN(info[14]), .B(n22), .Y(codeword[20]) );
  XOR2X2 U161 ( .A(n66), .B(n67), .Y(n65) );
  OAI22X2 U162 ( .A0(n130), .A1(n9), .B0(n22), .B1(n98), .Y(codeword[10]) );
  OAI22X2 U163 ( .A0(n130), .A1(n7), .B0(n30), .B1(n8), .Y(codeword[12]) );
  XOR2X1 U164 ( .A(n97), .B(n44), .Y(n56) );
  XOR2X1 U165 ( .A(n37), .B(n45), .Y(n43) );
  OAI221X4 U166 ( .A0(n38), .A1(n39), .B0(n36), .B1(n15), .C0(n40), .Y(
        codeword[3]) );
  OAI221X4 U167 ( .A0(n51), .A1(n52), .B0(n53), .B1(n15), .C0(n54), .Y(
        codeword[2]) );
  OAI222X4 U168 ( .A0(n123), .A1(n12), .B0(n18), .B1(n13), .C0(n11), .C1(n15), 
        .Y(codeword[7]) );
endmodule


module Matrix_Mult_DATA_WIDTH32_AMBA_WORD32 ( CODEWORD_WIDTH, codeword_y, 
        s_vector );
  input [31:0] CODEWORD_WIDTH;
  input [31:0] codeword_y;
  output [31:0] s_vector;
  wire   n1, n2, n3, n4, n6, n9, n10, n11, n15, n16, n18, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n42, n43, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n59, n60, n61, n64, n65, n66, n67, n69, n70, n73, n75, n76,
         n77, n78, n80, n81, n82, n87, n88, n89, n90, n91, n92, n93, n94, n5,
         n7, n8, n12, n13, n14, n17, n19, n39, n40, n41, n44, n58, n62, n63,
         n68, n71, n72, n74, n79, n83, n84, n85, n86, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133;
  assign s_vector[6] = 1'b0;
  assign s_vector[7] = 1'b0;
  assign s_vector[8] = 1'b0;
  assign s_vector[9] = 1'b0;
  assign s_vector[10] = 1'b0;
  assign s_vector[11] = 1'b0;
  assign s_vector[12] = 1'b0;
  assign s_vector[13] = 1'b0;
  assign s_vector[14] = 1'b0;
  assign s_vector[15] = 1'b0;
  assign s_vector[16] = 1'b0;
  assign s_vector[17] = 1'b0;
  assign s_vector[18] = 1'b0;
  assign s_vector[19] = 1'b0;
  assign s_vector[20] = 1'b0;
  assign s_vector[21] = 1'b0;
  assign s_vector[22] = 1'b0;
  assign s_vector[23] = 1'b0;
  assign s_vector[24] = 1'b0;
  assign s_vector[25] = 1'b0;
  assign s_vector[26] = 1'b0;
  assign s_vector[27] = 1'b0;
  assign s_vector[28] = 1'b0;
  assign s_vector[29] = 1'b0;
  assign s_vector[30] = 1'b0;
  assign s_vector[31] = 1'b0;

  XOR2X4 U16 ( .A(n29), .B(n5), .Y(n22) );
  XOR2X4 U18 ( .A(n32), .B(n33), .Y(n31) );
  XOR2X4 U21 ( .A(n21), .B(n34), .Y(n30) );
  XOR2X4 U32 ( .A(n45), .B(n46), .Y(n43) );
  XOR2X4 U36 ( .A(n49), .B(n50), .Y(n45) );
  XOR2X4 U38 ( .A(n74), .B(n53), .Y(n49) );
  XOR2X4 U42 ( .A(n74), .B(codeword_y[12]), .Y(n38) );
  XNOR2X4 U43 ( .A(codeword_y[13]), .B(n56), .Y(n52) );
  XNOR2X4 U46 ( .A(n62), .B(codeword_y[1]), .Y(n60) );
  XOR2X4 U49 ( .A(n65), .B(n12), .Y(n61) );
  XOR2X4 U53 ( .A(n35), .B(codeword_y[18]), .Y(n67) );
  XOR2X4 U54 ( .A(n7), .B(codeword_y[26]), .Y(n35) );
  XOR2X4 U55 ( .A(codeword_y[23]), .B(codeword_y[22]), .Y(n51) );
  XOR2X4 U60 ( .A(codeword_y[7]), .B(codeword_y[8]), .Y(n53) );
  XOR2X4 U62 ( .A(codeword_y[14]), .B(codeword_y[15]), .Y(n56) );
  XOR2X4 U65 ( .A(n76), .B(n62), .Y(n29) );
  XOR2X4 U70 ( .A(n80), .B(codeword_y[14]), .Y(n78) );
  XOR2X4 U71 ( .A(n81), .B(n82), .Y(n80) );
  XOR2X4 U74 ( .A(n133), .B(codeword_y[7]), .Y(n55) );
  XOR2X4 U96 ( .A(codeword_y[0]), .B(codeword_y[5]), .Y(n76) );
  XOR2X4 U100 ( .A(codeword_y[11]), .B(codeword_y[9]), .Y(n37) );
  XOR2X2 U2 ( .A(n109), .B(n36), .Y(n34) );
  BUFX8 U3 ( .A(n28), .Y(n5) );
  CLKINVX3 U4 ( .A(n18), .Y(n44) );
  BUFX20 U5 ( .A(n114), .Y(n7) );
  CLKINVX3 U6 ( .A(n112), .Y(n102) );
  BUFX16 U7 ( .A(codeword_y[3]), .Y(n19) );
  XOR2X4 U8 ( .A(n47), .B(n48), .Y(n46) );
  BUFX20 U9 ( .A(codeword_y[4]), .Y(n62) );
  CLKINVX3 U10 ( .A(n10), .Y(n1) );
  OR2X4 U11 ( .A(n59), .B(n26), .Y(n85) );
  OR2X4 U12 ( .A(n42), .B(n26), .Y(n98) );
  NAND2BX2 U13 ( .AN(CODEWORD_WIDTH[0]), .B(n77), .Y(n26) );
  BUFX8 U14 ( .A(n64), .Y(n111) );
  INVX4 U15 ( .A(codeword_y[10]), .Y(n2) );
  CLKINVX3 U17 ( .A(codeword_y[8]), .Y(n86) );
  INVX1 U19 ( .A(n5), .Y(n3) );
  INVX1 U20 ( .A(n11), .Y(n68) );
  XOR2X1 U22 ( .A(n4), .B(codeword_y[19]), .Y(n121) );
  INVX1 U23 ( .A(n62), .Y(n4) );
  CLKINVX3 U24 ( .A(n6), .Y(n128) );
  NAND2X2 U25 ( .A(CODEWORD_WIDTH[0]), .B(n77), .Y(n11) );
  XOR2X2 U26 ( .A(codeword_y[13]), .B(n95), .Y(n119) );
  XNOR2X4 U27 ( .A(n61), .B(n8), .Y(n79) );
  XOR2X2 U28 ( .A(n100), .B(n111), .Y(n8) );
  XOR2X2 U29 ( .A(codeword_y[2]), .B(codeword_y[21]), .Y(n48) );
  BUFX20 U30 ( .A(n20), .Y(n12) );
  XOR2XL U31 ( .A(codeword_y[24]), .B(n16), .Y(n15) );
  XOR2X4 U33 ( .A(codeword_y[31]), .B(codeword_y[27]), .Y(n114) );
  OAI222X4 U34 ( .A0(n23), .A1(n11), .B0(n24), .B1(n6), .C0(n25), .C1(n26), 
        .Y(s_vector[3]) );
  XOR2X4 U35 ( .A(codeword_y[16]), .B(codeword_y[19]), .Y(n13) );
  NAND2X2 U37 ( .A(n11), .B(n26), .Y(n6) );
  XNOR2X1 U39 ( .A(n5), .B(codeword_y[5]), .Y(n42) );
  XOR2X2 U40 ( .A(n54), .B(n3), .Y(n71) );
  AND4X2 U41 ( .A(n87), .B(n88), .C(n89), .D(n90), .Y(n77) );
  XOR2X2 U44 ( .A(n118), .B(n119), .Y(n73) );
  XOR2X2 U45 ( .A(codeword_y[5]), .B(codeword_y[1]), .Y(n117) );
  XOR2X2 U47 ( .A(n38), .B(codeword_y[8]), .Y(n54) );
  XOR2X4 U48 ( .A(n14), .B(n17), .Y(n82) );
  XOR2X4 U50 ( .A(codeword_y[12]), .B(n13), .Y(n14) );
  XOR2X4 U51 ( .A(n55), .B(n108), .Y(n17) );
  INVX12 U52 ( .A(n7), .Y(n107) );
  XOR2X2 U56 ( .A(codeword_y[11]), .B(n117), .Y(n70) );
  XOR2X2 U57 ( .A(n66), .B(n111), .Y(n118) );
  XOR2X2 U58 ( .A(n39), .B(codeword_y[26]), .Y(n109) );
  INVX8 U59 ( .A(n107), .Y(n39) );
  XOR2X2 U61 ( .A(codeword_y[14]), .B(codeword_y[15]), .Y(n40) );
  XOR2X4 U63 ( .A(n66), .B(n41), .Y(n20) );
  CLKINVX20 U64 ( .A(codeword_y[1]), .Y(n41) );
  XOR2X4 U66 ( .A(n43), .B(n44), .Y(n72) );
  XOR2X4 U67 ( .A(n78), .B(n58), .Y(n129) );
  XNOR2XL U68 ( .A(codeword_y[29]), .B(codeword_y[23]), .Y(n58) );
  XOR2X4 U69 ( .A(n133), .B(codeword_y[7]), .Y(n63) );
  XOR2XL U72 ( .A(codeword_y[9]), .B(codeword_y[31]), .Y(n47) );
  XOR2X1 U73 ( .A(n21), .B(n37), .Y(n23) );
  NAND2X4 U75 ( .A(n71), .B(n68), .Y(n96) );
  XOR2XL U76 ( .A(n19), .B(codeword_y[1]), .Y(n27) );
  NAND2X4 U77 ( .A(n72), .B(n128), .Y(n97) );
  XOR2X2 U78 ( .A(codeword_y[0]), .B(codeword_y[5]), .Y(n95) );
  XOR2X4 U79 ( .A(n116), .B(n53), .Y(n69) );
  BUFX20 U80 ( .A(n52), .Y(n74) );
  XOR2X1 U81 ( .A(codeword_y[12]), .B(n13), .Y(n100) );
  NAND2X4 U82 ( .A(n79), .B(n128), .Y(n84) );
  OR2X4 U83 ( .A(n57), .B(n11), .Y(n83) );
  NAND3X4 U84 ( .A(n84), .B(n83), .C(n85), .Y(s_vector[1]) );
  XOR2X2 U85 ( .A(n69), .B(n70), .Y(n57) );
  XNOR2X1 U86 ( .A(n40), .B(codeword_y[10]), .Y(n116) );
  AND4X2 U87 ( .A(n91), .B(n92), .C(n93), .D(n94), .Y(n90) );
  XOR2X4 U88 ( .A(n86), .B(n37), .Y(n66) );
  NAND3X4 U89 ( .A(n97), .B(n96), .C(n98), .Y(s_vector[2]) );
  AND2X4 U90 ( .A(n99), .B(n128), .Y(s_vector[5]) );
  XOR2X4 U91 ( .A(n122), .B(n13), .Y(n99) );
  XNOR2X1 U92 ( .A(n22), .B(n27), .Y(n25) );
  CLKINVX8 U93 ( .A(n103), .Y(s_vector[4]) );
  XOR2X4 U94 ( .A(n101), .B(n12), .Y(n9) );
  XOR2X4 U95 ( .A(n22), .B(n21), .Y(n101) );
  XNOR2X1 U97 ( .A(codeword_y[7]), .B(n29), .Y(n75) );
  XOR2X4 U98 ( .A(n113), .B(n102), .Y(n65) );
  INVX8 U99 ( .A(n110), .Y(n113) );
  AOI2BB2X4 U101 ( .B0(n104), .B1(n128), .A0N(n9), .A1N(n11), .Y(n103) );
  XNOR2X4 U102 ( .A(n10), .B(n121), .Y(n104) );
  XOR2X1 U103 ( .A(n133), .B(codeword_y[15]), .Y(n64) );
  XOR2X4 U104 ( .A(n105), .B(n106), .Y(n81) );
  XOR2X4 U105 ( .A(codeword_y[0]), .B(n16), .Y(n105) );
  XOR2X4 U106 ( .A(codeword_y[9]), .B(n2), .Y(n106) );
  CLKINVX8 U107 ( .A(n107), .Y(n108) );
  XOR2X4 U108 ( .A(n113), .B(n18), .Y(n115) );
  XOR2X4 U109 ( .A(n67), .B(n51), .Y(n110) );
  INVXL U110 ( .A(codeword_y[30]), .Y(n112) );
  XOR2X4 U111 ( .A(n36), .B(codeword_y[20]), .Y(n18) );
  XOR2X4 U112 ( .A(n1), .B(n9), .Y(n122) );
  XOR2X4 U113 ( .A(n19), .B(n2), .Y(n124) );
  XOR2X1 U114 ( .A(codeword_y[25]), .B(codeword_y[24]), .Y(n32) );
  XOR2XL U115 ( .A(codeword_y[16]), .B(codeword_y[11]), .Y(n33) );
  INVX8 U116 ( .A(n31), .Y(n120) );
  XNOR2X4 U117 ( .A(n115), .B(n15), .Y(n10) );
  INVX8 U118 ( .A(n123), .Y(n21) );
  XNOR2X4 U119 ( .A(n30), .B(n120), .Y(n24) );
  XOR2X4 U120 ( .A(n38), .B(n124), .Y(n123) );
  XOR2X4 U121 ( .A(n125), .B(codeword_y[17]), .Y(n16) );
  XOR2X4 U122 ( .A(codeword_y[21]), .B(codeword_y[25]), .Y(n125) );
  XOR2X4 U123 ( .A(n126), .B(codeword_y[28]), .Y(n36) );
  XOR2X4 U124 ( .A(codeword_y[29]), .B(codeword_y[30]), .Y(n126) );
  NOR4XL U125 ( .A(n127), .B(CODEWORD_WIDTH[12]), .C(CODEWORD_WIDTH[10]), .D(
        CODEWORD_WIDTH[11]), .Y(n89) );
  OR4XL U126 ( .A(CODEWORD_WIDTH[16]), .B(CODEWORD_WIDTH[15]), .C(
        CODEWORD_WIDTH[14]), .D(CODEWORD_WIDTH[13]), .Y(n127) );
  NOR4XL U127 ( .A(CODEWORD_WIDTH[23]), .B(CODEWORD_WIDTH[22]), .C(
        CODEWORD_WIDTH[21]), .D(CODEWORD_WIDTH[20]), .Y(n88) );
  NOR4XL U128 ( .A(CODEWORD_WIDTH[27]), .B(CODEWORD_WIDTH[26]), .C(
        CODEWORD_WIDTH[25]), .D(CODEWORD_WIDTH[24]), .Y(n91) );
  NOR4XL U129 ( .A(CODEWORD_WIDTH[30]), .B(CODEWORD_WIDTH[2]), .C(
        CODEWORD_WIDTH[29]), .D(CODEWORD_WIDTH[28]), .Y(n92) );
  NOR4XL U130 ( .A(CODEWORD_WIDTH[5]), .B(CODEWORD_WIDTH[4]), .C(
        CODEWORD_WIDTH[3]), .D(CODEWORD_WIDTH[31]), .Y(n93) );
  NOR4XL U131 ( .A(CODEWORD_WIDTH[9]), .B(CODEWORD_WIDTH[8]), .C(
        CODEWORD_WIDTH[7]), .D(CODEWORD_WIDTH[6]), .Y(n94) );
  NAND2X4 U132 ( .A(n129), .B(n128), .Y(n131) );
  XOR2X2 U133 ( .A(codeword_y[16]), .B(n51), .Y(n50) );
  OR2X4 U134 ( .A(n73), .B(n11), .Y(n130) );
  OR2X4 U135 ( .A(n75), .B(n26), .Y(n132) );
  NAND3X4 U136 ( .A(n132), .B(n130), .C(n131), .Y(s_vector[0]) );
  BUFX20 U137 ( .A(codeword_y[6]), .Y(n133) );
  XOR2X4 U138 ( .A(n63), .B(codeword_y[2]), .Y(n28) );
  XOR2XL U139 ( .A(n60), .B(n63), .Y(n59) );
  NOR4XL U140 ( .A(CODEWORD_WIDTH[1]), .B(CODEWORD_WIDTH[19]), .C(
        CODEWORD_WIDTH[18]), .D(CODEWORD_WIDTH[17]), .Y(n87) );
endmodule


module Error_Locator_DATA_WIDTH32_AMBA_WORD32 ( CODEWORD_WIDTH, s_vector, 
        err_location );
  input [31:0] CODEWORD_WIDTH;
  input [31:0] s_vector;
  output [31:0] err_location;
  wire   n120, n121, n122, n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n51, n52, n9, n40, n50, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n97, n98,
         n99, n100, n101, n102, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119;

  NAND2X4 U14 ( .A(n58), .B(n37), .Y(n20) );
  NAND3X4 U19 ( .A(n94), .B(n7), .C(s_vector[2]), .Y(n19) );
  OAI21X4 U22 ( .A0(n9), .A1(n38), .B0(n98), .Y(err_location[28]) );
  OAI21X4 U24 ( .A0(n16), .A1(n43), .B0(n108), .Y(err_location[27]) );
  OAI21X4 U26 ( .A0(n21), .A1(n43), .B0(n92), .Y(err_location[25]) );
  OAI21X4 U31 ( .A0(n21), .A1(n45), .B0(n101), .Y(err_location[21]) );
  OAI21X4 U32 ( .A0(n30), .A1(n45), .B0(n98), .Y(err_location[20]) );
  OAI21X4 U35 ( .A0(n16), .A1(n29), .B0(n101), .Y(err_location[19]) );
  OAI21X4 U36 ( .A0(n17), .A1(n29), .B0(n108), .Y(n120) );
  NAND2BX4 U46 ( .AN(n18), .B(n42), .Y(n16) );
  AOI211X4 U60 ( .A0(n49), .A1(n6), .B0(s_vector[5]), .C0(n3), .Y(n52) );
  NOR2X4 U61 ( .A(n51), .B(n95), .Y(n49) );
  NAND2X4 U62 ( .A(n116), .B(n8), .Y(n51) );
  NOR2X4 U73 ( .A(n7), .B(s_vector[2]), .Y(n44) );
  NOR2X4 U74 ( .A(s_vector[0]), .B(s_vector[1]), .Y(n32) );
  CLKINVX8 U78 ( .A(n40), .Y(n4) );
  INVX12 U3 ( .A(s_vector[1]), .Y(n11) );
  BUFX8 U4 ( .A(n35), .Y(n106) );
  BUFX20 U5 ( .A(n122), .Y(err_location[5]) );
  BUFX3 U6 ( .A(n12), .Y(n9) );
  CLKINVXL U7 ( .A(n116), .Y(n12) );
  BUFX20 U8 ( .A(n121), .Y(err_location[12]) );
  CLKINVX20 U9 ( .A(n59), .Y(n60) );
  BUFX16 U10 ( .A(n11), .Y(n102) );
  BUFX20 U11 ( .A(n19), .Y(n40) );
  INVX8 U12 ( .A(n117), .Y(n118) );
  INVX12 U13 ( .A(n6), .Y(n117) );
  CLKINVX2 U15 ( .A(n43), .Y(n77) );
  OR2X2 U16 ( .A(n16), .B(n61), .Y(n79) );
  OR2X2 U17 ( .A(n10), .B(n20), .Y(n78) );
  CLKINVX4 U18 ( .A(n17), .Y(n90) );
  INVX1 U20 ( .A(n18), .Y(n80) );
  CLKINVX3 U21 ( .A(n13), .Y(n84) );
  BUFX8 U23 ( .A(n120), .Y(err_location[18]) );
  CLKINVX2 U25 ( .A(n116), .Y(n50) );
  CLKINVX3 U27 ( .A(n50), .Y(n53) );
  INVX8 U28 ( .A(n95), .Y(n72) );
  BUFX12 U29 ( .A(s_vector[3]), .Y(n95) );
  CLKBUFX20 U30 ( .A(n107), .Y(n98) );
  DLY1X1 U33 ( .A(s_vector[0]), .Y(n54) );
  OR2X4 U34 ( .A(n10), .B(n104), .Y(n55) );
  OR2X4 U37 ( .A(n21), .B(n105), .Y(n56) );
  NAND3X2 U38 ( .A(n55), .B(n56), .C(n108), .Y(err_location[14]) );
  BUFX8 U39 ( .A(n47), .Y(n104) );
  BUFX8 U40 ( .A(n46), .Y(n105) );
  NAND2X2 U41 ( .A(n116), .B(n8), .Y(n68) );
  NAND2X2 U42 ( .A(n42), .B(n53), .Y(n30) );
  INVX2 U43 ( .A(n36), .Y(n57) );
  INVX8 U44 ( .A(n57), .Y(n58) );
  CLKINVX3 U45 ( .A(n44), .Y(n59) );
  BUFX20 U47 ( .A(n25), .Y(n61) );
  BUFX20 U48 ( .A(n24), .Y(n62) );
  BUFX12 U49 ( .A(n110), .Y(n63) );
  INVX12 U50 ( .A(n23), .Y(n10) );
  OR2X4 U51 ( .A(n6), .B(n48), .Y(n64) );
  INVX4 U52 ( .A(n9), .Y(n97) );
  CLKINVX8 U53 ( .A(n38), .Y(n81) );
  AND2X2 U54 ( .A(n8), .B(n7), .Y(n65) );
  INVX8 U55 ( .A(s_vector[2]), .Y(n8) );
  INVX8 U56 ( .A(n63), .Y(n45) );
  NOR2X1 U57 ( .A(CODEWORD_WIDTH[1]), .B(CODEWORD_WIDTH[0]), .Y(n37) );
  OR2X2 U58 ( .A(n48), .B(s_vector[4]), .Y(n66) );
  OR2X4 U59 ( .A(n49), .B(n66), .Y(n99) );
  OR2X4 U63 ( .A(n16), .B(n105), .Y(n91) );
  OR2X4 U64 ( .A(n52), .B(n67), .Y(n24) );
  NAND2BX4 U65 ( .AN(n100), .B(n99), .Y(n67) );
  NAND3BX4 U66 ( .AN(s_vector[2]), .B(n118), .C(n114), .Y(n25) );
  OR2X4 U67 ( .A(n18), .B(n104), .Y(n69) );
  OR2X4 U68 ( .A(n17), .B(n105), .Y(n70) );
  NAND3X2 U69 ( .A(n69), .B(n70), .C(n101), .Y(err_location[15]) );
  NAND3X2 U70 ( .A(n73), .B(n74), .C(n101), .Y(err_location[1]) );
  NAND3BX4 U71 ( .AN(n71), .B(n76), .C(n98), .Y(err_location[0]) );
  NOR2X2 U72 ( .A(n9), .B(n28), .Y(n71) );
  OAI2BB1X4 U75 ( .A0N(n23), .A1N(n81), .B0(n98), .Y(err_location[30]) );
  AND2X4 U76 ( .A(s_vector[5]), .B(n72), .Y(n41) );
  OR2X1 U77 ( .A(n13), .B(n28), .Y(n73) );
  OR2X4 U79 ( .A(n1), .B(n10), .Y(n74) );
  NAND2X2 U80 ( .A(n58), .B(n118), .Y(n46) );
  NAND2X2 U81 ( .A(n58), .B(n94), .Y(n47) );
  CLKINVX4 U82 ( .A(n38), .Y(n85) );
  OR2X4 U83 ( .A(n1), .B(n13), .Y(n76) );
  CLKBUFX20 U84 ( .A(n107), .Y(n101) );
  OAI2BB1X4 U85 ( .A0N(n90), .A1N(n77), .B0(n98), .Y(err_location[26]) );
  NAND3X4 U86 ( .A(n78), .B(n79), .C(n26), .Y(err_location[6]) );
  OAI2BB1X4 U87 ( .A0N(n80), .A1N(n81), .B0(n101), .Y(err_location[31]) );
  OR2X2 U88 ( .A(n18), .B(n20), .Y(n82) );
  OR2X2 U89 ( .A(n15), .B(n21), .Y(n83) );
  NAND3X4 U90 ( .A(n82), .B(n83), .C(n22), .Y(err_location[7]) );
  NOR3BX4 U91 ( .AN(n114), .B(n111), .C(n112), .Y(n110) );
  BUFX20 U92 ( .A(n32), .Y(n116) );
  OAI2BB1X4 U93 ( .A0N(n84), .A1N(n85), .B0(n101), .Y(err_location[29]) );
  OAI2BB1X4 U94 ( .A0N(n34), .A1N(n97), .B0(n98), .Y(err_location[3]) );
  OAI211X4 U95 ( .A0(n106), .A1(n3), .B0(n14), .C0(n20), .Y(n34) );
  INVX8 U96 ( .A(n115), .Y(n92) );
  OR2X2 U97 ( .A(n15), .B(n17), .Y(n86) );
  OR2X2 U98 ( .A(n18), .B(n40), .Y(n87) );
  NAND3X4 U99 ( .A(n86), .B(n87), .C(n98), .Y(err_location[8]) );
  OR2X2 U100 ( .A(n18), .B(n28), .Y(n88) );
  OR2X2 U101 ( .A(n29), .B(n30), .Y(n89) );
  NAND3X4 U102 ( .A(n88), .B(n89), .C(n31), .Y(err_location[4]) );
  OAI2BB1X4 U103 ( .A0N(n90), .A1N(n63), .B0(n101), .Y(err_location[22]) );
  NAND2X4 U104 ( .A(n91), .B(n101), .Y(err_location[16]) );
  CLKINVX8 U105 ( .A(s_vector[4]), .Y(n6) );
  BUFX8 U106 ( .A(n62), .Y(n115) );
  AOI21X2 U107 ( .A0(n4), .A1(n113), .B0(n62), .Y(n26) );
  AND3X2 U108 ( .A(n68), .B(n7), .C(n37), .Y(n100) );
  AOI21X4 U109 ( .A0(n97), .A1(n33), .B0(n115), .Y(n31) );
  NAND3X4 U110 ( .A(n114), .B(n118), .C(s_vector[2]), .Y(n15) );
  OAI21X4 U111 ( .A0(n3), .A1(n61), .B0(n27), .Y(n93) );
  NOR2X4 U112 ( .A(n119), .B(n115), .Y(n39) );
  INVX8 U113 ( .A(n64), .Y(n94) );
  INVX8 U114 ( .A(n93), .Y(n1) );
  OAI221X2 U115 ( .A0(n14), .A1(n10), .B0(n21), .B1(n106), .C0(n108), .Y(
        err_location[10]) );
  OAI21X4 U116 ( .A0(n16), .A1(n45), .B0(n108), .Y(err_location[23]) );
  NAND2X2 U117 ( .A(n60), .B(n6), .Y(n35) );
  NAND2X4 U118 ( .A(n94), .B(n60), .Y(n14) );
  NAND2X4 U119 ( .A(n60), .B(s_vector[4]), .Y(n43) );
  OAI21X4 U120 ( .A0(n30), .A1(n43), .B0(n108), .Y(err_location[24]) );
  NAND2X4 U121 ( .A(s_vector[0]), .B(s_vector[1]), .Y(n18) );
  AOI21X4 U122 ( .A0(n4), .A1(n23), .B0(n115), .Y(n22) );
  BUFX20 U123 ( .A(n41), .Y(n114) );
  BUFX20 U124 ( .A(n2), .Y(n107) );
  INVX8 U125 ( .A(n62), .Y(n2) );
  OAI21X4 U126 ( .A0(n3), .A1(n61), .B0(n27), .Y(n33) );
  NAND2X4 U127 ( .A(n65), .B(n94), .Y(n27) );
  CLKBUFX20 U128 ( .A(n2), .Y(n108) );
  NAND2X4 U129 ( .A(n60), .B(n37), .Y(n28) );
  INVX1 U130 ( .A(n42), .Y(n3) );
  NAND3X4 U131 ( .A(s_vector[4]), .B(n42), .C(n58), .Y(n38) );
  NAND2X4 U132 ( .A(n23), .B(n42), .Y(n17) );
  NAND2X4 U133 ( .A(n113), .B(n42), .Y(n21) );
  NOR2X2 U134 ( .A(n5), .B(CODEWORD_WIDTH[0]), .Y(n42) );
  OR2X2 U135 ( .A(n21), .B(n29), .Y(n109) );
  NAND2X4 U136 ( .A(n109), .B(n101), .Y(err_location[17]) );
  NAND3X4 U137 ( .A(s_vector[4]), .B(n8), .C(n114), .Y(n29) );
  INVXL U138 ( .A(s_vector[4]), .Y(n111) );
  INVXL U139 ( .A(s_vector[2]), .Y(n112) );
  AND2X2 U140 ( .A(s_vector[0]), .B(n102), .Y(n113) );
  NOR2X4 U141 ( .A(n102), .B(s_vector[0]), .Y(n23) );
  NOR2X4 U142 ( .A(n8), .B(n7), .Y(n36) );
  INVX20 U143 ( .A(s_vector[3]), .Y(n7) );
  NAND2X2 U144 ( .A(n54), .B(n102), .Y(n13) );
  INVXL U145 ( .A(CODEWORD_WIDTH[1]), .Y(n5) );
  NOR2X4 U146 ( .A(n40), .B(n9), .Y(n119) );
  NAND2XL U147 ( .A(CODEWORD_WIDTH[0]), .B(n5), .Y(n48) );
  OAI221X4 U148 ( .A0(n13), .A1(n104), .B0(n30), .B1(n105), .C0(n92), .Y(
        err_location[13]) );
  OAI221X4 U149 ( .A0(n14), .A1(n18), .B0(n17), .B1(n106), .C0(n108), .Y(
        err_location[11]) );
  OAI221X4 U150 ( .A0(n10), .A1(n28), .B0(n15), .B1(n30), .C0(n39), .Y(
        err_location[2]) );
  OAI221X4 U151 ( .A0(n9), .A1(n104), .B0(n16), .B1(n106), .C0(n108), .Y(n121)
         );
  OAI221X4 U152 ( .A0(n18), .A1(n27), .B0(n13), .B1(n20), .C0(n108), .Y(n122)
         );
  OAI221X4 U153 ( .A0(n13), .A1(n14), .B0(n15), .B1(n16), .C0(n108), .Y(
        err_location[9]) );
endmodule


module DECODER_DATA_WIDTH32_AMBA_WORD32 ( codeword_y, CODEWORD_WIDTH, err_num, 
        decoded_word );
  input [31:0] codeword_y;
  input [31:0] CODEWORD_WIDTH;
  output [1:0] err_num;
  output [31:0] decoded_word;
  wire   n1, n2, n4, n5, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n28, n29, n30, n31, n32, n33, n34,
         n35, n40, n41, n42, n43, n46, n49, n50, n52, n54, n55, n56, n57, n58,
         n62, n63, n64, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n3, n6, n11, n26, n27, n36,
         n37, n38, n39, n44, n45, n47, n48, n51, n53, n59, n60, n61, n65, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224;
  wire   [31:0] s_vector;
  wire   [31:0] err_location;

  Matrix_Mult_DATA_WIDTH32_AMBA_WORD32 MM ( .CODEWORD_WIDTH(CODEWORD_WIDTH), 
        .codeword_y({n193, n163, n166, codeword_y[28], n37, codeword_y[26], 
        n207, codeword_y[24], n165, n3, n206, codeword_y[20], n199, 
        codeword_y[18:17], n195, n197, n192, n164, codeword_y[12], n198, 
        codeword_y[10], n196, n167, n191, codeword_y[6], n211, codeword_y[4:3], 
        n168, n203, codeword_y[0]}), .s_vector(s_vector) );
  Error_Locator_DATA_WIDTH32_AMBA_WORD32 EL ( .CODEWORD_WIDTH(CODEWORD_WIDTH), 
        .s_vector({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, n26, n205, s_vector[3], n204, n139, n210}), 
        .err_location(err_location) );
  AOI22X4 U39 ( .A0(n145), .A1(n217), .B0(n214), .B1(n148), .Y(n67) );
  AOI22X4 U41 ( .A0(n217), .A1(n148), .B0(n152), .B1(n214), .Y(n69) );
  AOI22X4 U45 ( .A0(n217), .A1(n72), .B0(n214), .B1(n74), .Y(n73) );
  AOI22X4 U47 ( .A0(n217), .A1(n74), .B0(n214), .B1(n78), .Y(n77) );
  XOR2X4 U50 ( .A(n196), .B(err_location[9]), .Y(n74) );
  NOR2X4 U52 ( .A(n82), .B(n223), .Y(decoded_word[31]) );
  AOI22X4 U66 ( .A0(n217), .A1(n44), .B0(n214), .B1(n48), .Y(n89) );
  AOI22X4 U69 ( .A0(n217), .A1(n90), .B0(n214), .B1(n92), .Y(n91) );
  XOR2X4 U70 ( .A(err_location[29]), .B(n166), .Y(n88) );
  AOI22X4 U75 ( .A0(n217), .A1(n94), .B0(n214), .B1(n96), .Y(n95) );
  XOR2X4 U76 ( .A(n37), .B(err_location[27]), .Y(n92) );
  XOR2X4 U79 ( .A(err_location[26]), .B(codeword_y[26]), .Y(n94) );
  AOI22X4 U85 ( .A0(n218), .A1(n98), .B0(n215), .B1(n102), .Y(n101) );
  XOR2X4 U86 ( .A(err_location[25]), .B(n45), .Y(n96) );
  XOR2X4 U89 ( .A(n194), .B(codeword_y[24]), .Y(n98) );
  XOR2X4 U92 ( .A(n27), .B(n165), .Y(n102) );
  XOR2X4 U95 ( .A(err_location[22]), .B(n3), .Y(n104) );
  XOR2X4 U98 ( .A(n131), .B(n206), .Y(n106) );
  XOR2X4 U101 ( .A(n6), .B(codeword_y[20]), .Y(n108) );
  OAI221X2 U102 ( .A0(n9), .A1(n224), .B0(n15), .B1(n221), .C0(n114), .Y(
        decoded_word[13]) );
  AOI22X4 U103 ( .A0(n218), .A1(n113), .B0(n215), .B1(n115), .Y(n114) );
  XOR2X4 U104 ( .A(n199), .B(err_location[19]), .Y(n110) );
  XOR2X4 U105 ( .A(err_location[13]), .B(n164), .Y(n66) );
  AOI22X4 U107 ( .A0(n115), .A1(n218), .B0(n117), .B1(n215), .Y(n116) );
  XOR2X4 U108 ( .A(err_location[18]), .B(codeword_y[18]), .Y(n113) );
  XOR2X4 U109 ( .A(err_location[12]), .B(codeword_y[12]), .Y(n68) );
  AOI22X4 U111 ( .A0(n127), .A1(n218), .B0(n111), .B1(n215), .Y(n118) );
  XOR2X4 U112 ( .A(err_location[17]), .B(codeword_y[17]), .Y(n115) );
  XOR2X4 U113 ( .A(err_location[11]), .B(n198), .Y(n70) );
  AOI22X4 U115 ( .A0(n218), .A1(n111), .B0(n214), .B1(n64), .Y(n119) );
  XOR2X4 U116 ( .A(n144), .B(n61), .Y(n64) );
  XOR2X4 U118 ( .A(err_location[16]), .B(n195), .Y(n117) );
  XOR2X4 U119 ( .A(n146), .B(codeword_y[10]), .Y(n72) );
  AOI2BB2X4 U121 ( .B0(n218), .B1(n75), .A0N(n216), .A1N(n76), .Y(n121) );
  XNOR2X4 U122 ( .A(n47), .B(codeword_y[4]), .Y(n76) );
  XOR2X4 U123 ( .A(err_location[5]), .B(n211), .Y(n75) );
  OAI221X4 U3 ( .A0(n20), .A1(n224), .B0(n83), .B1(n222), .C0(n89), .Y(
        decoded_word[24]) );
  BUFX16 U4 ( .A(err_location[0]), .Y(n126) );
  BUFX16 U5 ( .A(err_location[14]), .Y(n144) );
  BUFX20 U6 ( .A(err_location[10]), .Y(n146) );
  BUFX12 U7 ( .A(err_location[24]), .Y(n194) );
  OAI22X2 U8 ( .A0(n82), .A1(n188), .B0(n23), .B1(n223), .Y(decoded_word[27])
         );
  BUFX20 U9 ( .A(err_location[7]), .Y(n149) );
  BUFX8 U10 ( .A(err_location[8]), .Y(n155) );
  BUFX20 U11 ( .A(err_location[30]), .Y(n202) );
  INVX8 U12 ( .A(n51), .Y(n82) );
  XOR2X4 U13 ( .A(n11), .B(n162), .Y(n51) );
  NAND3X4 U14 ( .A(n65), .B(n122), .C(n69), .Y(decoded_word[7]) );
  INVX8 U15 ( .A(n74), .Y(n5) );
  BUFX12 U16 ( .A(err_location[21]), .Y(n131) );
  OR2X4 U17 ( .A(n16), .B(n221), .Y(n60) );
  NOR2X4 U18 ( .A(n83), .B(n223), .Y(decoded_word[30]) );
  CLKINVX20 U19 ( .A(n187), .Y(n83) );
  OAI221X4 U20 ( .A0(n1), .A1(n223), .B0(n7), .B1(n222), .C0(n73), .Y(
        decoded_word[5]) );
  BUFX20 U21 ( .A(codeword_y[9]), .Y(n196) );
  BUFX12 U22 ( .A(codeword_y[16]), .Y(n195) );
  BUFX8 U23 ( .A(codeword_y[22]), .Y(n3) );
  BUFX20 U24 ( .A(codeword_y[21]), .Y(n206) );
  OAI221X4 U25 ( .A0(n14), .A1(n224), .B0(n20), .B1(n221), .C0(n103), .Y(
        decoded_word[18]) );
  BUFX16 U26 ( .A(codeword_y[27]), .Y(n37) );
  BUFX20 U27 ( .A(codeword_y[7]), .Y(n191) );
  OAI221X4 U28 ( .A0(n7), .A1(n224), .B0(n13), .B1(n221), .C0(n118), .Y(
        decoded_word[11]) );
  NAND4X4 U29 ( .A(n200), .B(n36), .C(err_location[18]), .D(n123), .Y(n32) );
  BUFX16 U30 ( .A(err_location[1]), .Y(n200) );
  BUFX20 U31 ( .A(err_location[20]), .Y(n6) );
  INVX4 U32 ( .A(n212), .Y(n213) );
  INVX4 U33 ( .A(n152), .Y(n7) );
  CLKINVX4 U34 ( .A(err_location[11]), .Y(n212) );
  BUFX20 U35 ( .A(codeword_y[5]), .Y(n211) );
  INVX12 U36 ( .A(n113), .Y(n14) );
  BUFX20 U37 ( .A(codeword_y[2]), .Y(n168) );
  INVX8 U38 ( .A(err_location[19]), .Y(n156) );
  NAND4X4 U40 ( .A(n153), .B(n155), .C(n149), .D(n124), .Y(n128) );
  BUFX12 U42 ( .A(err_location[6]), .Y(n124) );
  BUFX16 U43 ( .A(err_location[9]), .Y(n153) );
  INVX1 U44 ( .A(n147), .Y(n46) );
  BUFX16 U46 ( .A(err_location[15]), .Y(n150) );
  INVX4 U48 ( .A(n200), .Y(n157) );
  BUFX12 U49 ( .A(codeword_y[15]), .Y(n197) );
  INVX1 U51 ( .A(n191), .Y(n154) );
  BUFX16 U53 ( .A(codeword_y[11]), .Y(n198) );
  INVX1 U54 ( .A(n197), .Y(n142) );
  BUFX8 U55 ( .A(codeword_y[29]), .Y(n166) );
  BUFX8 U56 ( .A(err_location[31]), .Y(n162) );
  BUFX8 U57 ( .A(err_location[4]), .Y(n47) );
  BUFX3 U58 ( .A(n210), .Y(n138) );
  CLKINVX3 U59 ( .A(n58), .Y(n135) );
  BUFX16 U60 ( .A(err_location[28]), .Y(n140) );
  INVX4 U61 ( .A(n44), .Y(n25) );
  INVX4 U62 ( .A(n115), .Y(n13) );
  INVX4 U63 ( .A(n102), .Y(n19) );
  INVX4 U64 ( .A(n98), .Y(n20) );
  CLKINVX3 U65 ( .A(n156), .Y(n36) );
  BUFX3 U67 ( .A(err_location[17]), .Y(n123) );
  OR2X2 U68 ( .A(n84), .B(n223), .Y(n174) );
  OR2X2 U71 ( .A(n79), .B(n223), .Y(n179) );
  OR2X2 U72 ( .A(n141), .B(n222), .Y(n178) );
  OR2X2 U73 ( .A(n18), .B(n221), .Y(n134) );
  DLY1X1 U74 ( .A(n193), .Y(n11) );
  INVX4 U77 ( .A(n110), .Y(n15) );
  OR2X2 U78 ( .A(n146), .B(n126), .Y(n169) );
  BUFX20 U80 ( .A(s_vector[5]), .Y(n26) );
  BUFX8 U81 ( .A(err_location[23]), .Y(n27) );
  AND4X2 U82 ( .A(err_location[27]), .B(err_location[26]), .C(err_location[25]), .D(n194), .Y(n208) );
  BUFX20 U83 ( .A(codeword_y[31]), .Y(n193) );
  OAI221X4 U84 ( .A0(n19), .A1(n224), .B0(n25), .B1(n222), .C0(n91), .Y(
        decoded_word[23]) );
  BUFX16 U87 ( .A(codeword_y[8]), .Y(n167) );
  OAI221X4 U88 ( .A0(n17), .A1(n224), .B0(n23), .B1(n222), .C0(n95), .Y(
        decoded_word[21]) );
  OAI221X4 U90 ( .A0(n18), .A1(n224), .B0(n24), .B1(n222), .C0(n93), .Y(
        decoded_word[22]) );
  OAI221X4 U91 ( .A0(n15), .A1(n224), .B0(n21), .B1(n221), .C0(n101), .Y(
        decoded_word[19]) );
  INVX8 U93 ( .A(n72), .Y(n53) );
  OR2X1 U94 ( .A(CODEWORD_WIDTH[1]), .B(CODEWORD_WIDTH[0]), .Y(n188) );
  INVX4 U96 ( .A(n38), .Y(n224) );
  AND3X2 U97 ( .A(n219), .B(n188), .C(n221), .Y(n38) );
  AND2X1 U99 ( .A(CODEWORD_WIDTH[1]), .B(n28), .Y(n39) );
  CLKINVX3 U100 ( .A(n188), .Y(n214) );
  CLKINVX3 U106 ( .A(n220), .Y(n218) );
  CLKINVX3 U110 ( .A(n39), .Y(n222) );
  BUFX20 U114 ( .A(s_vector[4]), .Y(n205) );
  XOR2X2 U117 ( .A(n140), .B(codeword_y[28]), .Y(n90) );
  NAND2X2 U120 ( .A(n49), .B(n50), .Y(n42) );
  NAND4BBX4 U124 ( .AN(n123), .BN(err_location[18]), .C(n156), .D(n157), .Y(
        n57) );
  BUFX20 U125 ( .A(n88), .Y(n44) );
  DLY1X1 U126 ( .A(n207), .Y(n45) );
  BUFX12 U127 ( .A(codeword_y[13]), .Y(n164) );
  BUFX16 U128 ( .A(codeword_y[23]), .Y(n165) );
  XOR2X4 U129 ( .A(n140), .B(codeword_y[28]), .Y(n48) );
  CLKINVXL U130 ( .A(n204), .Y(n49) );
  XNOR2X2 U131 ( .A(codeword_y[0]), .B(n126), .Y(n120) );
  OR4X2 U132 ( .A(n194), .B(err_location[25]), .C(err_location[26]), .D(
        err_location[27]), .Y(n55) );
  AOI2BB2X4 U133 ( .B0(n218), .B1(n106), .A0N(n216), .A1N(n16), .Y(n107) );
  INVX8 U134 ( .A(n92), .Y(n23) );
  AOI2BB2X4 U135 ( .B0(n214), .B1(n94), .A0N(n220), .A1N(n23), .Y(n93) );
  CLKBUFX8 U136 ( .A(codeword_y[30]), .Y(n163) );
  OR2X4 U137 ( .A(n10), .B(n224), .Y(n59) );
  NAND3X4 U138 ( .A(n59), .B(n60), .C(n112), .Y(decoded_word[14]) );
  AOI22X2 U139 ( .A0(n110), .A1(n218), .B0(n215), .B1(n113), .Y(n112) );
  INVX3 U140 ( .A(n75), .Y(n1) );
  INVX8 U141 ( .A(n94), .Y(n22) );
  XNOR2X2 U142 ( .A(n201), .B(codeword_y[3]), .Y(n79) );
  OAI221X4 U143 ( .A0(n21), .A1(n223), .B0(n82), .B1(n222), .C0(n87), .Y(
        decoded_word[25]) );
  INVX8 U144 ( .A(n108), .Y(n16) );
  BUFX20 U145 ( .A(codeword_y[25]), .Y(n207) );
  DLY1X1 U146 ( .A(n192), .Y(n61) );
  OR2X2 U147 ( .A(n151), .B(n223), .Y(n65) );
  OR2X4 U148 ( .A(n9), .B(n222), .Y(n122) );
  NAND4X4 U149 ( .A(err_location[5]), .B(n47), .C(n201), .D(n162), .Y(n132) );
  NAND2BX4 U150 ( .AN(n55), .B(n125), .Y(n186) );
  NOR4X4 U151 ( .A(n162), .B(n201), .C(n47), .D(err_location[5]), .Y(n125) );
  BUFX20 U152 ( .A(err_location[3]), .Y(n201) );
  AOI2BB2X4 U153 ( .B0(n152), .B1(n217), .A0N(n53), .A1N(n216), .Y(n71) );
  BUFX20 U154 ( .A(n117), .Y(n127) );
  OR4X4 U155 ( .A(n124), .B(n149), .C(n155), .D(n153), .Y(n52) );
  AND4X4 U156 ( .A(n202), .B(err_location[2]), .C(err_location[29]), .D(n140), 
        .Y(n209) );
  OAI222X4 U157 ( .A0(n82), .A1(n220), .B0(n22), .B1(n224), .C0(n83), .C1(n216), .Y(decoded_word[26]) );
  NAND4BBX4 U158 ( .AN(n132), .BN(n128), .C(n208), .D(n209), .Y(n35) );
  OR2X2 U159 ( .A(n2), .B(n223), .Y(n129) );
  OR2X4 U160 ( .A(n8), .B(n222), .Y(n130) );
  NAND3X4 U161 ( .A(n129), .B(n130), .C(n71), .Y(decoded_word[6]) );
  CLKINVX3 U162 ( .A(n38), .Y(n223) );
  CLKINVX8 U163 ( .A(n148), .Y(n8) );
  INVX4 U164 ( .A(n78), .Y(n4) );
  INVX8 U165 ( .A(n185), .Y(err_num[1]) );
  OAI221X4 U166 ( .A0(n141), .A1(n224), .B0(n17), .B1(n221), .C0(n109), .Y(
        decoded_word[15]) );
  OR2X4 U167 ( .A(n12), .B(n224), .Y(n133) );
  NAND3X4 U168 ( .A(n133), .B(n134), .C(n107), .Y(decoded_word[16]) );
  AND3X4 U169 ( .A(n135), .B(n136), .C(n137), .Y(n29) );
  NOR2X4 U170 ( .A(n57), .B(n56), .Y(n136) );
  NOR3X4 U171 ( .A(err_location[12]), .B(n213), .C(n169), .Y(n137) );
  OR4X2 U172 ( .A(n140), .B(err_location[29]), .C(err_location[2]), .D(n202), 
        .Y(n54) );
  XNOR2X2 U173 ( .A(err_location[2]), .B(n168), .Y(n84) );
  BUFX20 U174 ( .A(s_vector[1]), .Y(n139) );
  OR2X4 U175 ( .A(n4), .B(n222), .Y(n175) );
  NOR3XL U176 ( .A(n205), .B(s_vector[3]), .C(n26), .Y(n50) );
  OR4X2 U177 ( .A(n6), .B(n131), .C(err_location[22]), .D(n27), .Y(n56) );
  XOR2X4 U178 ( .A(n150), .B(n142), .Y(n141) );
  DLY1X1 U179 ( .A(codeword_y[6]), .Y(n190) );
  BUFX20 U180 ( .A(s_vector[2]), .Y(n204) );
  XNOR2X4 U181 ( .A(n150), .B(n142), .Y(n111) );
  AOI2BB2X4 U182 ( .B0(n215), .B1(n106), .A0N(n220), .A1N(n18), .Y(n105) );
  INVX8 U183 ( .A(n104), .Y(n18) );
  OR2X4 U184 ( .A(n5), .B(n222), .Y(n180) );
  INVX20 U185 ( .A(n48), .Y(n24) );
  INVX8 U186 ( .A(n106), .Y(n17) );
  NAND3BX4 U187 ( .AN(n143), .B(n178), .C(n62), .Y(decoded_word[9]) );
  NOR2X4 U188 ( .A(n5), .B(n224), .Y(n143) );
  XOR2X4 U189 ( .A(err_location[8]), .B(n167), .Y(n78) );
  NAND4X1 U190 ( .A(n27), .B(err_location[22]), .C(n131), .D(n6), .Y(n33) );
  XNOR2X2 U191 ( .A(n200), .B(n203), .Y(n99) );
  OR2X4 U192 ( .A(n13), .B(n224), .Y(n183) );
  OAI221X4 U193 ( .A0(n8), .A1(n224), .B0(n14), .B1(n221), .C0(n116), .Y(
        decoded_word[12]) );
  BUFX20 U194 ( .A(n66), .Y(n145) );
  OAI221X4 U195 ( .A0(n53), .A1(n224), .B0(n12), .B1(n221), .C0(n119), .Y(
        decoded_word[10]) );
  DLY1X1 U196 ( .A(n139), .Y(n147) );
  AOI22X4 U197 ( .A0(n218), .A1(n96), .B0(n215), .B1(n98), .Y(n97) );
  OR4X2 U198 ( .A(err_location[13]), .B(n150), .C(n144), .D(err_location[16]), 
        .Y(n58) );
  BUFX20 U199 ( .A(codeword_y[19]), .Y(n199) );
  INVX8 U200 ( .A(n127), .Y(n12) );
  NAND4BX4 U201 ( .AN(n40), .B(n41), .C(n213), .D(err_location[12]), .Y(n34)
         );
  NOR2X4 U202 ( .A(n42), .B(n43), .Y(n31) );
  AND2X4 U203 ( .A(n214), .B(n86), .Y(n177) );
  BUFX20 U204 ( .A(n68), .Y(n148) );
  XOR2X4 U205 ( .A(n149), .B(n154), .Y(n151) );
  BUFX20 U206 ( .A(n70), .Y(n152) );
  XNOR2X4 U207 ( .A(err_location[7]), .B(n154), .Y(n81) );
  AOI22X4 U208 ( .A0(n217), .A1(n64), .B0(n145), .B1(n215), .Y(n62) );
  OR2X4 U209 ( .A(n4), .B(n223), .Y(n158) );
  OR2X4 U210 ( .A(n10), .B(n222), .Y(n159) );
  NAND3X4 U211 ( .A(n158), .B(n159), .C(n67), .Y(decoded_word[8]) );
  OR2X4 U212 ( .A(n99), .B(n224), .Y(n160) );
  OR2X4 U213 ( .A(n151), .B(n221), .Y(n161) );
  NAND3X4 U214 ( .A(n160), .B(n161), .C(n100), .Y(decoded_word[1]) );
  OAI221X4 U215 ( .A0(n76), .A1(n223), .B0(n53), .B1(n222), .C0(n77), .Y(
        decoded_word[4]) );
  AND2X4 U216 ( .A(n78), .B(n217), .Y(n181) );
  OAI221X4 U217 ( .A0(n16), .A1(n224), .B0(n22), .B1(n222), .C0(n97), .Y(
        decoded_word[20]) );
  AND2X4 U218 ( .A(n215), .B(n75), .Y(n173) );
  AND2X2 U219 ( .A(n214), .B(n81), .Y(n182) );
  AND2X2 U220 ( .A(n217), .B(n81), .Y(n176) );
  NAND3BX4 U221 ( .AN(n31), .B(n126), .C(n146), .Y(n40) );
  OR2X4 U222 ( .A(n19), .B(n221), .Y(n184) );
  OR2X4 U223 ( .A(n120), .B(n223), .Y(n170) );
  OR2X2 U224 ( .A(n2), .B(n221), .Y(n171) );
  NAND3X4 U225 ( .A(n170), .B(n171), .C(n121), .Y(decoded_word[0]) );
  AND2X2 U226 ( .A(n218), .B(n86), .Y(n172) );
  NOR2X4 U227 ( .A(n172), .B(n173), .Y(n100) );
  NAND3X4 U228 ( .A(n174), .B(n175), .C(n85), .Y(decoded_word[2]) );
  NOR2X4 U229 ( .A(n176), .B(n177), .Y(n85) );
  NAND3X4 U230 ( .A(n179), .B(n180), .C(n80), .Y(decoded_word[3]) );
  NOR2X4 U231 ( .A(n181), .B(n182), .Y(n80) );
  NAND3X4 U232 ( .A(n105), .B(n184), .C(n183), .Y(decoded_word[17]) );
  AOI22X4 U233 ( .A0(n218), .A1(n108), .B0(n215), .B1(n110), .Y(n109) );
  AOI22X4 U234 ( .A0(n218), .A1(n102), .B0(n215), .B1(n104), .Y(n103) );
  XOR2X4 U235 ( .A(n202), .B(n163), .Y(n187) );
  AND4X4 U236 ( .A(err_location[16]), .B(n150), .C(n144), .D(err_location[13]), 
        .Y(n41) );
  NAND2BXL U237 ( .AN(n138), .B(n46), .Y(n43) );
  INVX8 U238 ( .A(n86), .Y(n2) );
  NOR2X4 U239 ( .A(n25), .B(n223), .Y(decoded_word[29]) );
  AOI2BB2X4 U240 ( .B0(n215), .B1(n44), .A0N(n220), .A1N(n83), .Y(n87) );
  NOR2X4 U241 ( .A(n24), .B(n223), .Y(decoded_word[28]) );
  OR4X4 U242 ( .A(n35), .B(n34), .C(n33), .D(n32), .Y(n185) );
  CLKINVX3 U243 ( .A(n188), .Y(n215) );
  CLKINVX3 U244 ( .A(n219), .Y(n217) );
  INVX1 U245 ( .A(n214), .Y(n216) );
  CLKINVX3 U246 ( .A(n39), .Y(n221) );
  INVX1 U247 ( .A(n63), .Y(n219) );
  INVX1 U248 ( .A(n63), .Y(n220) );
  INVXL U249 ( .A(CODEWORD_WIDTH[0]), .Y(n28) );
  BUFX20 U251 ( .A(codeword_y[14]), .Y(n192) );
  INVX8 U252 ( .A(n145), .Y(n9) );
  INVX8 U253 ( .A(n96), .Y(n21) );
  BUFX20 U254 ( .A(codeword_y[1]), .Y(n203) );
  NOR3X4 U255 ( .A(n186), .B(n52), .C(n54), .Y(n30) );
  XOR2X4 U256 ( .A(err_location[6]), .B(n190), .Y(n86) );
  INVX8 U257 ( .A(n64), .Y(n10) );
  BUFX20 U258 ( .A(s_vector[0]), .Y(n210) );
  AOI211X2 U259 ( .A0(n29), .A1(n30), .B0(err_num[1]), .C0(n31), .Y(err_num[0]) );
  NOR2XL U260 ( .A(n28), .B(CODEWORD_WIDTH[1]), .Y(n63) );
endmodule


module FUNCTION_CONTROL_AMBA_WORD32_DATA_WIDTH32 ( SEL, DATA_IN, 
        CODEWORD_WIDTH, NOISE, err_num, data_out );
  input [31:0] SEL;
  input [31:0] DATA_IN;
  input [31:0] CODEWORD_WIDTH;
  input [31:0] NOISE;
  output [1:0] err_num;
  output [31:0] data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n39, n40, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n37, n38, n41, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115;
  wire   [31:0] codeword_enc;
  wire   [31:0] codeword_y;
  wire   [31:0] decoded_word;

  Encoder_DATA_WIDTH32_AMBA_WORD32 ENC ( .info(DATA_IN), .CODEWORD_WIDTH({
        CODEWORD_WIDTH[31:12], n65, CODEWORD_WIDTH[10:0]}), .codeword(
        codeword_enc) );
  DECODER_DATA_WIDTH32_AMBA_WORD32 DEC ( .codeword_y({codeword_y[31:27], n37, 
        codeword_y[25:11], n75, codeword_y[9:0]}), .CODEWORD_WIDTH({
        CODEWORD_WIDTH[31:12], n65, CODEWORD_WIDTH[10:9], n70, 
        CODEWORD_WIDTH[7:0]}), .err_num(err_num), .decoded_word(decoded_word)
         );
  OAI2BB2X4 U1 ( .B0(n107), .B1(n10), .A0N(n110), .A1N(decoded_word[9]), .Y(
        data_out[9]) );
  OAI2BB2X4 U2 ( .B0(n106), .B1(n9), .A0N(n110), .A1N(decoded_word[8]), .Y(
        data_out[8]) );
  OAI2BB2X4 U3 ( .B0(n106), .B1(n104), .A0N(n110), .A1N(decoded_word[7]), .Y(
        data_out[7]) );
  OAI2BB2X4 U5 ( .B0(n106), .B1(n6), .A0N(n110), .A1N(decoded_word[5]), .Y(
        data_out[5]) );
  OAI2BB2X4 U6 ( .B0(n106), .B1(n5), .A0N(decoded_word[4]), .A1N(n109), .Y(
        data_out[4]) );
  OAI2BB2X4 U7 ( .B0(n106), .B1(n4), .A0N(decoded_word[3]), .A1N(n109), .Y(
        data_out[3]) );
  OAI2BB2X4 U10 ( .B0(n106), .B1(n3), .A0N(decoded_word[2]), .A1N(n109), .Y(
        data_out[2]) );
  OAI2BB2X4 U14 ( .B0(n106), .B1(n27), .A0N(decoded_word[26]), .A1N(n109), .Y(
        data_out[26]) );
  OAI2BB2X4 U15 ( .B0(n107), .B1(n76), .A0N(n108), .A1N(decoded_word[25]), .Y(
        data_out[25]) );
  OAI2BB2X4 U16 ( .B0(n107), .B1(n25), .A0N(n108), .A1N(decoded_word[24]), .Y(
        data_out[24]) );
  OAI2BB2X4 U17 ( .B0(n107), .B1(n24), .A0N(decoded_word[23]), .A1N(n109), .Y(
        data_out[23]) );
  OAI2BB2X4 U18 ( .B0(n107), .B1(n23), .A0N(decoded_word[22]), .A1N(n108), .Y(
        data_out[22]) );
  OAI2BB2X4 U19 ( .B0(n107), .B1(n66), .A0N(n108), .A1N(decoded_word[21]), .Y(
        data_out[21]) );
  OAI2BB2X4 U20 ( .B0(n107), .B1(n21), .A0N(decoded_word[20]), .A1N(n108), .Y(
        data_out[20]) );
  OAI2BB2X4 U21 ( .B0(n107), .B1(n2), .A0N(n108), .A1N(decoded_word[1]), .Y(
        data_out[1]) );
  OAI2BB2X4 U23 ( .B0(n107), .B1(n19), .A0N(decoded_word[18]), .A1N(n109), .Y(
        data_out[18]) );
  OAI2BB2X4 U24 ( .B0(n107), .B1(n18), .A0N(decoded_word[17]), .A1N(n108), .Y(
        data_out[17]) );
  OAI2BB2X4 U25 ( .B0(n107), .B1(n17), .A0N(n109), .A1N(decoded_word[16]), .Y(
        data_out[16]) );
  OAI2BB2X4 U26 ( .B0(n108), .B1(n88), .A0N(n109), .A1N(decoded_word[15]), .Y(
        data_out[15]) );
  OAI2BB2X4 U27 ( .B0(n108), .B1(n74), .A0N(decoded_word[14]), .A1N(n109), .Y(
        data_out[14]) );
  OAI2BB2X4 U28 ( .B0(n107), .B1(n14), .A0N(n109), .A1N(decoded_word[13]), .Y(
        data_out[13]) );
  OAI2BB2X4 U29 ( .B0(n108), .B1(n13), .A0N(n110), .A1N(decoded_word[12]), .Y(
        data_out[12]) );
  OAI2BB2X4 U30 ( .B0(n108), .B1(n12), .A0N(n110), .A1N(decoded_word[11]), .Y(
        data_out[11]) );
  OAI2BB2X4 U31 ( .B0(n108), .B1(n11), .A0N(n110), .A1N(decoded_word[10]), .Y(
        data_out[10]) );
  OAI2BB2X4 U32 ( .B0(n108), .B1(n1), .A0N(decoded_word[0]), .A1N(n110), .Y(
        data_out[0]) );
  OAI2BB2X4 U34 ( .B0(n114), .B1(n34), .A0N(n114), .A1N(DATA_IN[9]), .Y(
        codeword_y[9]) );
  XOR2X4 U37 ( .A(n9), .B(NOISE[8]), .Y(n35) );
  OAI2BB2X4 U44 ( .B0(n114), .B1(n39), .A0N(DATA_IN[4]), .A1N(n114), .Y(
        codeword_y[4]) );
  XOR2X4 U45 ( .A(n5), .B(NOISE[4]), .Y(n39) );
  OAI2BB2X4 U46 ( .B0(n114), .B1(n40), .A0N(DATA_IN[3]), .A1N(n114), .Y(
        codeword_y[3]) );
  XOR2X4 U47 ( .A(n4), .B(NOISE[3]), .Y(n40) );
  OAI2BB2X4 U50 ( .B0(n114), .B1(n42), .A0N(DATA_IN[30]), .A1N(n114), .Y(
        codeword_y[30]) );
  XOR2X4 U51 ( .A(n31), .B(NOISE[30]), .Y(n42) );
  OAI2BB2X4 U52 ( .B0(n114), .B1(n43), .A0N(DATA_IN[2]), .A1N(n114), .Y(
        codeword_y[2]) );
  XOR2X4 U53 ( .A(n3), .B(NOISE[2]), .Y(n43) );
  OAI2BB2X4 U54 ( .B0(n114), .B1(n44), .A0N(DATA_IN[29]), .A1N(n114), .Y(
        codeword_y[29]) );
  XOR2X4 U55 ( .A(n30), .B(NOISE[29]), .Y(n44) );
  OAI2BB2X4 U56 ( .B0(n114), .B1(n45), .A0N(DATA_IN[28]), .A1N(n114), .Y(
        codeword_y[28]) );
  XOR2X4 U57 ( .A(n29), .B(NOISE[28]), .Y(n45) );
  OAI2BB2X4 U60 ( .B0(n114), .B1(n47), .A0N(DATA_IN[26]), .A1N(n114), .Y(
        codeword_y[26]) );
  XOR2X4 U61 ( .A(n27), .B(NOISE[26]), .Y(n47) );
  OAI2BB2X4 U64 ( .B0(n114), .B1(n49), .A0N(DATA_IN[24]), .A1N(n114), .Y(
        codeword_y[24]) );
  XOR2X4 U65 ( .A(n25), .B(NOISE[24]), .Y(n49) );
  OAI2BB2X4 U66 ( .B0(n114), .B1(n50), .A0N(DATA_IN[23]), .A1N(n114), .Y(
        codeword_y[23]) );
  XOR2X4 U67 ( .A(n24), .B(NOISE[23]), .Y(n50) );
  OAI2BB2X4 U68 ( .B0(n114), .B1(n51), .A0N(DATA_IN[22]), .A1N(n114), .Y(
        codeword_y[22]) );
  XOR2X4 U69 ( .A(n23), .B(NOISE[22]), .Y(n51) );
  XOR2X4 U73 ( .A(n21), .B(NOISE[20]), .Y(n53) );
  OAI2BB2X4 U74 ( .B0(n114), .B1(n54), .A0N(DATA_IN[1]), .A1N(n114), .Y(
        codeword_y[1]) );
  XOR2X4 U75 ( .A(n2), .B(NOISE[1]), .Y(n54) );
  OAI2BB2X4 U78 ( .B0(n114), .B1(n56), .A0N(DATA_IN[18]), .A1N(n114), .Y(
        codeword_y[18]) );
  OAI2BB2X4 U80 ( .B0(n114), .B1(n57), .A0N(DATA_IN[17]), .A1N(n114), .Y(
        codeword_y[17]) );
  XOR2X4 U81 ( .A(n18), .B(NOISE[17]), .Y(n57) );
  OAI2BB2X4 U82 ( .B0(n114), .B1(n58), .A0N(DATA_IN[16]), .A1N(n114), .Y(
        codeword_y[16]) );
  OAI2BB2X4 U86 ( .B0(n60), .B1(n114), .A0N(DATA_IN[14]), .A1N(n114), .Y(
        codeword_y[14]) );
  OAI2BB2X4 U88 ( .B0(n114), .B1(n61), .A0N(DATA_IN[13]), .A1N(n114), .Y(
        codeword_y[13]) );
  XOR2X4 U89 ( .A(n14), .B(NOISE[13]), .Y(n61) );
  XOR2X4 U91 ( .A(n13), .B(NOISE[12]), .Y(n62) );
  OAI2BB2X4 U92 ( .B0(n114), .B1(n63), .A0N(DATA_IN[11]), .A1N(n114), .Y(
        codeword_y[11]) );
  XOR2X4 U93 ( .A(n12), .B(NOISE[11]), .Y(n63) );
  OAI2BB2X4 U94 ( .B0(n114), .B1(n64), .A0N(DATA_IN[10]), .A1N(n114), .Y(
        codeword_y[10]) );
  XOR2X4 U95 ( .A(n11), .B(NOISE[10]), .Y(n64) );
  CLKINVX8 U101 ( .A(codeword_enc[3]), .Y(n4) );
  CLKINVX8 U126 ( .A(codeword_enc[28]), .Y(n29) );
  CLKINVX8 U127 ( .A(codeword_enc[29]), .Y(n30) );
  DLY1X1 U4 ( .A(CODEWORD_WIDTH[8]), .Y(n70) );
  DLY1X1 U8 ( .A(n32), .Y(n103) );
  OAI2BB2X2 U9 ( .B0(n106), .B1(n103), .A0N(decoded_word[31]), .A1N(n109), .Y(
        data_out[31]) );
  OAI2BB2X2 U11 ( .B0(n106), .B1(n29), .A0N(decoded_word[28]), .A1N(n109), .Y(
        data_out[28]) );
  CLKBUFX8 U12 ( .A(codeword_y[26]), .Y(n37) );
  INVX8 U13 ( .A(codeword_enc[12]), .Y(n13) );
  INVX4 U22 ( .A(codeword_enc[23]), .Y(n24) );
  INVX8 U33 ( .A(n114), .Y(n102) );
  INVX8 U35 ( .A(n114), .Y(n69) );
  CLKINVX3 U36 ( .A(n114), .Y(n80) );
  CLKINVX20 U38 ( .A(n115), .Y(n114) );
  OAI2BB2X2 U39 ( .B0(n106), .B1(n28), .A0N(decoded_word[27]), .A1N(n109), .Y(
        data_out[27]) );
  CLKINVXL U40 ( .A(codeword_enc[5]), .Y(n6) );
  INVX8 U41 ( .A(codeword_enc[10]), .Y(n11) );
  INVX1 U42 ( .A(NOISE[7]), .Y(n100) );
  INVX1 U43 ( .A(NOISE[15]), .Y(n85) );
  INVX1 U48 ( .A(NOISE[21]), .Y(n89) );
  INVX1 U49 ( .A(NOISE[27]), .Y(n97) );
  INVX1 U58 ( .A(NOISE[5]), .Y(n86) );
  INVX8 U59 ( .A(n90), .Y(codeword_y[12]) );
  INVXL U62 ( .A(DATA_IN[0]), .Y(n92) );
  INVXL U63 ( .A(DATA_IN[19]), .Y(n101) );
  INVX4 U70 ( .A(codeword_enc[2]), .Y(n3) );
  CLKBUFX8 U71 ( .A(CODEWORD_WIDTH[11]), .Y(n65) );
  INVX1 U72 ( .A(DATA_IN[7]), .Y(n82) );
  INVX1 U76 ( .A(DATA_IN[6]), .Y(n95) );
  INVX1 U77 ( .A(NOISE[6]), .Y(n105) );
  INVX1 U79 ( .A(DATA_IN[15]), .Y(n68) );
  INVX1 U83 ( .A(NOISE[19]), .Y(n83) );
  INVX1 U84 ( .A(NOISE[25]), .Y(n78) );
  INVX1 U85 ( .A(DATA_IN[21]), .Y(n79) );
  INVX1 U87 ( .A(NOISE[31]), .Y(n96) );
  INVX1 U90 ( .A(NOISE[14]), .Y(n77) );
  INVX4 U96 ( .A(SEL[0]), .Y(n113) );
  CLKINVX3 U97 ( .A(n102), .Y(n38) );
  INVX1 U98 ( .A(NOISE[16]), .Y(n73) );
  INVX1 U99 ( .A(DATA_IN[5]), .Y(n87) );
  INVX1 U100 ( .A(n69), .Y(n71) );
  CLKINVX3 U102 ( .A(codeword_enc[13]), .Y(n14) );
  CLKINVX4 U103 ( .A(codeword_enc[30]), .Y(n31) );
  CLKINVX3 U104 ( .A(codeword_enc[22]), .Y(n23) );
  INVX4 U105 ( .A(codeword_enc[0]), .Y(n1) );
  CLKINVX3 U106 ( .A(codeword_enc[18]), .Y(n19) );
  INVX4 U107 ( .A(codeword_enc[24]), .Y(n25) );
  BUFX3 U108 ( .A(n8), .Y(n104) );
  INVX1 U109 ( .A(codeword_enc[9]), .Y(n10) );
  BUFX3 U110 ( .A(n22), .Y(n66) );
  BUFX3 U111 ( .A(n7), .Y(n41) );
  BUFX3 U112 ( .A(n16), .Y(n88) );
  BUFX3 U113 ( .A(n26), .Y(n76) );
  XOR2X4 U114 ( .A(codeword_enc[14]), .B(n77), .Y(n60) );
  INVX12 U115 ( .A(codeword_enc[14]), .Y(n15) );
  XNOR2X4 U116 ( .A(codeword_enc[9]), .B(NOISE[9]), .Y(n34) );
  OAI2BB2X4 U117 ( .B0(n46), .B1(n114), .A0N(DATA_IN[27]), .A1N(n38), .Y(
        codeword_y[27]) );
  INVX8 U118 ( .A(codeword_enc[16]), .Y(n17) );
  XNOR2X4 U119 ( .A(n19), .B(n67), .Y(n56) );
  CLKINVX20 U120 ( .A(NOISE[18]), .Y(n67) );
  INVX8 U121 ( .A(n91), .Y(codeword_y[0]) );
  OAI2BB2X2 U122 ( .B0(n114), .B1(n35), .A0N(DATA_IN[8]), .A1N(n114), .Y(
        codeword_y[8]) );
  OAI22X4 U123 ( .A0(n59), .A1(n114), .B0(n68), .B1(n69), .Y(codeword_y[15])
         );
  XOR2X4 U124 ( .A(codeword_enc[5]), .B(n86), .Y(n72) );
  OAI22X4 U125 ( .A0(n71), .A1(n72), .B0(n87), .B1(n69), .Y(codeword_y[5]) );
  XNOR2X4 U128 ( .A(n17), .B(n73), .Y(n58) );
  DLY1X1 U129 ( .A(n15), .Y(n74) );
  BUFX16 U130 ( .A(codeword_y[10]), .Y(n75) );
  CLKINVX8 U131 ( .A(codeword_enc[11]), .Y(n12) );
  OAI2BB2X4 U132 ( .B0(n106), .B1(n31), .A0N(decoded_word[30]), .A1N(n109), 
        .Y(data_out[30]) );
  XNOR2X4 U133 ( .A(n26), .B(n78), .Y(n48) );
  OAI22X4 U134 ( .A0(n52), .A1(n114), .B0(n79), .B1(n80), .Y(codeword_y[21])
         );
  OAI2BB2X4 U135 ( .B0(n107), .B1(n20), .A0N(decoded_word[19]), .A1N(n108), 
        .Y(data_out[19]) );
  CLKINVXL U136 ( .A(DATA_IN[25]), .Y(n81) );
  OAI22X4 U137 ( .A0(n48), .A1(n114), .B0(n81), .B1(n69), .Y(codeword_y[25])
         );
  OAI22X4 U138 ( .A0(n36), .A1(n114), .B0(n82), .B1(n69), .Y(codeword_y[7]) );
  XNOR2X4 U139 ( .A(n20), .B(n83), .Y(n55) );
  OAI2BB2X4 U140 ( .B0(n95), .B1(n69), .A0N(n80), .A1N(n84), .Y(codeword_y[6])
         );
  XOR2X4 U141 ( .A(n7), .B(n105), .Y(n84) );
  XNOR2X4 U142 ( .A(n16), .B(n85), .Y(n59) );
  XNOR2X4 U143 ( .A(n22), .B(n89), .Y(n52) );
  AOI2BB2X2 U144 ( .B0(DATA_IN[12]), .B1(n114), .A0N(n114), .A1N(n62), .Y(n90)
         );
  AOI2BB2X4 U145 ( .B0(n69), .B1(n93), .A0N(n92), .A1N(n69), .Y(n91) );
  XNOR2X4 U146 ( .A(n1), .B(NOISE[0]), .Y(n93) );
  INVX8 U147 ( .A(codeword_enc[19]), .Y(n20) );
  OAI22X4 U148 ( .A0(n99), .A1(n98), .B0(n94), .B1(n102), .Y(codeword_y[31])
         );
  CLKINVX20 U149 ( .A(DATA_IN[31]), .Y(n94) );
  XNOR2X4 U150 ( .A(n32), .B(n96), .Y(n99) );
  XNOR2X4 U151 ( .A(n28), .B(n97), .Y(n46) );
  INVX8 U152 ( .A(codeword_enc[26]), .Y(n27) );
  CLKINVX20 U153 ( .A(n102), .Y(n98) );
  XNOR2X4 U154 ( .A(n8), .B(n100), .Y(n36) );
  OAI22X4 U155 ( .A0(n55), .A1(n114), .B0(n101), .B1(n69), .Y(codeword_y[19])
         );
  OAI2BB2X2 U156 ( .B0(n106), .B1(n30), .A0N(decoded_word[29]), .A1N(n109), 
        .Y(data_out[29]) );
  INVX8 U157 ( .A(codeword_enc[21]), .Y(n22) );
  INVX8 U158 ( .A(codeword_enc[8]), .Y(n9) );
  INVX8 U159 ( .A(codeword_enc[1]), .Y(n2) );
  INVX8 U160 ( .A(codeword_enc[15]), .Y(n16) );
  INVX8 U161 ( .A(n113), .Y(n112) );
  OAI2BB2X4 U162 ( .B0(n114), .B1(n53), .A0N(DATA_IN[20]), .A1N(n114), .Y(
        codeword_y[20]) );
  CLKINVX3 U163 ( .A(n111), .Y(n108) );
  CLKINVX3 U164 ( .A(n111), .Y(n107) );
  INVX1 U165 ( .A(n112), .Y(n115) );
  CLKINVX3 U166 ( .A(n111), .Y(n109) );
  CLKINVX3 U167 ( .A(n111), .Y(n110) );
  CLKINVX3 U168 ( .A(n111), .Y(n106) );
  INVX1 U169 ( .A(n33), .Y(n111) );
  OR2X1 U170 ( .A(SEL[1]), .B(n114), .Y(n33) );
  INVX8 U171 ( .A(codeword_enc[25]), .Y(n26) );
  INVX4 U172 ( .A(codeword_enc[17]), .Y(n18) );
  INVX4 U173 ( .A(codeword_enc[20]), .Y(n21) );
  INVX4 U174 ( .A(codeword_enc[4]), .Y(n5) );
  INVX8 U175 ( .A(codeword_enc[27]), .Y(n28) );
  OAI2BB2X4 U176 ( .B0(n106), .B1(n41), .A0N(decoded_word[6]), .A1N(n110), .Y(
        data_out[6]) );
  INVX8 U177 ( .A(codeword_enc[31]), .Y(n32) );
  INVX8 U178 ( .A(codeword_enc[6]), .Y(n7) );
  INVX8 U179 ( .A(codeword_enc[7]), .Y(n8) );
endmodule


module ecc_enc_dec ( clk, rst, PWRITE, PSEL, PENABLE, PADDR, PWDATA, PRDATA, 
        data_out, err_num, operation_done );
  input [19:0] PADDR;
  input [31:0] PWDATA;
  output [31:0] PRDATA;
  output [31:0] data_out;
  output [1:0] err_num;
  input clk, rst, PWRITE, PSEL, PENABLE;
  output operation_done;
  wire   i_PWRITE_OUT, i_operation_done, n11, n12;
  wire   [31:0] i_PRDATA;
  wire   [31:0] i_SEL;
  wire   [31:0] i_DATA_IN;
  wire   [31:0] i_CODEWORD_WIDTH;
  wire   [31:0] i_NOISE;
  wire   [1:0] i_err_num;
  wire   [31:0] i_data_out;

  APB_SLAVE_AMBA_WORD32_AMBA_ADDR_WIDTH20 myslave ( .clk(clk), .rst(rst), 
        .PWRITE(PWRITE), .PSEL(PSEL), .PENABLE(PENABLE), .PWRITE_OUT(
        i_PWRITE_OUT) );
  REG_BANK_AMBA_WORD32_AMBA_ADDR_WIDTH20 mybank ( .clk(clk), .rst(rst), 
        .PADDR(PADDR), .PWDATA(PWDATA), .WRITE(i_PWRITE_OUT), .PRDATA(i_PRDATA), .SEL(i_SEL), .DATA_IN(i_DATA_IN), .CODEWORD_WIDTH(i_CODEWORD_WIDTH), 
        .operation_done(i_operation_done), .NOISE(i_NOISE) );
  FUNCTION_CONTROL_AMBA_WORD32_DATA_WIDTH32 mycontrol ( .SEL({i_SEL[31:1], n11}), .DATA_IN(i_DATA_IN), .CODEWORD_WIDTH(i_CODEWORD_WIDTH), .NOISE(i_NOISE), 
        .err_num(i_err_num), .data_out(i_data_out) );
  DFFHQX1 \err_num_reg[1]  ( .D(i_err_num[1]), .CK(clk), .Q(err_num[1]) );
  DFFHQXL \data_out_reg[25]  ( .D(i_data_out[25]), .CK(clk), .Q(data_out[25])
         );
  DFFHQXL \data_out_reg[24]  ( .D(i_data_out[24]), .CK(clk), .Q(data_out[24])
         );
  DFFHQXL \data_out_reg[19]  ( .D(i_data_out[19]), .CK(clk), .Q(data_out[19])
         );
  DFFHQXL \data_out_reg[31]  ( .D(i_data_out[31]), .CK(clk), .Q(data_out[31])
         );
  DFFHQXL \data_out_reg[16]  ( .D(i_data_out[16]), .CK(clk), .Q(data_out[16])
         );
  DFFHQXL \data_out_reg[14]  ( .D(i_data_out[14]), .CK(clk), .Q(data_out[14])
         );
  DFFHQXL \data_out_reg[17]  ( .D(i_data_out[17]), .CK(clk), .Q(data_out[17])
         );
  DFFHQXL \data_out_reg[20]  ( .D(i_data_out[20]), .CK(clk), .Q(data_out[20])
         );
  DFFHQXL \data_out_reg[18]  ( .D(i_data_out[18]), .CK(clk), .Q(data_out[18])
         );
  DFFHQXL \data_out_reg[15]  ( .D(i_data_out[15]), .CK(clk), .Q(data_out[15])
         );
  DFFHQXL \data_out_reg[0]  ( .D(i_data_out[0]), .CK(clk), .Q(data_out[0]) );
  DFFHQXL \data_out_reg[6]  ( .D(i_data_out[6]), .CK(clk), .Q(data_out[6]) );
  DFFHQXL \data_out_reg[21]  ( .D(i_data_out[21]), .CK(clk), .Q(data_out[21])
         );
  DFFHQXL \data_out_reg[12]  ( .D(i_data_out[12]), .CK(clk), .Q(data_out[12])
         );
  DFFHQXL \data_out_reg[26]  ( .D(i_data_out[26]), .CK(clk), .Q(data_out[26])
         );
  DFFHQXL \data_out_reg[23]  ( .D(i_data_out[23]), .CK(clk), .Q(data_out[23])
         );
  DFFHQXL \data_out_reg[22]  ( .D(i_data_out[22]), .CK(clk), .Q(data_out[22])
         );
  DFFHQXL \data_out_reg[9]  ( .D(i_data_out[9]), .CK(clk), .Q(data_out[9]) );
  DFFHQXL \err_num_reg[0]  ( .D(i_err_num[0]), .CK(clk), .Q(err_num[0]) );
  DFFHQXL \data_out_reg[27]  ( .D(i_data_out[27]), .CK(clk), .Q(data_out[27])
         );
  DFFRHQX1 \PRDATA_reg[31]  ( .D(i_PRDATA[31]), .CK(clk), .RN(rst), .Q(
        PRDATA[31]) );
  DFFRHQX1 \PRDATA_reg[30]  ( .D(i_PRDATA[30]), .CK(clk), .RN(rst), .Q(
        PRDATA[30]) );
  DFFRHQX1 \PRDATA_reg[29]  ( .D(i_PRDATA[29]), .CK(clk), .RN(rst), .Q(
        PRDATA[29]) );
  DFFRHQX1 \PRDATA_reg[28]  ( .D(i_PRDATA[28]), .CK(clk), .RN(rst), .Q(
        PRDATA[28]) );
  DFFRHQX1 \PRDATA_reg[27]  ( .D(i_PRDATA[27]), .CK(clk), .RN(rst), .Q(
        PRDATA[27]) );
  DFFRHQX1 \PRDATA_reg[26]  ( .D(i_PRDATA[26]), .CK(clk), .RN(rst), .Q(
        PRDATA[26]) );
  DFFRHQX1 \PRDATA_reg[25]  ( .D(i_PRDATA[25]), .CK(clk), .RN(rst), .Q(
        PRDATA[25]) );
  DFFRHQX1 \PRDATA_reg[24]  ( .D(i_PRDATA[24]), .CK(clk), .RN(rst), .Q(
        PRDATA[24]) );
  DFFRHQX1 \PRDATA_reg[23]  ( .D(i_PRDATA[23]), .CK(clk), .RN(rst), .Q(
        PRDATA[23]) );
  DFFRHQX1 \PRDATA_reg[22]  ( .D(i_PRDATA[22]), .CK(clk), .RN(rst), .Q(
        PRDATA[22]) );
  DFFRHQX1 \PRDATA_reg[21]  ( .D(i_PRDATA[21]), .CK(clk), .RN(rst), .Q(
        PRDATA[21]) );
  DFFRHQX1 \PRDATA_reg[20]  ( .D(i_PRDATA[20]), .CK(clk), .RN(rst), .Q(
        PRDATA[20]) );
  DFFRHQX1 \PRDATA_reg[19]  ( .D(i_PRDATA[19]), .CK(clk), .RN(rst), .Q(
        PRDATA[19]) );
  DFFRHQX1 \PRDATA_reg[18]  ( .D(i_PRDATA[18]), .CK(clk), .RN(rst), .Q(
        PRDATA[18]) );
  DFFRHQX1 \PRDATA_reg[17]  ( .D(i_PRDATA[17]), .CK(clk), .RN(rst), .Q(
        PRDATA[17]) );
  DFFRHQX1 \PRDATA_reg[16]  ( .D(i_PRDATA[16]), .CK(clk), .RN(rst), .Q(
        PRDATA[16]) );
  DFFRHQX1 \PRDATA_reg[15]  ( .D(i_PRDATA[15]), .CK(clk), .RN(rst), .Q(
        PRDATA[15]) );
  DFFRHQX1 \PRDATA_reg[14]  ( .D(i_PRDATA[14]), .CK(clk), .RN(rst), .Q(
        PRDATA[14]) );
  DFFRHQX1 \PRDATA_reg[13]  ( .D(i_PRDATA[13]), .CK(clk), .RN(rst), .Q(
        PRDATA[13]) );
  DFFRHQX1 \PRDATA_reg[12]  ( .D(i_PRDATA[12]), .CK(clk), .RN(rst), .Q(
        PRDATA[12]) );
  DFFRHQX1 \PRDATA_reg[11]  ( .D(i_PRDATA[11]), .CK(clk), .RN(rst), .Q(
        PRDATA[11]) );
  DFFRHQX1 \PRDATA_reg[10]  ( .D(i_PRDATA[10]), .CK(clk), .RN(rst), .Q(
        PRDATA[10]) );
  DFFRHQX1 \PRDATA_reg[9]  ( .D(i_PRDATA[9]), .CK(clk), .RN(rst), .Q(PRDATA[9]) );
  DFFRHQX1 \PRDATA_reg[8]  ( .D(i_PRDATA[8]), .CK(clk), .RN(rst), .Q(PRDATA[8]) );
  DFFRHQX1 \PRDATA_reg[7]  ( .D(i_PRDATA[7]), .CK(clk), .RN(rst), .Q(PRDATA[7]) );
  DFFRHQX1 \PRDATA_reg[6]  ( .D(i_PRDATA[6]), .CK(clk), .RN(rst), .Q(PRDATA[6]) );
  DFFRHQX1 \PRDATA_reg[5]  ( .D(i_PRDATA[5]), .CK(clk), .RN(rst), .Q(PRDATA[5]) );
  DFFRHQX1 \PRDATA_reg[4]  ( .D(i_PRDATA[4]), .CK(clk), .RN(rst), .Q(PRDATA[4]) );
  DFFRHQX1 \PRDATA_reg[3]  ( .D(i_PRDATA[3]), .CK(clk), .RN(rst), .Q(PRDATA[3]) );
  DFFRHQX1 \PRDATA_reg[2]  ( .D(i_PRDATA[2]), .CK(clk), .RN(rst), .Q(PRDATA[2]) );
  DFFRHQX1 \PRDATA_reg[1]  ( .D(i_PRDATA[1]), .CK(clk), .RN(rst), .Q(PRDATA[1]) );
  DFFRHQX1 \PRDATA_reg[0]  ( .D(i_PRDATA[0]), .CK(clk), .RN(rst), .Q(PRDATA[0]) );
  DFFHQX1 \data_out_reg[28]  ( .D(i_data_out[28]), .CK(clk), .Q(data_out[28])
         );
  DFFRHQX1 operation_done_reg ( .D(i_operation_done), .CK(clk), .RN(rst), .Q(
        operation_done) );
  DFFHQX1 \data_out_reg[30]  ( .D(i_data_out[30]), .CK(clk), .Q(data_out[30])
         );
  DFFHQX1 \data_out_reg[29]  ( .D(i_data_out[29]), .CK(clk), .Q(data_out[29])
         );
  DFFXL \data_out_reg[5]  ( .D(i_data_out[5]), .CK(clk), .Q(data_out[5]) );
  DFFXL \data_out_reg[4]  ( .D(i_data_out[4]), .CK(clk), .Q(data_out[4]) );
  DFFXL \data_out_reg[7]  ( .D(i_data_out[7]), .CK(clk), .Q(data_out[7]) );
  DFFXL \data_out_reg[11]  ( .D(i_data_out[11]), .CK(clk), .Q(data_out[11]) );
  DFFXL \data_out_reg[1]  ( .D(i_data_out[1]), .CK(clk), .Q(data_out[1]) );
  DFFXL \data_out_reg[10]  ( .D(i_data_out[10]), .CK(clk), .Q(data_out[10]) );
  DFFXL \data_out_reg[3]  ( .D(i_data_out[3]), .CK(clk), .Q(data_out[3]) );
  DFFXL \data_out_reg[2]  ( .D(i_data_out[2]), .CK(clk), .Q(data_out[2]) );
  DFFXL \data_out_reg[8]  ( .D(i_data_out[8]), .CK(clk), .Q(data_out[8]) );
  DFFHQXL \data_out_reg[13]  ( .D(i_data_out[13]), .CK(clk), .Q(data_out[13])
         );
  CLKINVX8 U3 ( .A(i_SEL[0]), .Y(n12) );
  INVX8 U4 ( .A(n12), .Y(n11) );
endmodule

