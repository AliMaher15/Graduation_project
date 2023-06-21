class rf_counters_seq extends  base_seq;

  `uvm_object_utils(rf_counters_seq)

  extern function new (string name = "");
  extern task body();

endclass : rf_counters_seq


function rf_counters_seq::new(string name = "");
  super.new(name);
endfunction : new

task rf_counters_seq::body();
  string print_reg;
  super.body();

  rf_rb.m_reg_sent_p.read(status, data, .parent(this));
  print_reg = $sformatf("\n*******************************\n\tPOSTED WRITE REQ COUNTER\n*******************************
                         \t sent_p=%h\n**************************************************************\n", 
                         rf_rb.m_reg_sent_p.sent_p.get());
  `uvm_info("rf_counters_seq", print_reg,UVM_LOW)

  rf_rb.m_reg_sent_r.read(status, data, .parent(this));
  print_reg = $sformatf("\n*******************************\n\tREAD REQ COUNTER\n*******************************
                         \t sent_r=%h\n**************************************************************\n", 
                         rf_rb.m_reg_sent_r.sent_r.get());
  `uvm_info("rf_counters_seq", print_reg,UVM_LOW)

  rf_rb.m_reg_sent_np.read(status, data, .parent(this));
  print_reg = $sformatf("\n*******************************\n\tNON POSTED REQ COUNTER\n*******************************
                         \t sent_np=%h\n**************************************************************\n", 
                         rf_rb.m_reg_sent_np.sent_np.get());
  `uvm_info("rf_counters_seq", print_reg,UVM_LOW)  

  rf_rb.m_reg_poisoned_packets.read(status, data, .parent(this));
  print_reg = $sformatf("\n*******************************\n\tPOISONED PKTS RECEIVED COUNTER\n*******************************
                         \t poisoned_packets=%h\n**************************************************************\n", 
                         rf_rb.m_reg_poisoned_packets.poisoned_packets.get());
  `uvm_info("rf_counters_seq", print_reg,UVM_LOW)

  rf_rb.m_reg_rcvd_rsp.read(status, data, .parent(this));
  print_reg = $sformatf("\n*******************************\n\tPOISONED PKTS RECEIVED COUNTER\n*******************************
                         \t rcvd_rsp=%h\n**************************************************************", 
                         rf_rb.m_reg_rcvd_rsp.rcvd_rsp.get());

  `uvm_info("rf_counters_seq", print_reg,UVM_LOW)

endtask : body