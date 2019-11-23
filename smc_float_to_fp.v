// ********************************************************************
//
// Copyright (C) 1994-2014, Synopsys Inc.  All Rights Reserved

// This code was generated by Synopsys's Synphony Model Compiler product and
// is intended for use solely by licensed users of this product.

// VERILOG created by Synphony Model Compiler J-2014.09, Build 015R, Aug 22 2014
// Date written:             Fri Oct 23 16:39:45 2015

// ********************************************************************

// Generated from smc_float_to_fp.slx Version 1.20 Last modified date Fri Oct 23 16:37:32 2015
module x2_i (
  input clk,
  input GlobalEnable1,
  input GlobalReset,
  output [31:0] y, // ufix32_En0
  input [31:0] porty // ufix32_En0
);
wire [31:0] N_1;  
wire [31:0] N_porty_0_24;  
wire [31:0] N_y_1_25;  
wire GlobalResetSel;
assign y = N_1;
  assign N_1 = porty;
assign GlobalResetSel = GlobalReset;
endmodule

//-----------------------------------------

module FP_to_Fixed (
  input clk,
  input GlobalEnable1,
  input GlobalReset,
  output srdyo, // ufix1
  output [20:0] y, // sfix21_En0
  input srdyi, // ufix1
  input [31:0] x // ufix32_En0
);
wire [7:0] N_19;  
wire [6:0] N_18;  
wire [0:0] N_15;  
wire [22:0] N_14;  
wire [23:0] N_16;  
wire [7:0] N_20;  
wire [23:0] N_17;  
wire [0:0] N_13;  
wire [19:0] N_11;  
wire [19:0] N_5;  
wire [19:0] N_10;  
wire [0:0] N_2;  
wire [31:0] N_12;  
wire [0:0] N_6;  
wire [19:0] N_4;  
wire [19:0] N_3;  
wire [23:0] N_7;  
wire [7:0] N_8;  
wire [0:0] N_1;  
wire [20:0] N_9;  
wire [31:0] N_x_0_26;  
wire [0:0] N_srdyi_0_27;  
wire [20:0] N_y_1_28;  
wire [0:0] N_srdyo_1_29;  
wire GlobalResetSel;
assign srdyo = N_1;
assign y = N_9;
  assign N_2 = srdyi;
  assign N_12 = x;
  generate
  begin: Add1_block
    wire enab;
    wire [8:0] tmpOut;
    wire  [8:0] tmp_N_19_0;
    wire  [8:0] tmp_N_18_1;
    wire [8:0] tmpOutPre;
    assign  enab= GlobalEnable1;
    assign tmp_N_19_0 = ($unsigned(N_19) << 0);
    assign tmp_N_18_1 = ($unsigned(N_18) << 0);
    assign  tmpOutPre =   tmp_N_19_0 - tmp_N_18_1;
    assign tmpOut = tmpOutPre;
    synBusSatRnd #( .inp_width(9), .out_width(8), .infrac(0), .outfrac(0), .round(0), .sat(0), .datatype("SS") )
    sat_tmpOut ( .inp(tmpOut), .outp(N_20) );
  end // Add1_block
  endgenerate
  generate
  begin: Concat1_block
    wire [23:0] med;
    assign med = { N_15, N_14 };
    assign N_16 = med[23:0];  end // Concat1_block
  endgenerate
  synBusAdapter #(
      .inp_width(24),
      .out_width(24),
      .datatype("unsign"),
      .preshift(0)
    ) Convert3 (
      .inp(N_16),
      .outp(N_17)
   );
    synDelayWithEnable #( .bitwidth(8), .preferRAMImpl(2), .delaylength(1) ) Delay_syn_block ( .clk(clk), .en(GlobalEnable1), .grst(GlobalResetSel), .rst(1'b0), .inp(N_20), .outp(N_8) );
    synDelayWithEnable #( .bitwidth(24), .preferRAMImpl(2), .delaylength(1) ) Delay1_block ( .clk(clk), .en(GlobalEnable1), .grst(GlobalResetSel), .rst(1'b0), .inp(N_17), .outp(N_7) );
    synDelayWithEnable #( .bitwidth(1), .preferRAMImpl(2), .delaylength(3) ) Delay2_block ( .clk(clk), .en(GlobalEnable1), .grst(GlobalResetSel), .rst(1'b0), .inp(N_13), .outp(N_6) );
    synDelayWithEnable #( .bitwidth(20), .preferRAMImpl(2), .delaylength(1) ) Delay3_block ( .clk(clk), .en(GlobalEnable1), .grst(GlobalResetSel), .rst(1'b0), .inp(N_11), .outp(N_5) );
    synDelayWithEnable #( .bitwidth(20), .preferRAMImpl(2), .delaylength(1) ) Delay4_block ( .clk(clk), .en(GlobalEnable1), .grst(GlobalResetSel), .rst(1'b0), .inp(N_5), .outp(N_4) );
    synDelayWithEnable #( .bitwidth(20), .preferRAMImpl(2), .delaylength(1) ) Delay5_block ( .clk(clk), .en(GlobalEnable1), .grst(GlobalResetSel), .rst(1'b0), .inp(N_10), .outp(N_3) );
    synDelayWithEnable #( .bitwidth(1), .preferRAMImpl(2), .delaylength(3) ) Delay6_block ( .clk(clk), .en(GlobalEnable1), .grst(GlobalResetSel), .rst(1'b0), .inp(N_2), .outp(N_1) );
  //start Extract
    assign N_14[0] = N_12[0];
    assign N_14[1] = N_12[1];
    assign N_14[2] = N_12[2];
    assign N_14[3] = N_12[3];
    assign N_14[4] = N_12[4];
    assign N_14[5] = N_12[5];
    assign N_14[6] = N_12[6];
    assign N_14[7] = N_12[7];
    assign N_14[8] = N_12[8];
    assign N_14[9] = N_12[9];
    assign N_14[10] = N_12[10];
    assign N_14[11] = N_12[11];
    assign N_14[12] = N_12[12];
    assign N_14[13] = N_12[13];
    assign N_14[14] = N_12[14];
    assign N_14[15] = N_12[15];
    assign N_14[16] = N_12[16];
    assign N_14[17] = N_12[17];
    assign N_14[18] = N_12[18];
    assign N_14[19] = N_12[19];
    assign N_14[20] = N_12[20];
    assign N_14[21] = N_12[21];
    assign N_14[22] = N_12[22];
  //end Extract
  //start Extract1
    assign N_19[0] = N_12[23];
    assign N_19[1] = N_12[24];
    assign N_19[2] = N_12[25];
    assign N_19[3] = N_12[26];
    assign N_19[4] = N_12[27];
    assign N_19[5] = N_12[28];
    assign N_19[6] = N_12[29];
    assign N_19[7] = N_12[30];
  //end Extract1
  //start Extract2
    assign N_13[0] = N_12[31];
  //end Extract2
  generate
  begin: Mux1_block
    wire [20:0] med  [1:0];
    reg [20:0] tmpOut;
    assign med[0] = $unsigned(N_4) ;
    assign med[1] = $signed(N_3) ;

    always@(*)
    begin
      if(N_6[0:0] >= 2)
        tmpOut <= med[0];
      else
        tmpOut <= med[N_6[0:0]];
    end

    assign N_9 = tmpOut;
  end // Mux1_Block
  endgenerate
  generate
  begin: Negate1_block
    wire  [20:0] med ;
    wire signed [20:0] medo;
    wire [20:0] tmpOut;
    assign med = $unsigned(N_5);
    assign medo = $signed(tmpOut) ;
    assign N_10 = medo[19:0];
    synNegate #(
      .bitwidth(21)
    ) Negate1 (
      .inp(med),
      .outp(tmpOut)
    );
  end // Negate1_block;
  endgenerate
  generate
  begin: Shifter2_block
    wire [43:0] medo;
    wire [43:0] tmpIn;
    assign tmpIn = (N_7) ;
    assign N_11 = medo[43:24];
    synShifterR #(
      .inpBitW(44),
      .outBitW(44),
      .shfBitW(8),
      .datatype("unsign"),
      .opr("leftshift")
    ) Shifter2 (
      .inp(tmpIn),
      .shf(N_8[7:0]),
      .outp(medo)
   );
  end // Shifter2_block;
  endgenerate
