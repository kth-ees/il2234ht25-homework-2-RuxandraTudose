module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);

logic [5:0] shift_value;

always_ff @ (posedge clk or negedge rst_n) begin 
    if(!rst_n)
        parallel_out <= '0;
    else begin 
        case(sel)    
            1'b0: parallel_out <=  parallel_in; 
            1'b1: parallel_out <=  shift_value;             
            default: parallel_out <= parallel_out;
        endcase    
    end
end   

always_comb begin
  shift_value = {parallel_out[4:0], parallel_out[5]};
  shift_value[1] = shift_value[1] ^ parallel_out[5];
  shift_value[3] = shift_value[3] ^ parallel_out[5];
end

endmodule
