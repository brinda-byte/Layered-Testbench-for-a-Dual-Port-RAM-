class dual_port_ram_transaction;

    // Randomized stimulus
    rand logic [3:0] addr_a;    
    rand logic [3:0] addr_b;    
    rand logic [7:0] data_in_a; 
    rand logic [7:0] data_in_b;
    rand logic we_a;           
    rand logic we_b;           

    // Outputs
    logic [7:0] data_out_a;   
    logic [7:0] data_out_b;    

    // Function for displaying transaction details
    function void display(string name);
        $display("-------------------------");
        $display("Transaction: %s", name);
        $display("-------------------------");
        $display("addr_a = %0d, addr_b = %0d", addr_a, addr_b);
        $display("data_in_a = %h, data_in_b = %h", data_in_a, data_in_b);
        $display("we_a = %0d, we_b = %0d", we_a, we_b);
        $display("data_out_a = %h, data_out_b = %h", data_out_a, data_out_b);
        $display("-------------------------");
    endfunction

endclass
