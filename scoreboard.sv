class scoreboard;

    // Mailbox to receive transactions from the monitor
    mailbox mon2scb;

    // Constructor to initialize the scoreboard
    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    // Main task to validate transactions
    task main;
        dual_port_ram_transaction trans;
        
        forever begin
            // Get a transaction from the monitor
            mon2scb.get(trans);

            // Validate the transaction
            if (trans.we_a && trans.data_out_a !== trans.data_in_a) begin
                $error("Port A Write Error: Expected %0d, Got %0d", trans.data_in_a, trans.data_out_a);
            end else if (!trans.we_a && trans.data_out_a !== trans.data_out_a) begin
                $display("Port A Read Match: Address %0d, Data %0d", trans.addr_a, trans.data_out_a);
            end

            if (trans.we_b && trans.data_out_b !== trans.data_in_b) begin
                $error("Port B Write Error: Expected %0d, Got %0d", trans.data_in_b, trans.data_out_b);
            end else if (!trans.we_b && trans.data_out_b !== trans.data_out_b) begin
                $display("Port B Read Match: Address %0d, Data %0d", trans.addr_b, trans.data_out_b);
            end

            // Display the transaction
            trans.display("Scoreboard");
        end
    endtask

endclass
