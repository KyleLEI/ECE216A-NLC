//Please do not change the name and port of the exitingance module

module NLC_wrapper(
    input wire clk_port,
	input wire reset_port,

	input wire srdyi_port,
	output wire srdyo_port,


	input wire [1:0]operation_mode_i_port, 
	input wire [20:0] x_ref_i_port,

	output wire [20:0] ch_x_lin_port_15,
	output wire [20:0] ch_x_lin_port_14,
	output wire [20:0] ch_x_lin_port_13,
	output wire [20:0] ch_x_lin_port_12,
	output wire [20:0] ch_x_lin_port_11,
	output wire [20:0] ch_x_lin_port_10,
	output wire [20:0] ch_x_lin_port_9,
	output wire [20:0] ch_x_lin_port_8,
	output wire [20:0] ch_x_lin_port_7,
	output wire [20:0] ch_x_lin_port_6,
	output wire [20:0] ch_x_lin_port_5,
	output wire [20:0] ch_x_lin_port_4,
	output wire [20:0] ch_x_lin_port_3,
	output wire [20:0] ch_x_lin_port_2,
	output wire [20:0] ch_x_lin_port_1,
	output wire [20:0] ch_x_lin_port_0,
	
	input wire [20:0] ch_x_adc_port, 
	input wire [31:0] ch_recip_stdev_port,
	input wire [31:0] ch_neg_mean_port,
	input wire [31:0] ch_coeff_5_port,
	input wire [31:0] ch_coeff_4_port,
	input wire [31:0] ch_coeff_3_port,
	input wire [31:0] ch_coeff_2_port,
	input wire [31:0] ch_coeff_1_port,
	input wire [31:0] ch_coeff_0_port
);

