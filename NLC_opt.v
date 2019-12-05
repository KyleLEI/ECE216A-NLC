//Please do not change the name and port of the exitingance module

module NLC_opt(
	
	//System clock and reset
	input wire clk,
	input wire reset,

	//Input valid and output read signal(one for all 16ch)
	input wire srdyi,
	output wire srdyo,

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
  
  // reg rst;
  
  // Convert to smc
  wire [31:0] x_smc;
  wire [20:0] xi_fp_to_smc;
  wire smc_srdyo;
  wire smc_srdyi;
  
  // Convert to fp
  wire [31:0] x_fp;
  wire [20:0] xo_smc_to_fp;
  wire fp_srdyo;
  reg fp_srdyi;
  
  // Multiplier
  wire [31:0] mul_xi;
  wire [31:0] mul_yi; 
  wire [31:0] mul_zo; // from controller
  wire mul_srdyi; 
  wire mul_srdyo;
  
  // Adder
  wire [31:0] add_xi;
  wire [31:0] add_yi; 
  wire [31:0] add_zo; // from controller
  wire add_srdyi; 
  wire add_srdyo;
  
  //Convert input x_adc to smc
  fp_to_smc_float conv_to_smc(
        .clk(clk),
        .GlobalReset(reset),
        .y_o_portx(x_smc),
        .x_i(xi_fp_to_smc),
        .srdyo_o(smc_srdyo),
        .srdyi_i(smc_srdyi)
  );
  
  //Convert output x_lin to fp
  smc_float_to_fp conv_to_fp(
        .clk(clk),
        .GlobalReset(reset),
        .x_i_porty(x_fp),
        .y_o(xo_smc_to_fp),
        .srdyo_o(fp_srdyo),
        .srdyi_i(fp_srdyi)
  );
  
  // Instantiate multiplier
  smc_float_multiplier multiply(
	      .clk(clk),
	      .GlobalReset(reset),
	      .x_i_porty(mul_xi),
	      .y_i_porty(mul_yi),
	      .z_o_portx(mul_zo),
	      .srdyo_o(mul_srdyo),
	      .srdyi_i(mul_srdyi)
  );
  
  // Instantiate adder
  smc_float_adder add(
	      .clk(clk),
	      .GlobalReset(reset),
	      .x_i_porty(add_xi),
	      .y_i_porty(add_yi),
	      .z_o_portx(add_zo),
	      .srdyo_o(add_srdyo),
	      .srdyi_i(add_srdyi)
  );
  
  // Instantiate controller
  NLC_controller control(.clk(clk),.rst(reset),.srdyi(srdyi),.srdyo(srdyo),
  .conv_1_input(xi_fp_to_smc),.conv_1_output(x_smc),.conv_1_srdyi(smc_srdyi),.conv_1_srdyo(smc_srdyo),
  .multiplier_input_1(mul_xi),.multiplier_input_2(mul_yi),.multiplier_output(mul_zo),.multiplier_srdyi(mul_srdyi),.multiplier_srdyo(mul_srdyo),
  .adder_input_1(add_xi),.adder_input_2(add_yi),.adder_output(add_zo),.adder_srdyi(add_srdyi),.adder_srdyo(add_srdyo),
  .conv_2_input(x_fp),.conv_2_output(xo_smc_to_fp),.conv_2_srdyi(fp_srdyo),.conv_2_srdyo(fp_srdyi),
  .ch15_x_lin(ch15_x_lin),.ch15_x_adc(ch15_x_adc),.ch15_recip_stdev(ch15_recip_stdev),.ch15_neg_mean(ch15_neg_mean),.ch15_coeff_5(ch15_coeff_5),.ch15_coeff_4(ch15_coeff_4),.ch15_coeff_3(ch15_coeff_3),.ch15_coeff_2(ch15_coeff_2),.ch15_coeff_1(ch15_coeff_1),.ch15_coeff_0(ch15_coeff_0),
  .ch14_x_lin(ch14_x_lin),.ch14_x_adc(ch14_x_adc),.ch14_recip_stdev(ch14_recip_stdev),.ch14_neg_mean(ch14_neg_mean),.ch14_coeff_5(ch14_coeff_5),.ch14_coeff_4(ch14_coeff_4),.ch14_coeff_3(ch14_coeff_3),.ch14_coeff_2(ch14_coeff_2),.ch14_coeff_1(ch14_coeff_1),.ch14_coeff_0(ch14_coeff_0),
  .ch13_x_lin(ch13_x_lin),.ch13_x_adc(ch13_x_adc),.ch13_recip_stdev(ch13_recip_stdev),.ch13_neg_mean(ch13_neg_mean),.ch13_coeff_5(ch13_coeff_5),.ch13_coeff_4(ch13_coeff_4),.ch13_coeff_3(ch13_coeff_3),.ch13_coeff_2(ch13_coeff_2),.ch13_coeff_1(ch13_coeff_1),.ch13_coeff_0(ch13_coeff_0),
  .ch12_x_lin(ch12_x_lin),.ch12_x_adc(ch12_x_adc),.ch12_recip_stdev(ch12_recip_stdev),.ch12_neg_mean(ch12_neg_mean),.ch12_coeff_5(ch12_coeff_5),.ch12_coeff_4(ch12_coeff_4),.ch12_coeff_3(ch12_coeff_3),.ch12_coeff_2(ch12_coeff_2),.ch12_coeff_1(ch12_coeff_1),.ch12_coeff_0(ch12_coeff_0),
  .ch11_x_lin(ch11_x_lin),.ch11_x_adc(ch11_x_adc),.ch11_recip_stdev(ch11_recip_stdev),.ch11_neg_mean(ch11_neg_mean),.ch11_coeff_5(ch11_coeff_5),.ch11_coeff_4(ch11_coeff_4),.ch11_coeff_3(ch11_coeff_3),.ch11_coeff_2(ch11_coeff_2),.ch11_coeff_1(ch11_coeff_1),.ch11_coeff_0(ch11_coeff_0),
  .ch10_x_lin(ch10_x_lin),.ch10_x_adc(ch10_x_adc),.ch10_recip_stdev(ch10_recip_stdev),.ch10_neg_mean(ch10_neg_mean),.ch10_coeff_5(ch10_coeff_5),.ch10_coeff_4(ch10_coeff_4),.ch10_coeff_3(ch10_coeff_3),.ch10_coeff_2(ch10_coeff_2),.ch10_coeff_1(ch10_coeff_1),.ch10_coeff_0(ch10_coeff_0),
  .ch9_x_lin(ch9_x_lin),.ch9_x_adc(ch9_x_adc),.ch9_recip_stdev(ch9_recip_stdev),.ch9_neg_mean(ch9_neg_mean),.ch9_coeff_5(ch9_coeff_5),.ch9_coeff_4(ch9_coeff_4),.ch9_coeff_3(ch9_coeff_3),.ch9_coeff_2(ch9_coeff_2),.ch9_coeff_1(ch9_coeff_1),.ch9_coeff_0(ch9_coeff_0),
  .ch8_x_lin(ch8_x_lin),.ch8_x_adc(ch8_x_adc),.ch8_recip_stdev(ch8_recip_stdev),.ch8_neg_mean(ch8_neg_mean),.ch8_coeff_5(ch8_coeff_5),.ch8_coeff_4(ch8_coeff_4),.ch8_coeff_3(ch8_coeff_3),.ch8_coeff_2(ch8_coeff_2),.ch8_coeff_1(ch8_coeff_1),.ch8_coeff_0(ch8_coeff_0),
  .ch7_x_lin(ch7_x_lin),.ch7_x_adc(ch7_x_adc),.ch7_recip_stdev(ch7_recip_stdev),.ch7_neg_mean(ch7_neg_mean),.ch7_coeff_5(ch7_coeff_5),.ch7_coeff_4(ch7_coeff_4),.ch7_coeff_3(ch7_coeff_3),.ch7_coeff_2(ch7_coeff_2),.ch7_coeff_1(ch7_coeff_1),.ch7_coeff_0(ch7_coeff_0),
  .ch6_x_lin(ch6_x_lin),.ch6_x_adc(ch6_x_adc),.ch6_recip_stdev(ch6_recip_stdev),.ch6_neg_mean(ch6_neg_mean),.ch6_coeff_5(ch6_coeff_5),.ch6_coeff_4(ch6_coeff_4),.ch6_coeff_3(ch6_coeff_3),.ch6_coeff_2(ch6_coeff_2),.ch6_coeff_1(ch6_coeff_1),.ch6_coeff_0(ch6_coeff_0),
  .ch5_x_lin(ch5_x_lin),.ch5_x_adc(ch5_x_adc),.ch5_recip_stdev(ch5_recip_stdev),.ch5_neg_mean(ch5_neg_mean),.ch5_coeff_5(ch5_coeff_5),.ch5_coeff_4(ch5_coeff_4),.ch5_coeff_3(ch5_coeff_3),.ch5_coeff_2(ch5_coeff_2),.ch5_coeff_1(ch5_coeff_1),.ch5_coeff_0(ch5_coeff_0),
  .ch4_x_lin(ch4_x_lin),.ch4_x_adc(ch4_x_adc),.ch4_recip_stdev(ch4_recip_stdev),.ch4_neg_mean(ch4_neg_mean),.ch4_coeff_5(ch4_coeff_5),.ch4_coeff_4(ch4_coeff_4),.ch4_coeff_3(ch4_coeff_3),.ch4_coeff_2(ch4_coeff_2),.ch4_coeff_1(ch4_coeff_1),.ch4_coeff_0(ch4_coeff_0),
  .ch3_x_lin(ch3_x_lin),.ch3_x_adc(ch3_x_adc),.ch3_recip_stdev(ch3_recip_stdev),.ch3_neg_mean(ch3_neg_mean),.ch3_coeff_5(ch3_coeff_5),.ch3_coeff_4(ch3_coeff_4),.ch3_coeff_3(ch3_coeff_3),.ch3_coeff_2(ch3_coeff_2),.ch3_coeff_1(ch3_coeff_1),.ch3_coeff_0(ch3_coeff_0),
  .ch2_x_lin(ch2_x_lin),.ch2_x_adc(ch2_x_adc),.ch2_recip_stdev(ch2_recip_stdev),.ch2_neg_mean(ch2_neg_mean),.ch2_coeff_5(ch2_coeff_5),.ch2_coeff_4(ch2_coeff_4),.ch2_coeff_3(ch2_coeff_3),.ch2_coeff_2(ch2_coeff_2),.ch2_coeff_1(ch2_coeff_1),.ch2_coeff_0(ch2_coeff_0),
  .ch1_x_lin(ch1_x_lin),.ch1_x_adc(ch1_x_adc),.ch1_recip_stdev(ch1_recip_stdev),.ch1_neg_mean(ch1_neg_mean),.ch1_coeff_5(ch1_coeff_5),.ch1_coeff_4(ch1_coeff_4),.ch1_coeff_3(ch1_coeff_3),.ch1_coeff_2(ch1_coeff_2),.ch1_coeff_1(ch1_coeff_1),.ch1_coeff_0(ch1_coeff_0),
  .ch0_x_lin(ch0_x_lin),.ch0_x_adc(ch0_x_adc),.ch0_recip_stdev(ch0_recip_stdev),.ch0_neg_mean(ch0_neg_mean),.ch0_coeff_5(ch0_coeff_5),.ch0_coeff_4(ch0_coeff_4),.ch0_coeff_3(ch0_coeff_3),.ch0_coeff_2(ch0_coeff_2),.ch0_coeff_1(ch0_coeff_1),.ch0_coeff_0(ch0_coeff_0)            
  );


endmodule