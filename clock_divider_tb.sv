module clock_divider_tb();

  logic tb_clk;
  logic tb_by_2, tb_by_3;
  logic tb_nrst;
// CLOCKING
  always begin
  	tb_clk =   1'b0;
    #5;
    tb_clk = 1'b1;
    #5;
  end
  
  // Module instantiation
  clock_divider DUT ( .clk(tb_clk), .nrst(tb_nrst), .out2(tb_by_2), .out3(tb_by_3));
  
  initial begin
    
	$dumpfile("dump.vcd"); 
    $dumpvars;
    tb_nrst = 1;
    tb_nrst = 0;
    #5;
    tb_nrst = 1;
  	#40;
    $finish;
  end
endmodule