NLC_opt DUT_NLC(
	
	.clk(clk_port),
	.reset(reset_port),
	.srdyi(srdyi_port),
	.srdyo(srdyo_port),
	.operation_mode_i(operation_mode_i_port), 
	.x_ref_i(x_ref_i_port),




	.ch15_x_lin(ch_x_lin_port_15),
	.ch15_x_adc(ch_x_adc_port), 
	.ch15_recip_stdev(ch_recip_stdev_port),
	.ch15_neg_mean(ch_neg_mean_port),
	.ch15_coeff_5(ch_coeff_5_port),
	.ch15_coeff_4(ch_coeff_4_port),
	.ch15_coeff_3(ch_coeff_3_port),
	.ch15_coeff_2(ch_coeff_2_port),
	.ch15_coeff_1(ch_coeff_1_port),
	.ch15_coeff_0(ch_coeff_0_port),






	.ch14_x_lin(ch_x_lin_port_14),
	.ch14_x_adc(ch_x_adc_port),
	.ch14_recip_stdev(ch_recip_stdev_port),
	.ch14_neg_mean(ch_neg_mean_port),
	.ch14_coeff_5(ch_coeff_5_port),
	.ch14_coeff_4(ch_coeff_4_port),
	.ch14_coeff_3(ch_coeff_3_port),
	.ch14_coeff_2(ch_coeff_2_port),
	.ch14_coeff_1(ch_coeff_1_port),
	.ch14_coeff_0(ch_coeff_0_port),






	.ch13_x_lin(ch_x_lin_port_13),
	.ch13_x_adc(ch_x_adc_port),
	.ch13_recip_stdev(ch_recip_stdev_port),
	.ch13_neg_mean(ch_neg_mean_port),
	.ch13_coeff_5(ch_coeff_5_port),
	.ch13_coeff_4(ch_coeff_4_port),
	.ch13_coeff_3(ch_coeff_3_port),
	.ch13_coeff_2(ch_coeff_2_port),
	.ch13_coeff_1(ch_coeff_1_port),
	.ch13_coeff_0(ch_coeff_0_port),









	.ch12_x_lin(ch_x_lin_port_12),
	.ch12_x_adc(ch_x_adc_port),
	.ch12_recip_stdev(ch_recip_stdev_port),
	.ch12_neg_mean(ch_neg_mean_port),
	.ch12_coeff_5(ch_coeff_5_port),
	.ch12_coeff_4(ch_coeff_4_port),
	.ch12_coeff_3(ch_coeff_3_port),
	.ch12_coeff_2(ch_coeff_2_port),
	.ch12_coeff_1(ch_coeff_1_port),
	.ch12_coeff_0(ch_coeff_0_port),






	.ch11_x_lin(ch_x_lin_port_11),
	.ch11_x_adc(ch_x_adc_port),
	.ch11_recip_stdev(ch_recip_stdev_port),
	.ch11_neg_mean(ch_neg_mean_port),
	.ch11_coeff_5(ch_coeff_5_port),
	.ch11_coeff_4(ch_coeff_4_port),
	.ch11_coeff_3(ch_coeff_3_port),
	.ch11_coeff_2(ch_coeff_2_port),
	.ch11_coeff_1(ch_coeff_1_port),
	.ch11_coeff_0(ch_coeff_0_port),







	.ch10_x_lin(ch_x_lin_port_10),
	.ch10_x_adc(ch_x_adc_port),
	.ch10_recip_stdev(ch_recip_stdev_port),
	.ch10_neg_mean(ch_neg_mean_port),
	.ch10_coeff_5(ch_coeff_5_port),
	.ch10_coeff_4(ch_coeff_4_port),
	.ch10_coeff_3(ch_coeff_3_port),
	.ch10_coeff_2(ch_coeff_2_port),
	.ch10_coeff_1(ch_coeff_1_port),
	.ch10_coeff_0(ch_coeff_0_port),






	.ch9_x_lin(ch_x_lin_port_9),
	.ch9_x_adc(ch_x_adc_port),
	.ch9_recip_stdev(ch_recip_stdev_port),
	.ch9_neg_mean(ch_neg_mean_port),
	.ch9_coeff_5(ch_coeff_5_port),
	.ch9_coeff_4(ch_coeff_4_port),
	.ch9_coeff_3(ch_coeff_3_port),
	.ch9_coeff_2(ch_coeff_2_port),
	.ch9_coeff_1(ch_coeff_1_port),
	.ch9_coeff_0(ch_coeff_0_port),






	.ch8_x_lin(ch_x_lin_port_8),
	.ch8_x_adc(ch_x_adc_port),
	.ch8_recip_stdev(ch_recip_stdev_port),
	.ch8_neg_mean(ch_neg_mean_port),
	.ch8_coeff_5(ch_coeff_5_port),
	.ch8_coeff_4(ch_coeff_4_port),
	.ch8_coeff_3(ch_coeff_3_port),
	.ch8_coeff_2(ch_coeff_2_port),
	.ch8_coeff_1(ch_coeff_1_port),
	.ch8_coeff_0(ch_coeff_0_port),






	.ch7_x_lin(ch_x_lin_port_7),
	.ch7_x_adc(ch_x_adc_port),
	.ch7_recip_stdev(ch_recip_stdev_port),
	.ch7_neg_mean(ch_neg_mean_port),
	.ch7_coeff_5(ch_coeff_5_port),
	.ch7_coeff_4(ch_coeff_4_port),
	.ch7_coeff_3(ch_coeff_3_port),
	.ch7_coeff_2(ch_coeff_2_port),
	.ch7_coeff_1(ch_coeff_1_port),
	.ch7_coeff_0(ch_coeff_0_port),





	.ch6_x_lin(ch_x_lin_port_6),
	.ch6_x_adc(ch_x_adc_port),
	.ch6_recip_stdev(ch_recip_stdev_port),
	.ch6_neg_mean(ch_neg_mean_port),
	.ch6_coeff_5(ch_coeff_5_port),
	.ch6_coeff_4(ch_coeff_4_port),
	.ch6_coeff_3(ch_coeff_3_port),
	.ch6_coeff_2(ch_coeff_2_port),
	.ch6_coeff_1(ch_coeff_1_port),
	.ch6_coeff_0(ch_coeff_0_port),






	.ch5_x_lin(ch_x_lin_port_5), 
	.ch5_x_adc(ch_x_adc_port),
	.ch5_recip_stdev(ch_recip_stdev_port),
	.ch5_neg_mean(ch_neg_mean_port),
	.ch5_coeff_5(ch_coeff_5_port),
	.ch5_coeff_4(ch_coeff_4_port),
	.ch5_coeff_3(ch_coeff_3_port),
	.ch5_coeff_2(ch_coeff_2_port),
	.ch5_coeff_1(ch_coeff_1_port),
	.ch5_coeff_0(ch_coeff_0_port),





	.ch4_x_lin(ch_x_lin_port_4), 
	.ch4_x_adc(ch_x_adc_port),
	.ch4_recip_stdev(ch_recip_stdev_port),
	.ch4_neg_mean(ch_neg_mean_port),
	.ch4_coeff_5(ch_coeff_5_port),
	.ch4_coeff_4(ch_coeff_4_port),
	.ch4_coeff_3(ch_coeff_3_port),
	.ch4_coeff_2(ch_coeff_2_port),
	.ch4_coeff_1(ch_coeff_1_port),
	.ch4_coeff_0(ch_coeff_0_port),






	.ch3_x_lin(ch_x_lin_port_3), 
	.ch3_x_adc(ch_x_adc_port),
	.ch3_recip_stdev(ch_recip_stdev_port),
	.ch3_neg_mean(ch_neg_mean_port),
	.ch3_coeff_5(ch_coeff_5_port),
	.ch3_coeff_4(ch_coeff_4_port),
	.ch3_coeff_3(ch_coeff_3_port),
	.ch3_coeff_2(ch_coeff_2_port),
	.ch3_coeff_1(ch_coeff_1_port),
	.ch3_coeff_0(ch_coeff_0_port),






	.ch2_x_lin(ch_x_lin_port_2), 
	.ch2_x_adc(ch_x_adc_port),
	.ch2_recip_stdev(ch_recip_stdev_port),
	.ch2_neg_mean(ch_neg_mean_port),
	.ch2_coeff_5(ch_coeff_5_port),
	.ch2_coeff_4(ch_coeff_4_port),
	.ch2_coeff_3(ch_coeff_3_port),
	.ch2_coeff_2(ch_coeff_2_port),
	.ch2_coeff_1(ch_coeff_1_port),
	.ch2_coeff_0(ch_coeff_0_port),






	.ch1_x_lin(ch_x_lin_port_1), 
	.ch1_x_adc(ch_x_adc_port),
	.ch1_recip_stdev(ch_recip_stdev_port),
	.ch1_neg_mean(ch_neg_mean_port),
	.ch1_coeff_5(ch_coeff_5_port),
	.ch1_coeff_4(ch_coeff_4_port),
	.ch1_coeff_3(ch_coeff_3_port),
	.ch1_coeff_2(ch_coeff_2_port),
	.ch1_coeff_1(ch_coeff_1_port),
	.ch1_coeff_0(ch_coeff_0_port),







	.ch0_x_lin(ch_x_lin_port_0), 
	.ch0_x_adc(ch_x_adc_port),
	.ch0_recip_stdev(ch_recip_stdev_port),
	.ch0_neg_mean(ch_neg_mean_port),
	.ch0_coeff_5(ch_coeff_5_port),
	.ch0_coeff_4(ch_coeff_4_port),
	.ch0_coeff_3(ch_coeff_3_port),
	.ch0_coeff_2(ch_coeff_2_port),
	.ch0_coeff_1(ch_coeff_1_port),
	.ch0_coeff_0(ch_coeff_0_port)
	);


endmodule