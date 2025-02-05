`include "dual_port_ram_transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

    // Components
    generator gen;
    driver driv;
    monitor mon;
    scoreboard scb;

    // Mailboxes for communication
    mailbox m1;
    mailbox m2;

    // Virtual interface
    virtual dual_port_ram_if vif;

    // Constructor
    function new(virtual dual_port_ram_if vif);
        this.vif = vif;

        // Initialize mailboxes
        m1 = new();
        m2 = new();

        // Create instances of verification components
        gen  = new(m1);         // Generator sends transactions to m1
        driv = new(vif, m1);    // Driver reads transactions from m1 and drives the DUT
        mon  = new(vif, m2);    // Monitor observes DUT and sends observed transactions to m2
        scb  = new(m2);         // Scoreboard compares expected vs observed results
    endfunction

    // Test task to run the environment
    task test();
        fork
            gen.main();  // Generator runs its main task
            driv.main(); // Driver runs its main task
            mon.main();  // Monitor runs its main task
            scb.main();  // Scoreboard runs its main task
        join
    endtask

    // Run task to initiate the test and finish simulation
    task run();
        test();
        $finish; // End simulation
    endtask

endclass
