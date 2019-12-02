module NLC_controller(
  input wire clk,
  input wire rst,
  
  input wire srdyi,
  output wire srdyo,
  
  	//input wire [1:0]operation_mode_i, 
	//input wire [20:0] x_ref_i,
  
  /* FP-to-SMC converter */
  output reg [20:0] conv_1_input,
  input reg [31:0] conv_1_output,
  output reg conv_1_srdyi,
  input wire conv_1_srdyo,
  

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
  
  /* SMC-to-FP converter */
  output reg [31:0] conv_2_input,
  input reg [20:0] conv_2_output,
  output reg conv_2_srdyi,
  input wire conv_2_srdyo,
  
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
	/* FP-to-SMC Converter */
  reg [20:0] next_conv_1_input;
  reg next_conv_1_srdyi;
  
	/* Multiplier */
  reg [31:0] next_mul_input_1;
  reg [31:0] next_mul_input_2;
  reg next_mul_srdyi;
  
  /* Adder */
  reg [31:0] next_adder_input_1;
  reg [31:0] next_adder_input_2;
  reg next_adder_srdyi;
  
  /* Converter input, feed one per cycle */
  reg start_conv = 0;
	integer conv_cnt = 0;
	
	/* Converter output, normalization adder input */
  integer norm_add_cnt = 0;
  reg start_normalize_add = 0;
  
  /* Normalization adder output, normalization multiplier input */
  integer norm_mul_cnt = 0;
  reg start_normalize_mul = 0;
  
  
  integer clk_cnt;
  always@(posedge clk) begin
    if(rst) begin
      conv_cnt = 0;
      norm_add_cnt = 0;
      norm_mul_cnt = 0;
      $display("Reset");
      clk_cnt = 0;
    end
    else begin
      conv_1_srdyi <= next_conv_1_srdyi;
      conv_1_input <= next_conv_1_input;
      adder_srdyi <= next_adder_srdyi;
      adder_input_1 <= next_adder_input_1;
      adder_input_2 <= next_adder_input_2;
      multiplier_srdyi <= next_mul_srdyi;
      multiplier_input_1 <= next_mul_input_1;
      multiplier_input_2 <= next_mul_input_2;
    end
  end
  
	
  always@(posedge srdyi) begin
    start_conv <= 1;
    next_conv_1_srdyi <= 1;
  end
  
  always@(*) begin // FIXME: cluster these unsafe methods
    case(conv_cnt)
      0: next_conv_1_input <= ch0_x_adc;
      1: next_conv_1_input <= ch1_x_adc;
      2: next_conv_1_input <= ch2_x_adc;
      3: next_conv_1_input <= ch3_x_adc;
      4: next_conv_1_input <= ch4_x_adc;
      5: next_conv_1_input <= ch5_x_adc;
      6: next_conv_1_input <= ch6_x_adc;
      7: next_conv_1_input <= ch7_x_adc;
      8: next_conv_1_input <= ch8_x_adc;
      9: next_conv_1_input <= ch9_x_adc;
     10: next_conv_1_input <= ch10_x_adc;
     11: next_conv_1_input <= ch11_x_adc;
     12: next_conv_1_input <= ch12_x_adc;
     13: next_conv_1_input <= ch13_x_adc;
     14: next_conv_1_input <= ch14_x_adc;
     15: next_conv_1_input <= ch15_x_adc;
     16: begin
           next_conv_1_srdyi <= 0; // stop the conversion
           start_conv <= 0;
           conv_cnt = 0;
         end
    endcase
  end
  
  always@(posedge clk) if(start_conv) conv_cnt <= conv_cnt + 1;
  

  always@(posedge conv_1_srdyo) begin
    start_normalize_add <= 1;
    next_adder_srdyi <= 1;
  end
  
  always@(*) begin
    next_adder_input_1 <= conv_1_output;
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
      16: begin
            next_adder_srdyi <= 0;
          end
    endcase//TODO: turn off adder until needed in main loop
  end
  
  always@(posedge clk) if(start_normalize_add) norm_add_cnt <= norm_add_cnt + 1;
  
  /* Normalization adder output, normalization multiplier input */
  /*integer norm_mul_cnt = 0;
  reg start_normalize_mul = 0;*/
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
  
  
  /* Store all normalized x */
  reg [31:0] ch15_norm;
  reg [31:0] ch14_norm;
  reg [31:0] ch13_norm;
  reg [31:0] ch12_norm;
  reg [31:0] ch11_norm;
  reg [31:0] ch10_norm;
  reg [31:0] ch9_norm;
  reg [31:0] ch8_norm;
  reg [31:0] ch7_norm;
  reg [31:0] ch6_norm;
  reg [31:0] ch5_norm;
  reg [31:0] ch4_norm;
  reg [31:0] ch3_norm;
  reg [31:0] ch2_norm;
  reg [31:0] ch1_norm;
  reg [31:0] ch0_norm;
  
  
  reg start_store_norm;
  integer store_cnt;
  
  
  always@(posedge mul_srdyo) begin
    start_store_norm <= 1;
  end
    
  
  /* Store multiplier results in registers for future use */
  always@(*) begin
    case(store_cnt)
      0: ch0_norm <= multiplier_output;
      1: ch1_norm <= multiplier_output;
      2: ch2_norm <= multiplier_output;
      3: ch3_norm <= multiplier_output;
      4: ch4_norm <= multiplier_output;
      5: ch5_norm <= multiplier_output;
      6: ch6_norm <= multiplier_output;
      7: ch7_norm <= multiplier_output;
      8: ch8_norm <= multiplier_output;
      9: ch9_norm <= multiplier_output;
      10: ch10_norm <= multiplier_output;
      11: ch11_norm <= multiplier_output;
      12: ch12_norm <= multiplier_output;
      13: ch13_norm <= multiplier_output;
      14: ch14_norm <= multiplier_output;
      15: ch15_norm <= multiplier_output;
    endcase
  end
  
  always@(posedge clk) if(start_store_norm) store_cnt <= store_cnt + 1;  
  
  /* Handle structural hazard */
  
  reg [31:0] ch15_haz_reg;
  reg [31:0] ch14_haz_reg;
  reg [31:0] ch13_haz_reg;
  reg [31:0] ch12_haz_reg;
  reg [31:0] ch11_haz_reg;
  reg [31:0] ch10_haz_reg;
  reg [31:0] ch9_haz_reg;
  reg [31:0] ch8_haz_reg;
  reg [31:0] ch7_haz_reg;
  reg [31:0] ch6_haz_reg;
  reg [31:0] ch5_haz_reg;
  reg [31:0] ch4_haz_reg;
  reg [31:0] ch3_haz_reg;
  reg [31:0] ch2_haz_reg;
  reg [31:0] ch1_haz_reg;
  reg [31:0] ch0_haz_reg;
  
  reg start_hazard_handling;
  integer haz_cnt;
  
  always@(posedge adder_srdyo) begin//TODO: solve conflict with normalization
    case(haz_cnt) begin
      0: ch0_haz_reg <= adder_output;
      1: ch1_haz_reg <= adder_output;
      2: ch2_haz_reg <= adder_output;
      3: ch3_haz_reg <= adder_output;
      4: ch4_haz_reg <= adder_output;
      5: ch5_haz_reg <= adder_output;
      6: ch6_haz_reg <= adder_output;
      7: ch7_haz_reg <= adder_output;
      8: ch8_haz_reg <= adder_output;
      9: ch9_haz_reg <= adder_output;
      10: ch10_haz_reg <= adder_output;
      11: ch11_haz_reg <= adder_output;
      12: ch12_haz_reg <= adder_output;
      13: ch13_haz_reg <= adder_output;
      14: ch14_haz_reg <= adder_output;
      15: ch15_haz_reg <= adder_output;
    endcase
  end
  
  always@(posedge clk) if(start_hazard_handling) haz_cnt <= haz_cnt + 1;  
  
  /* Normalization multiplier output, main loop input */
  integer order = 5;
  integer ch = 0;
  
  /* Multiplication */
 always@(posedge norm_mul_complete) begin
    if(order == 5) begin
      case(ch)
        0: begin 
            next_mul_input_1 <= ch0_coeff_5;
            next_mul_input_2 = ch0_norm;
           end
        1: begin 
            next_mul_input_1 <= ch1_coeff_5;
            next_mul_input_2 = ch1_norm;
           end
        2: begin 
            next_mul_input_1 <= ch2_coeff_5;
            next_mul_input_2 = ch2_norm;
           end
        3: begin 
            next_mul_input_1 <= ch3_coeff_5;
            next_mul_input_2 = ch3_norm;
           end
        4: begin 
            next_mul_input_1 <= ch4_coeff_5;
            next_mul_input_2 = ch4_norm;
           end
        5: begin 
            next_mul_input_1 <= ch5_coeff_5;
            next_mul_input_2 = ch5_norm;
           end
        6: begin 
            next_mul_input_1 <= ch6_coeff_5;
            next_mul_input_2 = ch6_norm;
           end
        7: begin 
            next_mul_input_1 <= ch7_coeff_5;
            next_mul_input_2 = ch7_norm;
           end
        8: begin 
            next_mul_input_1 <= ch8_coeff_5;
            next_mul_input_2 = ch8_norm;
           end
        9: begin 
            next_mul_input_1 <= ch9_coeff_5;
            next_mul_input_2 = ch9_norm;
           end
        10: begin 
             next_mul_input_1 <= ch10_coeff_5;
             next_mul_input_2 = ch10_norm;
            end
        11: begin 
             next_mul_input_1 <= ch11_coeff_5;
             next_mul_input_2 = ch11_norm;
            end
        12: begin 
             next_mul_input_1 <= ch12_coeff_5;
             next_mul_input_2 = ch12_norm;
            end
        13: begin 
             next_mul_input_1 <= ch13_coeff_5;
             next_mul_input_2 = ch13_norm;
            end
        14: begin 
             next_mul_input_1 <= ch14_coeff_5;
             next_mul_input_2 = ch14_norm;
            end
        15: begin 
             next_mul_input_1 <= ch15_coeff_5;
             next_mul_input_2 = ch15_norm;
            end
      endcase
    end
    else begin
      case(ch)
        0: begin
            next_mul_input_1 <= ch0_haz_reg;
            next_mul_input_2 = ch0_norm;
           end
        1: begin
            next_mul_input_1 <= ch1_haz_reg;
            next_mul_input_2 = ch1_norm;
           end
        2: begin
            next_mul_input_1 <= ch2_haz_reg;
            next_mul_input_2 = ch2_norm;
           end
        3: begin
            next_mul_input_1 <= ch3_haz_reg;
            next_mul_input_2 = ch3_norm;
           end
        4: begin
            next_mul_input_1 <= ch4_haz_reg;
            next_mul_input_2 = ch4_norm;
           end
        5: begin
            next_mul_input_1 <= ch5_haz_reg;
            next_mul_input_2 = ch5_norm;
           end
        6: begin
            next_mul_input_1 <= ch6_haz_reg;
            next_mul_input_2 = ch6_norm;
           end
        7: begin
            next_mul_input_1 <= ch7_haz_reg;
            next_mul_input_2 = ch7_norm;
           end
        8: begin
            next_mul_input_1 <= ch8_haz_reg;
            next_mul_input_2 = ch8_norm;
           end
        9: begin
            next_mul_input_1 <= ch9_haz_reg;
            next_mul_input_2 = ch9_norm;
           end
        10: begin
             next_mul_input_1 <= ch10_haz_reg;
             next_mul_input_2 = ch10_norm;
            end
        11: begin
             next_mul_input_1 <= ch11_haz_reg;
             next_mul_input_2 = ch11_norm;
            end
        12: begin
             next_mul_input_1 <= ch12_haz_reg;
             next_mul_input_2 = ch12_norm;
            end
        13: begin
             next_mul_input_1 <= ch13_haz_reg;
             next_mul_input_2 = ch13_norm;
            end
        14: begin
             next_mul_input_1 <= ch14_haz_reg;
             next_mul_input_2 = ch14_norm;
            end
        15: begin
             next_mul_input_1 <= ch15_haz_reg;
             next_mul_input_2 = ch15_norm;
            end
      endcase
    end
  end
  
  
  
  always@(*) begin // TODO: find some way to trigger this
    next_adder_input_2 <= multiplier_output
    case(order)
        5: begin
             case(ch)
               0: next_adder_input_1 <= ch0_coeff_4; 
               1: next_adder_input_1 <= ch1_coeff_4;
               2: next_adder_input_1 <= ch2_coeff_4; 
               3: next_adder_input_1 <= ch3_coeff_4;
               4: next_adder_input_1 <= ch4_coeff_4; 
               5: next_adder_input_1 <= ch5_coeff_4;
               6: next_adder_input_1 <= ch6_coeff_4; 
               7: next_adder_input_1 <= ch7_coeff_4;
               8: next_adder_input_1 <= ch8_coeff_4; 
               9: next_adder_input_1 <= ch9_coeff_4;
               10: next_adder_input_1 <= ch10_coeff_4; 
               11: next_adder_input_1 <= ch11_coeff_4;
               12: next_adder_input_1 <= ch12_coeff_4; 
               13: next_adder_input_1 <= ch13_coeff_4;
               14: next_adder_input_1 <= ch14_coeff_4; 
               15: next_adder_input_1 <= ch15_coeff_4;
             endcase
           end
        4: begin
             case(ch)
               0: next_adder_input_1 <= ch0_coeff_3; 
               1: next_adder_input_1 <= ch1_coeff_3;
               2: next_adder_input_1 <= ch2_coeff_3; 
               3: next_adder_input_1 <= ch3_coeff_3;
               4: next_adder_input_1 <= ch4_coeff_3; 
               5: next_adder_input_1 <= ch5_coeff_3;
               6: next_adder_input_1 <= ch6_coeff_3; 
               7: next_adder_input_1 <= ch7_coeff_3;
               8: next_adder_input_1 <= ch8_coeff_3; 
               9: next_adder_input_1 <= ch9_coeff_3;
               10: next_adder_input_1 <= ch10_coeff_3; 
               11: next_adder_input_1 <= ch11_coeff_3;
               12: next_adder_input_1 <= ch12_coeff_3; 
               13: next_adder_input_1 <= ch13_coeff_3;
               14: next_adder_input_1 <= ch14_coeff_3; 
               15: next_adder_input_1 <= ch15_coeff_3;
             endcase
           end
        3: begin
             case(ch)
               0: next_adder_input_1 <= ch0_coeff_2; 
               1: next_adder_input_1 <= ch1_coeff_2;
               2: next_adder_input_1 <= ch2_coeff_2; 
               3: next_adder_input_1 <= ch3_coeff_2;
               4: next_adder_input_1 <= ch4_coeff_2; 
               5: next_adder_input_1 <= ch5_coeff_2;
               6: next_adder_input_1 <= ch6_coeff_2; 
               7: next_adder_input_1 <= ch7_coeff_2;
               8: next_adder_input_1 <= ch8_coeff_2; 
               9: next_adder_input_1 <= ch9_coeff_2;
               10: next_adder_input_1 <= ch10_coeff_2; 
               11: next_adder_input_1 <= ch11_coeff_2;
               12: next_adder_input_1 <= ch12_coeff_2; 
               13: next_adder_input_1 <= ch13_coeff_2;
               14: next_adder_input_1 <= ch14_coeff_2; 
               15: next_adder_input_1 <= ch15_coeff_2;
             endcase
           end
        2: begin
             case(ch)
               0: next_adder_input_1 <= ch0_coeff_1; 
               1: next_adder_input_1 <= ch1_coeff_1;
               2: next_adder_input_1 <= ch2_coeff_1; 
               3: next_adder_input_1 <= ch3_coeff_1;
               4: next_adder_input_1 <= ch4_coeff_1; 
               5: next_adder_input_1 <= ch5_coeff_1;
               6: next_adder_input_1 <= ch6_coeff_1;
               7: next_adder_input_1 <= ch7_coeff_1;
               8: next_adder_input_1 <= ch8_coeff_1; 
               9: next_adder_input_1 <= ch9_coeff_1;
               10: next_adder_input_1 <= ch10_coeff_1; 
               11: next_adder_input_1 <= ch11_coeff_1;
               12: next_adder_input_1 <= ch12_coeff_1; 
               13: next_adder_input_1 <= ch13_coeff_1;
               14: next_adder_input_1 <= ch14_coeff_1; 
               15: next_adder_input_1 <= ch15_coeff_1;
             endcase 
           end
           1: begin
             case(ch)
               0: next_adder_input_1 <= ch0_coeff_0; 
               1: next_adder_input_1 <= ch1_coeff_0;
               2: next_adder_input_1 <= ch2_coeff_0; 
               3: next_adder_input_1 <= ch3_coeff_0;
               4: next_adder_input_1 <= ch4_coeff_0; 
               5: next_adder_input_1 <= ch5_coeff_0;
               6: next_adder_input_1 <= ch6_coeff_0; 
               7: next_adder_input_1 <= ch7_coeff_0;
               8: next_adder_input_1 <= ch8_coeff_0; 
               9: next_adder_input_1 <= ch9_coeff_0;
               10: next_adder_input_1 <= ch10_coeff_0; 
               11: next_adder_input_1 <= ch11_coeff_0;
               12: next_adder_input_1 <= ch12_coeff_0; 
               13: next_adder_input_1 <= ch13_coeff_0;
               14: next_adder_input_1 <= ch14_coeff_0; 
               15: next_adder_input_1 <= ch15_coeff_0;
             endcase
           end
    endcase
  end
  
  always@(posedge clk) if(norm_mul_complete) begin
   ch = ch + 1;
   if(ch > 15) begin
     order = order - 1;
     ch = 0;
   end
   if(order < 1) begin // STOP multiplier
     multiplier_srdyi = 0;
   end
 end
  
  /* Convert back to FP - output */
  
  reg conv_2_start;
  integer conv_2_cnt;
  
  always@(*) begin
    case(conv_2_cnt)
      0: ch0_x_lin <= conv_2_output;
      1: ch1_x_lin <= conv_2_output;
      2: ch2_x_lin <= conv_2_output;
      3: ch3_x_lin <= conv_2_output;
      4: ch4_x_lin <= conv_2_output;
      5: ch5_x_lin <= conv_2_output;
      6: ch6_x_lin <= conv_2_output;
      7: ch7_x_lin <= conv_2_output;
      8: ch8_x_lin <= conv_2_output;
      9: ch9_x_lin <= conv_2_output;
      10: ch10_x_lin <= conv_2_output;
      11: ch11_x_lin <= conv_2_output;
      12: ch12_x_lin <= conv_2_output;
      13: ch13_x_lin <= conv_2_output;
      14: ch14_x_lin <= conv_2_output;
      15: ch15_x_lin <= conv_2_output;
  end

endmodule 
	