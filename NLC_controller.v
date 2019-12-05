module NLC_controller(
  input wire clk,
  input wire rst,
  
  input wire srdyi,
  output reg srdyo,
  
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
	output reg [20:0] ch15_x_lin,
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
	output reg [20:0] ch14_x_lin,
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
	output reg [20:0] ch13_x_lin,
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
	output reg [20:0] ch12_x_lin,
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
	output reg [20:0] ch11_x_lin,
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
	output reg [20:0] ch10_x_lin,
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
	output reg [20:0] ch9_x_lin,
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
	output reg [20:0] ch8_x_lin,
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
	output reg [20:0] ch7_x_lin,
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
	output reg [20:0] ch6_x_lin,
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
	output reg [20:0] ch5_x_lin, 
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
	output reg [20:0] ch4_x_lin, 
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
	output reg [20:0] ch3_x_lin, 
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
	output reg [20:0] ch2_x_lin, 
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
	output reg [20:0] ch1_x_lin, 
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
	output reg [20:0] ch0_x_lin, 
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
  end
  
	
  always@(posedge srdyi) begin
    start_conv <= 1;
  end
  
  always@(*) begin
    case(conv_cnt)
      0: conv_1_input <= ch0_x_adc;
      1: conv_1_input <= ch1_x_adc;
      2: conv_1_input <= ch2_x_adc;
      3: conv_1_input <= ch3_x_adc;
      4: conv_1_input <= ch4_x_adc;
      5: conv_1_input <= ch5_x_adc;
      6: conv_1_input <= ch6_x_adc;
      7: conv_1_input <= ch7_x_adc;
      8: conv_1_input <= ch8_x_adc;
      9: conv_1_input <= ch9_x_adc;
     10: conv_1_input <= ch10_x_adc;
     11: conv_1_input <= ch11_x_adc;
     12: conv_1_input <= ch12_x_adc;
     13: conv_1_input <= ch13_x_adc;
     14: conv_1_input <= ch14_x_adc;
     15: conv_1_input <= ch15_x_adc;
     default: begin
           start_conv <= 0;
           conv_cnt = 0;
         end
    endcase
  end
  
  always@(posedge clk) if(start_conv) conv_cnt <= conv_cnt + 1;
  

  always@(posedge conv_1_srdyo) begin
    start_normalize_add <= 1;
    adder_srdyi <= 1;
  end
  
  always@(*) begin
    if(start_normalize_add) begin
      adder_input_1 <= conv_1_output;
      case(norm_add_cnt)
        0: adder_input_2 <= ch0_neg_mean;
        1: adder_input_2 <= ch1_neg_mean;
        2: adder_input_2 <= ch2_neg_mean;
        3: adder_input_2 <= ch3_neg_mean;
        4: adder_input_2 <= ch4_neg_mean;
        5: adder_input_2 <= ch5_neg_mean;
        6: adder_input_2 <= ch6_neg_mean;
        7: adder_input_2 <= ch7_neg_mean;
        8: adder_input_2 <= ch8_neg_mean;
        9: adder_input_2 <= ch9_neg_mean;
        10: adder_input_2 <= ch10_neg_mean;
        11: adder_input_2 <= ch11_neg_mean;
        12: adder_input_2 <= ch12_neg_mean;
        13: adder_input_2 <= ch13_neg_mean;
        14: adder_input_2 <= ch14_neg_mean;
        15: adder_input_2 <= ch15_neg_mean;
        default: begin
            start_normalize_add <= 0;
            adder_srdyi <= 0;
        end 
    endcase//TODO: turn off adder until needed in main loop
    end
  end
  
  always@(posedge clk) if(start_normalize_add) norm_add_cnt <= norm_add_cnt + 1;
  
  /* Normalization adder output, normalization multiplier input */
  /*integer norm_mul_cnt = 0;
  reg start_normalize_mul = 0;*/
  reg norm_complete = 0;
  
  always@(posedge adder_srdyo) begin
    start_normalize_mul <= 1;
    multiplier_srdyi <= 1;
  end
  
  always@(*) begin
    multiplier_input_1 = adder_output;
    case(norm_mul_cnt)
      0: multiplier_input_2 <= ch0_recip_stdev;
      1: multiplier_input_2 <= ch1_recip_stdev;
      2: multiplier_input_2 <= ch2_recip_stdev;
      3: multiplier_input_2 <= ch3_recip_stdev;
      4: multiplier_input_2 <= ch4_recip_stdev;
      5: multiplier_input_2 <= ch5_recip_stdev;
      6: multiplier_input_2 <= ch6_recip_stdev;
      7: multiplier_input_2 <= ch7_recip_stdev;
      8: multiplier_input_2 <= ch8_recip_stdev;
      9: multiplier_input_2 <= ch9_recip_stdev;
      10: multiplier_input_2 <= ch10_recip_stdev;
      11: multiplier_input_2 <= ch11_recip_stdev;
      12: multiplier_input_2 <= ch12_recip_stdev;
      13: multiplier_input_2 <= ch13_recip_stdev;
      14: multiplier_input_2 <= ch14_recip_stdev;
      15: multiplier_input_2 <= ch15_recip_stdev;
      default: start_normalize_mul <= 0;
    endcase
  end
  
  
  
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
  
  
  always@(posedge multiplier_srdyo) begin
    start_store_norm <= 1;
  end
    
  
  reg start_main_loop;
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
      16: start_main_loop <= 1;
      default: start_store_norm <= 0;
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
  
  always@(posedge adder_srdyo) begin
  if(start_main_loop) begin
    case(haz_cnt)
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
  end
  
  always@(posedge clk) if(start_hazard_handling) haz_cnt <= haz_cnt + 1;  
  
  /* Normalization multiplier output, main loop input */
  integer order = 5; //TODO: to be initialized
  integer ch = 0;
  
  /* Multiplication */
 always@(posedge start_main_loop) begin
    if(order == 5) begin
      case(ch)
        0: begin 
            multiplier_input_1 <= ch0_coeff_5;
            multiplier_input_2 = ch0_norm;
           end
        1: begin 
            multiplier_input_1 <= ch1_coeff_5;
            multiplier_input_2 = ch1_norm;
           end
        2: begin 
            multiplier_input_1 <= ch2_coeff_5;
            multiplier_input_2 = ch2_norm;
           end
        3: begin 
            multiplier_input_1 <= ch3_coeff_5;
            multiplier_input_2 = ch3_norm;
           end
        4: begin 
            multiplier_input_1 <= ch4_coeff_5;
            multiplier_input_2 = ch4_norm;
           end
        5: begin 
            multiplier_input_1 <= ch5_coeff_5;
            multiplier_input_2 = ch5_norm;
           end
        6: begin 
            multiplier_input_1 <= ch6_coeff_5;
            multiplier_input_2 = ch6_norm;
           end
        7: begin 
            multiplier_input_1 <= ch7_coeff_5;
            multiplier_input_2 = ch7_norm;
           end
        8: begin 
            multiplier_input_1 <= ch8_coeff_5;
            multiplier_input_2 = ch8_norm;
           end
        9: begin 
            multiplier_input_1 <= ch9_coeff_5;
            multiplier_input_2 = ch9_norm;
           end
        10: begin 
             multiplier_input_1 <= ch10_coeff_5;
             multiplier_input_2 = ch10_norm;
            end
        11: begin 
             multiplier_input_1 <= ch11_coeff_5;
             multiplier_input_2 = ch11_norm;
            end
        12: begin 
             multiplier_input_1 <= ch12_coeff_5;
             multiplier_input_2 = ch12_norm;
            end
        13: begin 
             multiplier_input_1 <= ch13_coeff_5;
             multiplier_input_2 = ch13_norm;
            end
        14: begin 
             multiplier_input_1 <= ch14_coeff_5;
             multiplier_input_2 = ch14_norm;
            end
        15: begin 
             multiplier_input_1 <= ch15_coeff_5;
             multiplier_input_2 = ch15_norm;
            end
      endcase
    end
    else begin
      case(ch)
        0: begin
            multiplier_input_1 <= ch0_haz_reg;
            multiplier_input_2 = ch0_norm;
           end
        1: begin
            multiplier_input_1 <= ch1_haz_reg;
            multiplier_input_2 = ch1_norm;
           end
        2: begin
            multiplier_input_1 <= ch2_haz_reg;
            multiplier_input_2 = ch2_norm;
           end
        3: begin
            multiplier_input_1 <= ch3_haz_reg;
            multiplier_input_2 = ch3_norm;
           end
        4: begin
            multiplier_input_1 <= ch4_haz_reg;
            multiplier_input_2 = ch4_norm;
           end
        5: begin
            multiplier_input_1 <= ch5_haz_reg;
            multiplier_input_2 = ch5_norm;
           end
        6: begin
            multiplier_input_1 <= ch6_haz_reg;
            multiplier_input_2 = ch6_norm;
           end
        7: begin
            multiplier_input_1 <= ch7_haz_reg;
            multiplier_input_2 = ch7_norm;
           end
        8: begin
            multiplier_input_1 <= ch8_haz_reg;
            multiplier_input_2 = ch8_norm;
           end
        9: begin
            multiplier_input_1 <= ch9_haz_reg;
            multiplier_input_2 = ch9_norm;
           end
        10: begin
             multiplier_input_1 <= ch10_haz_reg;
             multiplier_input_2 = ch10_norm;
            end
        11: begin
             multiplier_input_1 <= ch11_haz_reg;
             multiplier_input_2 = ch11_norm;
            end
        12: begin
             multiplier_input_1 <= ch12_haz_reg;
             multiplier_input_2 = ch12_norm;
            end
        13: begin
             multiplier_input_1 <= ch13_haz_reg;
             multiplier_input_2 = ch13_norm;
            end
        14: begin
             multiplier_input_1 <= ch14_haz_reg;
             multiplier_input_2 = ch14_norm;
            end
        15: begin
             multiplier_input_1 <= ch15_haz_reg;
             multiplier_input_2 = ch15_norm;
            end
      endcase
    end
  end
  
  reg start_output_conv = 0;
  
  always@(*) begin // TODO: find some way to trigger this
    adder_input_2 <= multiplier_output;
    case(order)
        5: begin
             case(ch)
               0: adder_input_1 <= ch0_coeff_4; 
               1: adder_input_1 <= ch1_coeff_4;
               2: adder_input_1 <= ch2_coeff_4; 
               3: adder_input_1 <= ch3_coeff_4;
               4: adder_input_1 <= ch4_coeff_4; 
               5: adder_input_1 <= ch5_coeff_4;
               6: adder_input_1 <= ch6_coeff_4; 
               7: adder_input_1 <= ch7_coeff_4;
               8: adder_input_1 <= ch8_coeff_4; 
               9: adder_input_1 <= ch9_coeff_4;
               10: adder_input_1 <= ch10_coeff_4; 
               11: adder_input_1 <= ch11_coeff_4;
               12: adder_input_1 <= ch12_coeff_4; 
               13: adder_input_1 <= ch13_coeff_4;
               14: adder_input_1 <= ch14_coeff_4; 
               15: adder_input_1 <= ch15_coeff_4;
             endcase
           end
        4: begin
             case(ch)
               0: adder_input_1 <= ch0_coeff_3; 
               1: adder_input_1 <= ch1_coeff_3;
               2: adder_input_1 <= ch2_coeff_3; 
               3: adder_input_1 <= ch3_coeff_3;
               4: adder_input_1 <= ch4_coeff_3; 
               5: adder_input_1 <= ch5_coeff_3;
               6: adder_input_1 <= ch6_coeff_3; 
               7: adder_input_1 <= ch7_coeff_3;
               8: adder_input_1 <= ch8_coeff_3; 
               9: adder_input_1 <= ch9_coeff_3;
               10: adder_input_1 <= ch10_coeff_3; 
               11: adder_input_1 <= ch11_coeff_3;
               12: adder_input_1 <= ch12_coeff_3; 
               13: adder_input_1 <= ch13_coeff_3;
               14: adder_input_1 <= ch14_coeff_3; 
               15: adder_input_1 <= ch15_coeff_3;
             endcase
           end
        3: begin
             case(ch)
               0: adder_input_1 <= ch0_coeff_2; 
               1: adder_input_1 <= ch1_coeff_2;
               2: adder_input_1 <= ch2_coeff_2; 
               3: adder_input_1 <= ch3_coeff_2;
               4: adder_input_1 <= ch4_coeff_2; 
               5: adder_input_1 <= ch5_coeff_2;
               6: adder_input_1 <= ch6_coeff_2; 
               7: adder_input_1 <= ch7_coeff_2;
               8: adder_input_1 <= ch8_coeff_2; 
               9: adder_input_1 <= ch9_coeff_2;
               10: adder_input_1 <= ch10_coeff_2; 
               11: adder_input_1 <= ch11_coeff_2;
               12: adder_input_1 <= ch12_coeff_2; 
               13: adder_input_1 <= ch13_coeff_2;
               14: adder_input_1 <= ch14_coeff_2; 
               15: adder_input_1 <= ch15_coeff_2;
             endcase
           end
        2: begin
             case(ch)
               0: adder_input_1 <= ch0_coeff_1; 
               1: adder_input_1 <= ch1_coeff_1;
               2: adder_input_1 <= ch2_coeff_1; 
               3: adder_input_1 <= ch3_coeff_1;
               4: adder_input_1 <= ch4_coeff_1; 
               5: adder_input_1 <= ch5_coeff_1;
               6: adder_input_1 <= ch6_coeff_1;
               7: adder_input_1 <= ch7_coeff_1;
               8: adder_input_1 <= ch8_coeff_1; 
               9: adder_input_1 <= ch9_coeff_1;
               10: adder_input_1 <= ch10_coeff_1; 
               11: adder_input_1 <= ch11_coeff_1;
               12: adder_input_1 <= ch12_coeff_1; 
               13: adder_input_1 <= ch13_coeff_1;
               14: adder_input_1 <= ch14_coeff_1; 
               15: adder_input_1 <= ch15_coeff_1;
             endcase 
           end
           1: begin
             case(ch)
               0: adder_input_1 <= ch0_coeff_0; 
               1: adder_input_1 <= ch1_coeff_0;
               2: adder_input_1 <= ch2_coeff_0; 
               3: adder_input_1 <= ch3_coeff_0;
               4: adder_input_1 <= ch4_coeff_0; 
               5: adder_input_1 <= ch5_coeff_0;
               6: adder_input_1 <= ch6_coeff_0; 
               7: adder_input_1 <= ch7_coeff_0;
               8: adder_input_1 <= ch8_coeff_0; 
               9: begin
                  adder_input_1 <= ch9_coeff_0;
                  start_output_conv <= 1;
                  conv_2_srdyi <= 1;
                end
               10: adder_input_1 <= ch10_coeff_0; 
               11: adder_input_1 <= ch11_coeff_0;
               12: adder_input_1 <= ch12_coeff_0; 
               13: adder_input_1 <= ch13_coeff_0;
               14: adder_input_1 <= ch14_coeff_0; 
               15: adder_input_1 <= ch15_coeff_0;
             endcase
           end
    endcase
  end
  
  always@(posedge clk) begin
    if(start_main_loop) begin
      ch = ch + 1;
      if(ch > 15) begin
        order = order - 1;
        ch = 0;
      end
      if(order < 1) begin // STOP multiplier
        multiplier_srdyi = 0;
      end
    end
 end
  
  /* Convert back to FP - output */
  
  integer output_conv_cnt;
  
  always@(*) begin
    case(output_conv_cnt)
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
      16: begin
        srdyo <= 1;
        start_output_conv <= 0;
      end
    endcase
  end
  
  always@(posedge clk) if(start_output_conv) output_conv_cnt = output_conv_cnt + 1;

endmodule 
	