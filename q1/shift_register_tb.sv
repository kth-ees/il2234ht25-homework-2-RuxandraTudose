module shift_register_tb;

    localparam N = 4;

    logic clk;
    logic rst_n;
    logic serial_parallel;
    logic load_enable;
    logic serial_in;
    logic [N-1:0] parallel_in;
    logic [N-1:0] parallel_out;
    logic serial_out;

    shift_register uut (.clk(clk),
                        .rst_n(rst_n), 
                        .serial_parallel(serial_parallel),
                        .load_enable(load_enable),
                        .serial_in(serial_in),
                        .parallel_in(parallel_in),
                        .parallel_out(parallel_out),
                        .serial_out(serial_out)

    ); 

    initial begin 
        clk = 0; 
        forever #5 clk = ~clk;
    end

    initial begin 
        for(int i = 0; i < 10; i++) begin
            for(int j = 0; j < 2; j++) begin 
                serial_parallel = j;
                parallel_in = $urandom;
                #10ns;
                serial_in = $urandom; 
                #10ns;
            end 
            #20ns;
        end
        $stop;                                                          
    end        
endmodule