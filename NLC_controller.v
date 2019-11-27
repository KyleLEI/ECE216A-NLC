module NLC_controller(
  input wire clk,
  input wire rst,
  
  input wire srdyi,
  output wire srdyo,
  
  	//input wire [1:0]operation_mode_i, 
	//input wire [20:0] x_ref_i,
  
  /* Data format converter */
  output reg [20:0] conv_input,
  input reg [31:0] conv_output,
  output reg conv_srdyi,
  input wire conv_srdyo,
  

  /* Multiplier */
  output reg [31:0] multiplier_input_1,
  output reg [31:0] multiplier_input_2, // a_5 at first, adder_input next
  input reg [31:0] multiplier_output,
  output reg multiplier_srdyi,
  input wire multiplier_srdyo,
  
  /* Adder */
  output reg [31:0] adder_input_1,
  output reg [31:0] adder_input_2, //a_i, i=4->0
  input wire [31:0] adder_output,
  output reg adder_srdyi,
  input wire adder_srdyo,
  
  //IO ports for ch15
	output wire [20:0] ch15_x_lin,
	input wire [20:0] ch15_x_adc, 
	input wire [31:0] ch15_recip_stdev,
	input wire [31:0] ch15_neg_mean,
	input wire [31:0] ch15_coeff_5,
	input wire [31:0] ch15_coeff_4,
	input wire [31:0] ch15_coeff_3,
	input wire [31:0] ch15_coeff_2,
	input wire [31:0] ch15_coeff_1,
	input wire [31:0] ch15_coeff_0,

	//IO ports for ch14
	output wire [20:0] ch14_x_lin,
	input wire [20:0] ch14_x_adc,
	input wire [31:0] ch14_recip_stdev,
	input wire [31:0] ch14_neg_mean,
	input wire [31:0] ch14_coeff_5,
	input wire [31:0] ch14_coeff_4,
	input wire [31:0] ch14_coeff_3,
	input wire [31:0] ch14_coeff_2,
	input wire [31:0] ch14_coeff_1,
	input wire [31:0] ch14_coeff_0,

	//IO ports for ch13
	output wire [20:0] ch13_x_lin,
	input wire [20:0] ch13_x_adc,
	input wire [31:0] ch13_recip_stdev,
	input wire [31:0] ch13_neg_mean,
	input wire [31:0] ch13_coeff_5,
	input wire [31:0] ch13_coeff_4,
	input wire [31:0] ch13_coeff_3,
	input wire [31:0] ch13_coeff_2,
	input wire [31:0] ch13_coeff_1,
	input wire [31:0] ch13_coeff_0,

	//IO ports for ch12
	output wire [20:0] ch12_x_lin,
	input wire [20:0] ch12_x_adc,
	input wire [31:0] ch12_recip_stdev,
	input wire [31:0] ch12_neg_mean,
	input wire [31:0] ch12_coeff_5,
	input wire [31:0] ch12_coeff_4,
	input wire [31:0] ch12_coeff_3,
	input wire [31:0] ch12_coeff_2,
	input wire [31:0] ch12_coeff_1,
	input wire [31:0] ch12_coeff_0,

	//IO ports for ch11
	output wire [20:0] ch11_x_lin,
	input wire [20:0] ch11_x_adc,
	input wire [31:0] ch11_recip_stdev,
	input wire [31:0] ch11_neg_mean,
	input wire [31:0] ch11_coeff_5,
	input wire [31:0] ch11_coeff_4,
	input wire [31:0] ch11_coeff_3,
	input wire [31:0] ch11_coeff_2,
	input wire [31:0] ch11_coeff_1,
	input wire [31:0] ch11_coeff_0,

	//IO ports for ch10
	output wire [20:0] ch10_x_lin,
	input wire [20:0] ch10_x_adc,
	input wire [31:0] ch10_recip_stdev,
	input wire [31:0] ch10_neg_mean,
	input wire [31:0] ch10_coeff_5,
	input wire [31:0] ch10_coeff_4,
	input wire [31:0] ch10_coeff_3,
	input wire [31:0] ch10_coeff_2,
	input wire [31:0] ch10_coeff_1,
	input wire [31:0] ch10_coeff_0,

	//IO ports for ch5
	output wire [20:0] ch9_x_lin,
	input wire [20:0] ch9_x_adc,
	input wire [31:0] ch9_recip_stdev,
	input wire [31:0] ch9_neg_mean,
	input wire [31:0] ch9_coeff_5,
	input wire [31:0] ch9_coeff_4,
	input wire [31:0] ch9_coeff_3,
	input wire [31:0] ch9_coeff_2,
	input wire [31:0] ch9_coeff_1,
	input wire [31:0] ch9_coeff_0,

	//IO ports for ch8
	output wire [20:0] ch8_x_lin,
	input wire [20:0] ch8_x_adc,
	input wire [31:0] ch8_recip_stdev,
	input wire [31:0] ch8_neg_mean,
	input wire [31:0] ch8_coeff_5,
	input wire [31:0] ch8_coeff_4,
	input wire [31:0] ch8_coeff_3,
	input wire [31:0] ch8_coeff_2,
	input wire [31:0] ch8_coeff_1,
	input wire [31:0] ch8_coeff_0,

	//IO ports for ch7
	output wire [20:0] ch7_x_lin,
	input wire [20:0] ch7_x_adc,
	input wire [31:0] ch7_recip_stdev,
	input wire [31:0] ch7_neg_mean,
	input wire [31:0] ch7_coeff_5,
	input wire [31:0] ch7_coeff_4,
	input wire [31:0] ch7_coeff_3,
	input wire [31:0] ch7_coeff_2,
	input wire [31:0] ch7_coeff_1,
	input wire [31:0] ch7_coeff_0,

	//IO ports for ch6
	output wire [20:0] ch6_x_lin,
	input wire [20:0] ch6_x_adc,
	input wire [31:0] ch6_recip_stdev,
	input wire [31:0] ch6_neg_mean,
	input wire [31:0] ch6_coeff_5,
	input wire [31:0] ch6_coeff_4,
	input wire [31:0] ch6_coeff_3,
	input wire [31:0] ch6_coeff_2,
	input wire [31:0] ch6_coeff_1,
	input wire [31:0] ch6_coeff_0,
	
	//IO ports for ch5
	output wire [20:0] ch5_x_lin, 
	input wire [20:0] ch5_x_adc,
	input wire [31:0] ch5_recip_stdev,
	input wire [31:0] ch5_neg_mean,
	input wire [31:0] ch5_coeff_5,
	input wire [31:0] ch5_coeff_4,
	input wire [31:0] ch5_coeff_3,
	input wire [31:0] ch5_coeff_2,
	input wire [31:0] ch5_coeff_1,
	input wire [31:0] ch5_coeff_0,
	
	//IO ports for ch4
	output wire [20:0] ch4_x_lin, 
	input wire [20:0] ch4_x_adc,
	input wire [31:0] ch4_recip_stdev,
	input wire [31:0] ch4_neg_mean,
	input wire [31:0] ch4_coeff_5,
	input wire [31:0] ch4_coeff_4,
	input wire [31:0] ch4_coeff_3,
	input wire [31:0] ch4_coeff_2,
	input wire [31:0] ch4_coeff_1,
	input wire [31:0] ch4_coeff_0,
	
	//IO ports for ch3
	output wire [20:0] ch3_x_lin, 
	input wire [20:0] ch3_x_adc,
	input wire [31:0] ch3_recip_stdev,
	input wire [31:0] ch3_neg_mean,
	input wire [31:0] ch3_coeff_5,
	input wire [31:0] ch3_coeff_4,
	input wire [31:0] ch3_coeff_3,
	input wire [31:0] ch3_coeff_2,
	input wire [31:0] ch3_coeff_1,
	input wire [31:0] ch3_coeff_0,
	
	//IO ports for ch2
	output wire [20:0] ch2_x_lin, 
	input wire [20:0] ch2_x_adc,
	input wire [31:0] ch2_recip_stdev,
	input wire [31:0] ch2_neg_mean,
	input wire [31:0] ch2_coeff_5,
	input wire [31:0] ch2_coeff_4,
	input wire [31:0] ch2_coeff_3,
	input wire [31:0] ch2_coeff_2,
	input wire [31:0] ch2_coeff_1,
	input wire [31:0] ch2_coeff_0,

	//IO ports for ch1
	output wire [20:0] ch1_x_lin, 
	input wire [20:0] ch1_x_adc,
	input wire [31:0] ch1_recip_stdev,
	input wire [31:0] ch1_neg_mean,
	input wire [31:0] ch1_coeff_5,
	input wire [31:0] ch1_coeff_4,
	input wire [31:0] ch1_coeff_3,
	input wire [31:0] ch1_coeff_2,
	input wire [31:0] ch1_coeff_1,
	input wire [31:0] ch1_coeff_0,
	
	//IO ports for ch0
	output wire [20:0] ch0_x_lin, 
	input wire [20:0] ch0_x_adc,
	input wire [31:0] ch0_recip_stdev,
	input wire [31:0] ch0_neg_mean,
	input wire [31:0] ch0_coeff_5,
	input wire [31:0] ch0_coeff_4,
	input wire [31:0] ch0_coeff_3,
	input wire [31:0] ch0_coeff_2,
	input wire [31:0] ch0_coeff_1,
	input wire [31:0] ch0_coeff_0
	);
	/* Converter */
  reg [20:0] next_conv_input;
  reg next_conv_srdyi;
  
	/* Multiplier */
  reg [31:0] next_mul_input_1;
  reg [31:0] next_mul_input_2;
  reg next_mul_srdyi;
  
  /* Adder */
  reg [31:0] next_adder_input_1;
  reg [31:0] next_adder_input_2;
  reg next_adder_srdyi;
  
  /* IO */
  reg [31:0] ch15_x_smc;
  reg [31:0] ch14_x_smc;
  reg [31:0] ch13_x_smc;
  reg [31:0] ch12_x_smc;
  reg [31:0] ch11_x_smc;
  reg [31:0] ch10_x_smc;
  reg [31:0] ch9_x_smc;
  reg [31:0] ch8_x_smc;
  reg [31:0] ch7_x_smc;
  reg [31:0] ch6_x_smc;
  reg [31:0] ch5_x_smc;
  reg [31:0] ch4_x_smc;
  reg [31:0] ch3_x_smc;
  reg [31:0] ch2_x_smc;
  reg [31:0] ch1_x_smc;
  reg [31:0] ch0_x_smc;
  
  
  
  integer clk_cnt;
  always@(posedge clk) begin
    if(rst) begin
      $display("Reset");
      clk_cnt = 0;
    end
    else begin
      conv_srdyi <= next_conv_srdyi;
      conv_input <= next_conv_input;
      adder_srdyi <= next_adder_srdyi;
      adder_input_1 <= next_adder_input_1;
      adder_input_2 <= next_adder_input_2;
      multiplier_srdyi <= next_mul_srdyi;
      multiplier_input_1 <= next_mul_input_1;
      multiplier_input_2 <= next_mul_input_2;
    end
  end
  

  /* Converter input, feed one per cycle */
  reg start_conv = 0;
	integer conv_cnt = 0;
	
  always@(posedge srdyi) begin
    start_conv <= 1;
    next_conv_srdyi <= 1;
  end
  
  always@(*) begin // FIXME: cluster these unsafe methods
    case(conv_cnt)
      0: next_conv_input <= ch0_x_adc;
      1: next_conv_input <= ch1_x_adc;
      2: next_conv_input <= ch2_x_adc;
      3: next_conv_input <= ch3_x_adc;
      4: next_conv_input <= ch4_x_adc;
      5: next_conv_input <= ch5_x_adc;
      6: next_conv_input <= ch6_x_adc;
      7: next_conv_input <= ch7_x_adc;
      8: next_conv_input <= ch8_x_adc;
      9: next_conv_input <= ch9_x_adc;
     10: next_conv_input <= ch10_x_adc;
     11: next_conv_input <= ch11_x_adc;
     12: next_conv_input <= ch12_x_adc;
     13: next_conv_input <= ch13_x_adc;
     14: next_conv_input <= ch14_x_adc;
     15: next_conv_input <= ch15_x_adc;
     16: begin
      next_conv_srdyi <= 0; // stop the conversion
      start_conv <= 0;
      conv_cnt = 0;
    end
    endcase
  end
  
  always@(posedge clk) if(start_conv) conv_cnt <= conv_cnt + 1;
  
  /* Converter output, normalization adder input */
  integer norm_add_cnt = 0;
  reg start_normalize_add = 0;

  always@(posedge conv_srdyo) begin
    start_normalize_add <= 1;
    next_adder_srdyi <= 1;
  end
  
  always@(*) begin
    next_adder_input_1 <= conv_output;
    case(norm_add_cnt)
      0: next_adder_input_2 <= ch0_neg_mean;
      1: next_adder_input_2 <= ch1_neg_mean;
      2: next_adder_input_2 <= ch2_neg_mean;
      3: next_adder_input_2 <= ch3_neg_mean;
      4: next_adder_input_2 <= ch4_neg_mean;
      5: next_adder_input_2 <= ch5_neg_mean;
      6: next_adder_input_2 <= ch6_neg_mean;
      7: next_adder_input_2 <= ch7_neg_mean;
      8: next_adder_input_2 <= ch8_neg_mean;
      9: next_adder_input_2 <= ch9_neg_mean;
      10: next_adder_input_2 <= ch10_neg_mean;
      11: next_adder_input_2 <= ch11_neg_mean;
      12: next_adder_input_2 <= ch12_neg_mean;
      13: next_adder_input_2 <= ch13_neg_mean;
      14: next_adder_input_2 <= ch14_neg_mean;
      15: next_adder_input_2 <= ch15_neg_mean;
    endcase//TODO: turn off adder until needed in main loop
  end
  
  always@(posedge clk) if(start_normalize_add) norm_add_cnt <= norm_add_cnt + 1;
  
  /* Normalization adder output, normalization multiplier input */
  integer norm_mul_cnt = 0;
  reg start_normalize_mul = 0;
  reg norm_mul_complete = 0;
  
  always@(posedge adder_srdyo) begin
    start_normalize_mul <= 1;
    next_mul_srdyi <= 1;
  end
  
  always@(*) begin
    next_mul_input_1 = adder_output;
    case(norm_mul_cnt)
      0: next_mul_input_2 <= ch0_recip_stdev;
      1: next_mul_input_2 <= ch1_recip_stdev;
      2: next_mul_input_2 <= ch2_recip_stdev;
      3: next_mul_input_2 <= ch3_recip_stdev;
      4: next_mul_input_2 <= ch4_recip_stdev;
      5: next_mul_input_2 <= ch5_recip_stdev;
      6: next_mul_input_2 <= ch6_recip_stdev;
      7: next_mul_input_2 <= ch7_recip_stdev;
      8: next_mul_input_2 <= ch8_recip_stdev;
      9: next_mul_input_2 <= ch9_recip_stdev;
      10: next_mul_input_2 <= ch10_recip_stdev;
      11: next_mul_input_2 <= ch11_recip_stdev;
      12: next_mul_input_2 <= ch12_recip_stdev;
      13: next_mul_input_2 <= ch13_recip_stdev;
      14: next_mul_input_2 <= ch14_recip_stdev;
      15: next_mul_input_2 <= ch15_recip_stdev;
    endcase
    if(norm_mul_cnt>15)
      norm_mul_complete = 1;
  end
  
  always@(posedge clk) if(start_normalize_mul) norm_mul_cnt <= norm_mul_cnt + 1;
  
  /* Normalization multiplier output, main loop input */
  integer order = 5;
  integer ch = 0;
  
  /* Multiplication */
  always@(posedge norm_mul_complete) begin
    case(order)
      5: begin
        next_mul_input_1 <= adder_output;
        case(ch)
          0: next_mul_input_1 <= ch0_coeff_5; // FIXME: may not be aligned correctly
          1: next_mul_input_1 <= ch1_coeff_5;
        endcase
      end
    endcase
  end
  
  /* Adder */
  always@(*) begin // TODO: find some way to trigger this
    case(order)
      5: begin
        next_adder_input_1 <= multiplier_output;
        case(ch)
          0: next_adder_input_2 <= ch0_coeff_4;
        endcase
      end
    endcase
  end
endmodule 
	