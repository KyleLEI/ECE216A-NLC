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
  input wire adder_srdio,
  
  //IO ports for ch15
  integer power_ch15,
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
	integer power_ch14,
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
	integer power_ch13,
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
	integer power_ch12,
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
	integer power_ch11,
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
	integer power_ch10,
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
	integer power_ch9,
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
	integer power_ch8,
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
	integer power_ch7,
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
	integer power_ch6,
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
	integer power_ch5,
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
	integer power_ch4,
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
	integer power_ch3,
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
	integer power_ch2,
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
	integer power_ch1,
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
	integer power_ch0,
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
  reg [31:0] next_multiplier_input;
  reg next_multiplier_srdyi;
  
  /* Adder */
  reg [31:0] next_adder_input;
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
  
  
  
 
  
  always@(posedge clk) begin
    if(rst) begin
      $display("Reset");
      clk_cnt <= 0;
    end
    else begin
      conv_srdyi <= next_conv_srdyi;
      conv_input <= next_conv_input;
      adder_srdyi <= next_adder_srdyi;
      adder_input_2 <= next_adder_input;
      multiplier_srdyi <= next_multiplier_srdyi;
      multiplier_input_2 <= next_multiplier_input;
      
    end
  end
  

  /* Input, feed one per cycle */
  integer clk_cnt = 0;
  always@(posedge srdyi) begin
    case(clk_cnt)
      0: begin
       next_conv_srdyi <= 1; // start conversion
       next_conv_input <= ch0_x_adc;
      end
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
    16: next_conv_srdyi <= 0; // stop the conversion
    endcase
  end
  
  /* Output */
  integer 
  always@(posedge conv_srdyo) begin
    
  end

  
endmodule 
	