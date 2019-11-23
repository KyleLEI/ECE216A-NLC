module NLC(
  input wire clk,
  input wire rst,
  
  input wire srdyi,
  output reg srdyo,
  
 	//Calibration control and reference ADC input
	//00 Fit the ADC with external coefficients feed with the ADC reading
	//01 Upgrade the fitting to 8th order with provided adc reading, coefficients and reference x
	//10 Calculate the fitting error of current coeefficients set with giving x reading, and x refe
	//11 Fit the ADC reading with stored coefficients
	//input wire [1:0]operation_mode_i, 
	//input wire [20:0] x_ref_i,
  
  output wire [20:0] x_lin,
	input wire [20:0] x_adc,
	input wire [31:0] recip_stdev,
	input wire [31:0] neg_mean,
	input wire [31:0] coeff_5,
	input wire [31:0] coeff_4,
	input wire [31:0] coeff_3,
	input wire [31:0] coeff_2,
	input wire [31:0] coeff_1,
	input wire [31:0] coeff_0
	);
	  
	wire [31:0] x_smc;
	wire srdyo_conv;
	
  fp_to_smc_float conv(clk,rst,x_smc, x_adc, srdyo_conv, srdyi);
  /*
  always@(posedge srdyo_conv) begin
    $display("Conversion Complete @ %d!",clk_cnt);
  end
  
  always@(posedge srdyi) begin
    $display("Data ready @ %d!",clk_cnt);
  end*/
  
  always@(posedge srdyo_conv) begin
    $display("Data ready after conversion @%d",clk_cnt);
  end
  
  wire [31:0] multiplier_result;
  wire srdyo_mul;
  smc_float_multiplier multiplier(clk,rst,x_smc,coeff_5,multiplier_result,srdyo_mul,srdyo_conv);
  always@(posedge srdyo_mul) begin
    $display("Multiplication complete @%d",clk_cnt);
  end
  
  
  
  integer clk_cnt = 0;
  always@(posedge clk) begin
    clk_cnt = clk_cnt + 1;
    //$display("Yeah");
  end
  
  
endmodule 
	