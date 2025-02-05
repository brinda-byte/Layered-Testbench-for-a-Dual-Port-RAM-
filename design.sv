module dual_port_ram (
    input logic clk,             
    input logic [3:0] addr_a,    
    input logic [3:0] addr_b,    
    input logic [7:0] data_in_a, 
    input logic [7:0] data_in_b, 
    input logic we_a,            
    input logic we_b,           
    output logic [7:0] data_out_a,
    output logic [7:0] data_out_b  
);
 
      // Memory array (16 x 8)
    logic [7:0] ram [15:0];

    always_ff @(posedge clk) begin
        // Port A
        if (we_a)
            ram[addr_a] <= data_in_a; // Write operation
        else
            data_out_a <= ram[addr_a]; // Read operation

        // Port B
        if (we_b)
            ram[addr_b] <= data_in_b; // Write operation
        else
            data_out_b <= ram[addr_b]; // Read operation
    end
endmodule
