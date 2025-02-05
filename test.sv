`include "environment.sv"

program test(dual_port_ram_if i_intf);

    // Environment instance
    environment env;

    // Initial block to create and run the environment
    initial begin
        // Instantiate the environment and pass interface
        env = new(i_intf);

        // Run the environment tasks
        env.run();
    end

endprogram
