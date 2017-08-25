// A clock divider
// input clk - source clock, nrst - asynchronous reset (active low)
// output out2 - clk/2, out3 - clk/3

module clock_divider
  (input logic clk, nrst,
   output logic out2, out3);
  
  logic [2:0] clk_count, next_clk_count;
  logic next_out_3; 

  always_ff @ (posedge clk, negedge nrst) begin
    if(!nrst) begin
    	out2 <= 0;
    end else begin 
    	out2 <= !out2;
  	end
  end // end always_ff
  
  always_ff @ (posedge clk, negedge nrst) begin
    if(!nrst)  begin 
    	clk_count <= 0;
    	out3      <= 0;
    end else begin
    	out3      <= next_out_3;
    	clk_count <= next_clk_count;
    end
  end // end always_ff
  
always_comb begin
  // defaults
  next_out_3 = 0;
	next_clk_count = clk_count;
	
  // next count logic
	if (clk_count == 3'h3) begin 
    next_clk_count = 3'h1;
	end
  else begin
    next_clk_count = clk_count + 1;
  end

  // next out_3 logic
  if (next_clk_count == 1) begin
    next_out_3 = 1'b1;
  end

end // always_comb

endmodule 
