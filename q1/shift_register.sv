module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);

assign serial_out = parallel_out[3];                       

/*shift left*/
always_ff @ (posedge clk or negedge rst_n) begin 
    if(!rst_n)
        parallel_out <= '0;
    else begin 
        case(serial_parallel)    
            1'b0: parallel_out <= (load_enable) ? {parallel_out[2:0], serial_in} : parallel_out;
            1'b1: parallel_out <= (load_enable) ? parallel_in : parallel_out;
            default: parallel_out <= parallel_out;
        endcase    
    end
end   


/*
-- right shift 
always_ff @ (posedge clk or negedge rst_n) begin 
    if(!rst_n)
        parallel_out <= '0;
    else begin 
        case(serial_parallel)    
            1'b0: parallel_out <= (load_enable) ? {serial_in, parallel_out[3:1]} : parallel_out;
            1'b1: parallel_out <= (load_enable) ? parallel_in : parallel_out;
            default: parallel_out <= parallel_out;
        endcase    
    end
end   
*/

endmodule
