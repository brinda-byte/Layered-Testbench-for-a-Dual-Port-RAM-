`include "interface.sv"
`include "test.sv"



module testbench;

    // Interface instance for dual-port RAM
    dual_port_ram_if i_intf();

    // Test program instance
    test t1(i_intf);

    // DUT (Dual-Port RAM) instantiation
    dual_port_ram dut (
        .clk(i_intf.clk),
        .addr_a(i_intf.addr_a),
        .data_in_a(i_intf.data_in_a),
        .we_a(i_intf.we_a),
        .data_out_a(i_intf.data_out_a),
        .addr_b(i_intf.addr_b),
        .data_in_b(i_intf.data_in_b),
        .we_b(i_intf.we_b),
        .data_out_b(i_intf.data_out_b)
    );

    // Clock generation
    initial i_intf.clk = 0;
    always #5 i_intf.clk = ~i_intf.clk;

 initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end 
  
   

endmodule
