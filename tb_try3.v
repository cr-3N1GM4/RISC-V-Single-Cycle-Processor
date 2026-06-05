

module tb_riscsinglecycle();

    
    reg clk;
    reg reset;

    
    riscsinglecycle uut (
        .clk(clk), 
        .reset(reset)
    );

    
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        reset = 1;

        
        #15;
        reset = 0;
        
        $display("----------------------------------------------");
        $display("   RISC-V Single Cycle Simulation Started     ");
        $display("----------------------------------------------");
        $display("Time | PC       | Instruction | Result");
        
        
        #200;
        
        $display("----------------------------------------------");
        $display("   Simulation Finished                        ");
        $display("----------------------------------------------");
        $finish;
    end



endmodule