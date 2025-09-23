module LFSR_6bit_tb;

   logic clk, rst_n;
   logic sel;
   logic [5:0] parallel_out;
   logic [5:0] parallel_in;

    LFSR_6bit uut (.clk(clk),
                        .rst_n(rst_n), 
                        .sel(sel),
                        .parallel_in(parallel_in),
                        .parallel_out(parallel_out)

    ); 

    initial begin 
        clk = 0; 
        forever #5 clk = ~clk;
    end

    
    initial begin 
        for(int i = 0; i < 10; i++) begin
            for(int j = 0; j < 2; j++) begin 
                sel = j;
                //parallel_in = $urandom;
                parallel_in = 6'b111111;
                #10ns;

            end 
            #20ns;
        end
        $stop;                                                          
    end
endmodule