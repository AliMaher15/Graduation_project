class hmc_final_test extends  base_test;
  `uvm_component_utils(hmc_final_test)
  
 function new(string name, uvm_component parent);
    super.new(name,parent);
 endfunction : new

  task run_phase(uvm_phase phase);

    //vseq_class_name vseq_handle = seq_class_name::type_id::create("vseq_handle");
    rf_reset_vseq     m_rf_reset_vseq = rf_reset_vseq::type_id::create("m_rf_reset_vseq"); 
    hmc_req_resp_vseq m_hmc_req_resp_vseq = hmc_req_resp_vseq::type_id::create("hmc_req_resp_vseq"); 
    rf_check_vseq m_rf_check_vseq = rf_check_vseq::type_id::create("m_rf_check_vseq");
    set_seqs(m_rf_reset_vseq);
    set_seqs(m_hmc_req_resp_vseq);
    set_seqs(m_rf_check_vseq);
     
    phase.raise_objection(this);
    
       `uvm_info("HMC_FINAL_TEST","Starting test", UVM_MEDIUM)

         //vseq_handle.start(m_env.m_vseqr);  
         m_rf_reset_vseq.start(m_env.m_vseqr);

       //fork
       //       begin // thread 1
       //         repeat(200) begin
       //           m_rf_check_vseq.start(m_env.m_vseqr);
       //         end
       //       end

              begin // thread 2
                `uvm_info("HMC_FINAL_TEST","Executing hmc_req_resp_vseq", UVM_MEDIUM)      
                m_hmc_req_resp_vseq.start(m_env.m_vseqr) ;        
                `uvm_info("HMC_FINAL_TEST", "hmc_req_resp_vseq complete", UVM_MEDIUM)
              end
              
      //join

       `uvm_info("HMC_FINAL_TEST","Ending test", UVM_MEDIUM)
    
    phase.drop_objection(this);
    
  endtask : run_phase
  

endclass : hmc_final_test