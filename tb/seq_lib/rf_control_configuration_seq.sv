class rf_control_configuration_seq extends  base_seq;

  `uvm_object_utils(rf_control_configuration_seq)

  extern function new (string name = "");
  extern task body();

endclass : rf_control_configuration_seq


function rf_control_configuration_seq::new(string name = "");
  super.new(name);
endfunction : new

task rf_control_configuration_seq::body();
  string print_reg;
  super.body();

  rf_rb.m_reg_control.read(status, data, .parent(this));

  rf_rb.m_reg_control.p_rst_n.set(1'h1);
  rf_rb.m_reg_control.hmc_init_cont_set.set(1'h1);
  rf_rb.m_reg_control.set_hmc_sleep.set(1'h0);
  rf_rb.m_reg_control.warm_reset.set(1'h0);
  rf_rb.m_reg_control.scrambler_disable.set(1'h1);
  rf_rb.m_reg_control.run_length_enable.set(1'h1);
  rf_rb.m_reg_control.rx_token_count.set({8{1'b1}});
  rf_rb.m_reg_control.irtry_received_threshold.set(5'h10);
  rf_rb.m_reg_control.irtry_to_send.set(5'h18);

  //rf_rb.m_reg_control.write(status, 64'h181000ff0013, .parent(this));
  rf_rb.m_reg_control.update(status);
  //rf_rb.m_reg_control.write(status, 64'h0028101000750033, .parent(this));
  rf_rb.m_reg_control.read(status, data, .parent(this));

      print_reg = $sformatf("\n*******************************\n\tCONTROL REGISTER\n*******************************
                         \t p_rst_n=%1b, 
                         \t hmc_init_cont_set=%1b, 
                         \t set_hmc_sleep=%1b, 
                         \t warm_reset=%1b, 
                         \t scrambler_disable=%1b, 
                         \t run_length_enable=%1b, 
                         \t rx_token_count=%0x, 
                         \t irtry_received_threshold=%0x, 
                         \t irtry_to_send=%0x\n**************************************************************\n", 
                         rf_rb.m_reg_control.p_rst_n.get(),
                         rf_rb.m_reg_control.hmc_init_cont_set.get(),
                         rf_rb.m_reg_control.set_hmc_sleep.get(),
                         rf_rb.m_reg_control.warm_reset.get(),
                         rf_rb.m_reg_control.scrambler_disable.get(),
                         rf_rb.m_reg_control.run_length_enable.get(),
                         rf_rb.m_reg_control.rx_token_count.get(),
                         rf_rb.m_reg_control.irtry_received_threshold.get(),
                         rf_rb.m_reg_control.irtry_to_send.get()
                        );

  `uvm_info("rf_control_read_seq", print_reg,UVM_LOW)


endtask : body