assign N_18 = 7'b1111111;
assign N_15 = 1'b1;
assign GlobalResetSel = GlobalReset;
endmodule

//-----------------------------------------

//@
module smc_float_to_fp (
  input clk,
  input GlobalReset,
  input [31:0] x_i_porty, // ufix32_En0
  output [20:0] y_o, // sfix21_En0
  output srdyo_o, // ufix1
  input srdyi_i // ufix1
//@
);
//@

wire [0:0] N_4;  
wire [31:0] x_i_N_porty_1_2;  
wire [0:0] GlobalEnableSignal1;  
wire [20:0] N_6;  
wire [0:0] N_7;  
wire [31:0] N_5;  
wire GlobalResetSel;
  wire GlobalEnable1;
  assign GlobalEnable1 = 1;
    x2_i  myx_i (
      .clk(clk),
      .GlobalEnable1(GlobalEnable1),
      .GlobalReset(GlobalResetSel),
      .porty(x_i_N_porty_1_2),
      .y(N_5)    );
    FP_to_Fixed  myFP_to_Fixed (
      .clk(clk),
      .GlobalEnable1(GlobalEnable1),
      .GlobalReset(GlobalResetSel),
      .x(N_5),
      .srdyi(N_4),
      .y(N_6) ,
      .srdyo(N_7)    );
  assign GlobalEnableSignal1 = GlobalEnable1;
  assign x_i_N_porty_1_2 = x_i_porty;
assign y_o = N_6;
assign srdyo_o = N_7;
  assign N_4 = srdyi_i;
assign GlobalResetSel = GlobalReset;
endmodule

//-----------------------------------------

