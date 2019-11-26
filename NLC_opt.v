//Please do not change the name and port of the exitingance module

module NLC_opt(
	
	//System clock and reset
	input wire clk,
	input wire reset,

	//Input valid and output read signal(one for all 16ch)
	input wire srdyi,
	output reg srdyo,

	//Calibration control and reference ADC input
	//00 Fit the ADC with external coefficients feed with the ADC reading
	//01 Upgrade the fitting to 8th order with provided adc reading, coefficients and reference x
	//10 Calculate the fitting error of current coeefficients set with giving x reading, and x refe
	//11 Fit the ADC reading with stored coefficients
	input wire [1:0]operation_mode_i, 
	input wire [20:0] x_ref_i,

	//NLC IO ports
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
	
	/*NLC nlc_ch0(.clk(clk),.rst(reset),.srdyi(srdyi),.srdyo(ch0_srdyo),.x_lin(ch0_x_lin),.x_adc(ch0_x_adc),.recip_stdev(ch0_recip_stdev),
.neg_mean(ch0_neg_mean),.coeff_5(ch0_coeff_5),.coeff_4(ch0_coeff_4),.coeff_3(ch0_coeff_3),.coeff_2(ch0_coeff_2),.coeff_1(ch0_coeff_1),
.coeff_0(ch0_coeff_0));*/
  
  wire conv_srdyi;
  wire [20:0] conv_input;
  wire conv_srdyo;
  wire multiplier_srdyi;
  wire [31:0] multiplier_input_1;
  wire [31:0] multiplier_input_2; // from controller
  wire multiplier_srdyo;
  wire adder_srdyi;
  wire [31:0] adder_input_1;
  wire [31:0] adder_input_2; // from controller
  wire adder_srdyo;
  
  fp_to_smc_float conv(clk,rst,x_smc, x_adc, srdyo_conv, srdyi);
  always@(posedge )


endmodule