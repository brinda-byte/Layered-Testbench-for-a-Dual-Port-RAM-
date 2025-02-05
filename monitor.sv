class monitor;

    // Virtual interface to observe DUT signals
    virtual dual_port_ram_if vif;

    // Mailbox to communicate with the scoreboard
    mailbox mon2scb;

    // Constructor to initialize the monitor
    function new(virtual dual_port_ram_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    // Main task to monitor DUT activity and send transactions
 
            task main;
    dual_port_ram_transaction trans;  // Declare variables first
              repeat (1) #3;
              begin
    trans = new();
            // Capture DUT signals
            trans.addr_a = vif.addr_a;
            trans.addr_b = vif.addr_b;
            trans.data_in_a = vif.data_in_a;
            trans.data_in_b = vif.data_in_b;
            trans.we_a = vif.we_a;
            trans.we_b = vif.we_b;
            trans.data_out_a = vif.data_out_a;
            trans.data_out_b = vif.data_out_b;

            // Send the transaction to the scoreboard
            mon2scb.put(trans);

            // Display the captured transaction
            trans.display("Monitor");
        end
    endtask


           

endclass
