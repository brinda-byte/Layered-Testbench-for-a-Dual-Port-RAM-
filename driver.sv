class driver;

    // Virtual interface to connect to the DUT
    virtual dual_port_ram_if vif;

    // Mailbox for communication with the generator
    mailbox gen2driv;

    // Constructor: associates the virtual interface and mailbox
    function new(virtual dual_port_ram_if vif, mailbox gen2driv);
        this.vif = vif;
        this.gen2driv = gen2driv;
    endfunction

    // Main task to receive and drive transactions
    task main;
        dual_port_ram_transaction trans;

        // Repeat for the number of transactions
        forever begin
            // Get a transaction from the generator
            gen2driv.get(trans);

            // Drive inputs to the DUT through the interface
            vif.addr_a <= trans.addr_a;
            vif.addr_b <= trans.addr_b;
            vif.data_in_a <= trans.data_in_a;
            vif.data_in_b <= trans.data_in_b;
            vif.we_a <= trans.we_a;
            vif.we_b <= trans.we_b;

            // Wait for clock edge to synchronize
            @(posedge vif.clk);

            // Capture outputs from the DUT
            trans.data_out_a = vif.data_out_a;
            trans.data_out_b = vif.data_out_b;

            // Display the transaction
            trans.display("Driver");
        end
    endtask

endclass
