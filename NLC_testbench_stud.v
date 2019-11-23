`timescale 1ns/1ns
module clock_gen(clk, rst); 
  parameter cperiod = 20;
  parameter rperiod = 100;
  parameter cperiodDiv = cperiod;
  output reg clk;
  output reg rst;

  wire [63 : 0] clockDivCounter;
  assign clockDivCounter = cperiod * cperiodDiv / 2;
  initial begin
    clk = 0;
    rst = 1;
    # (cperiod/2);  
    clk= 1;
    # (cperiod/2);  
    clk= 0;
    # (cperiod/2);  
    clk= 1;
    #(rperiod-(3*cperiod/2));  
    rst = 0;
    forever begin
    # clockDivCounter; clk = ~clk;
    end
  end
endmodule
//------------------------------------------
module clocks(clk,rst);
  parameter cperiod = 20;
  parameter rperiod = 100;
  output clk;
  output rst;
wire clk_loc, rst_loc;
  assign rst = rst_loc;
  clock_gen #(.cperiod(cperiod), .rperiod(rperiod), .cperiodDiv(1))
  cgen (.clk(clk), .rst(rst_loc)); 
endmodule
//------------------------------------------------------
module NLC_6th_order_16ch_testbench;

reg isSimulationEnd;

wire [31:0] mismatch;
integer mismatch1=0;
integer loop_cnt=0;

wire clk_int;
wire GlobalReset_int;
wire GlobalResetDsgn;
reg [1:0] operation_mode_i_int;
reg [31:0] stdev_porty_int;
reg [31:0] mean_porty_int;
reg [31:0] coeff_5_porty_int;
reg [31:0] coeff_4_porty_int;
reg [31:0] coeff_3_porty_int;
reg [31:0] coeff_2_porty_int;
reg [31:0] coeff_1_porty_int;
reg [31:0] coeff_0_porty_int;
wire [20:0] x_lin_int;
reg [20:0] x_adc_int;
reg [20:0] x_ref_port_int;
wire [0:0] srdyo_int;
reg [0:0] srdyi_int;
reg [20:0]x_lin_ref_int;

NLC_wrapper NLC_wrapper_DUT (
    .clk_port(clk_int),
    .reset_port(GlobalResetDsgn),
    .operation_mode_i_port(operation_mode_i_int),
    .ch_recip_stdev_port(stdev_porty_int),
    .ch_neg_mean_port(mean_porty_int),
    .ch_x_lin_port_15(),
    .ch_x_lin_port_14(),
    .ch_x_lin_port_13(),
    .ch_x_lin_port_12(),
    .ch_x_lin_port_11(),
    .ch_x_lin_port_10(),
    .ch_x_lin_port_9(),
    .ch_x_lin_port_8(),
    .ch_x_lin_port_7(),
    .ch_x_lin_port_6(),
    .ch_x_lin_port_5(),
    .ch_x_lin_port_4(),
    .ch_x_lin_port_3(),
    .ch_x_lin_port_2(),
    .ch_x_lin_port_1(),
    .ch_x_lin_port_0(x_lin_int),
    .ch_coeff_5_port(coeff_5_porty_int),
    .ch_coeff_4_port(coeff_4_porty_int),
    .ch_coeff_3_port(coeff_3_porty_int),
    .ch_coeff_2_port(coeff_2_porty_int),
    .ch_coeff_1_port(coeff_1_porty_int),
    .ch_coeff_0_port(coeff_0_porty_int),
    .ch_x_adc_port(x_adc_int),
    .x_ref_i_port(x_ref_port_int),
    .srdyo_port(srdyo_int),
    .srdyi_port(srdyi_int)
  );

clocks #(.cperiod(166666), .rperiod(1666660)) CL(
  .clk(clk_int),
  .rst(GlobalReset_int)
  );

  assign GlobalResetDsgn = GlobalReset_int;

  assign mismatch = mismatch1;

  //------------------------------------------------------------
  //-- Process for Rate Domain of clk 
  //-- Inputs are applied on rising edge of clock, 
  //-- Outputs are tested on rising edge of clock as well.
  //------------------------------------------------------------

//-- Apply Input Vectors -----  

  always @(posedge clk_int)
  begin
      if(loop_cnt == 1)
      begin
        operation_mode_i_int <= 2'b00;
        stdev_porty_int   <= 32'd921889856;
        mean_porty_int    <= 32'd3342340864;
        coeff_5_porty_int <= 32'd1140169600;
        coeff_4_porty_int <= 32'd1130617856;
        coeff_3_porty_int <= 32'd1161335040;
        coeff_2_porty_int <= 32'd1144191360;
        coeff_1_porty_int <= 32'd1204777600;
        coeff_0_porty_int <= 32'd3295300608;
        x_adc_int <= 23333;
        x_ref_port_int <= 0;
        srdyi_int <= 1;
      end else begin
        operation_mode_i_int <= 0;
        stdev_porty_int <= 0;
        mean_porty_int <= 0;
        coeff_5_porty_int <= 0;
        coeff_4_porty_int <= 0;
        coeff_3_porty_int <= 0;
        coeff_2_porty_int <= 0;
        coeff_1_porty_int <= 0;
        coeff_0_porty_int <= 0;
        x_adc_int <= 0;
        x_ref_port_int <= 0;
        srdyi_int <= 0;
      end

  end



//-- Test Outputs-----
  always@(posedge clk_int)
    begin 
      if (GlobalReset_int==0)
      begin 
        if(loop_cnt >= 0) 
        begin
          if (srdyo_int)
          begin
            if(x_lin_int !== x_lin_ref_int) 
                begin
                  $display("Vector failed for x_lin");
                  $display("Expecting: %b",x_lin_ref_int);
                  $display("Actual:    %b",x_lin_int);
                  $finish;
                end

          end
          if(loop_cnt>=2048)
            begin
              $display("Extra Latency Detected at clk cycle no: %d",loop_cnt);
              $display("--------------------------------------");
              $finish;
            end

        end
    end

    loop_cnt <= loop_cnt + 1;
  end //always

endmodule
