interface dual_port_ram_if();

    // Clock signal
    logic clk;

    // Port A signals
    logic [3:0] addr_a;    
    logic [7:0] data_in_a; 
    logic we_a;            
    logic [7:0] data_out_a; 

    // Port B signals
    logic [3:0] addr_b;    
    logic [7:0] data_in_b; 
    logic we_b;            
    logic [7:0] data_out_b; 

endinterface
