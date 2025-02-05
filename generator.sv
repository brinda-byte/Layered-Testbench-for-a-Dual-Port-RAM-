class generator;

    // Handle for the transaction class
    dual_port_ram_transaction trans;

    // Mailbox declaration to communicate with the driver
    mailbox gen2driv;

    // Constructor: associates the mailbox
    function new(mailbox gen2driv);
        this.gen2driv = gen2driv;
    endfunction

    // Task to generate transactions
    task main();
      
      repeat(10)
        begin
            // Create a new transaction
            trans = new();

            // Randomize the transaction
            assert(trans.randomize())
                else $error("Transaction randomization failed!");

            // Display the transaction details
            trans.display("Generator");

            // Send the transaction to the driver through the mailbox
            gen2driv.put(trans);
        end
    endtask

endclass
