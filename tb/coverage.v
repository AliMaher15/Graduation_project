

class coverage extends uvm_subscriber #(hmc_pkt_item);
   `uvm_component_utils(coverage)
   hmc_pkt_item packet;
	covergroup cmd_cov;

    hmc_cmd : coverpoint packet.command {
	  bins flow[]={ NULL,
	                 PRET,
	                   TRET,
	                   IRTRY};


bins Write_Requests[]={WR16,
                         WR32,
                           WR48,
                             WR64,
                               WR80,
                                 WR96,
                                  WR112,
                                    WR128};


bins Misc_Write Requests[]={MD_WR,
BWR ,
DUAL_2ADD8 ,
SINGLE_ADD16};

bins  Posted_Write_Requests[]={P_WR16,
P_WR32,
P_WR48,
P_WR64,
P_WR80,
P_WR96,
P_WR112,
P_WR128};

bins Posted_Misc_Write_Requests[]={P_BWR,
P_DUAL_2ADD8,
P_SINGLE_ADD16};

bins  Mode_Read_Request[]={MD_RD};

bins  Read_Requests[]={RD16,
RD32,
RD48,
RD64,
RD80,
RD96,
RD112,
RD128};

bins Response_Commands[]={RD_RS,WR_RS,MD_RD_RS, MD_WR_RS,ERROR_RS };
   
	   }

   endgroup
   
   
   covergroup pkt_cov;
   
     hmc_pkt_cube_ID: coverpoint packet.cube_ID {
	  bins cube_ID[]={[0:8] }; }
	  
	  hmc_pkt_address: coverpoint packet.address{
	  bins address[]={[0:$] };}
	  
	  hmc_pkt_tag: coverpoint packet.tag{
	  bins tag[]={[0:256] };}
	  
	  hmc_pkt_duplicate_length: coverpoint packet.duplicate_length{
	  bins duplicate_length[]={[0:256] };}
	  
	  hmc_pkt_length: coverpoint packet.length{
	  bins length[]={[0:8] };}
	  
	   hmc_pkt_payload: coverpoint packet.payload{
	  bins payload[]={[0:$] };}
	  
	  hmc_pkt_ crc: coverpoint packet.crc{
	  bins crc[]={[0:$] };}
	  
	  hmc_pkt_return_token_cnt: coverpoint packet.return_token_cnt{
	  bins return_token_cnt[]={[0:16] };}
	  
	  hmc_pkt_source_link_ID: coverpoint packet.source_link_ID{
	  bins source_link_ID[]={[0:$] };}
	  
	  hmc_pkt_sequence_number: coverpoint packet.sequence_number{
	  bins sequence_number[]={[0:$] };}
	  
	  hmc_pkt_forward_retry_ptr: coverpoint packet.forward_retry_ptr{
	  bins forward_retry_ptr[]={[0:$] };}
	  
	    hmc_pkt_return_retry_ptr: coverpoint packet.return_retry_ptr{
	  bins return_retry_ptr[]={[0:$] };}
	  
	  hmc_pkt_return_tag: coverpoint packet.return_tag{
	  bins return_tag[]={[0:$] };]
	  
	  hmc_pkt_ error_status: coverpoint packet. error_status{
	  bins  error_status[]={[0:$] };}
	  
	  hmc_pkt_ data_invalid: coverpoint packet. data_invalid{
	  bins data_invalid[]={[0:$] };}
	  
	  hmc_pkt_start_retry: coverpoint packet.start_retry{
	  bins start_retry[]={[0:$] };}
	  
	  hmc_pkt_clear_error_abort: coverpoint packet.clear_error_abort{
	  bins clear_error_abort[]={[0:$] };}
	  
	   hmc_pkt_poisoned: coverpoint packet.poisoned{
	  bins poisoned[]={[0:$] };}
	  
	    hmc_pkt_crc_error: coverpoint packet.crc_error{
	  bins crc_error[]={[0:$] };}
	  
	  
	   hmc_pkt_is_state_item: coverpoint packet.is_state_item{
	  bins is_state_item[]={[0:$] };}
	  
	   hmc_pkt_init_state: coverpoint packet.init_state{
	  bins init_state[]={[0:16] };}
	  
	   hmc_pkt_new_request: coverpoint packet.new_request{
	  bins new_request[]={[0:16] };}
	  
     endgroup
   
   
   

  function new (string name, uvm_component parent);
      super.new(name, parent);
      cmd_cov = new();
	  pkt_cov = new();
     
   endfunction : new




function void write(hmc_pkt_item t);
      
	  // Request Header fields
        cube_ID=t.cube_ID;           
     address=t.address;            
     tag= t.tag;                 
     duplicate_length=t.duplicate_length;    
     length=t.length;              
 
    // Request Tail fields
         crc =t.crc;              
         return_token_cnt=t.return_token_cnt;    
         source_link_ID=t.source_link_ID;      
     sequence_number=t.sequence_number;   
       forward_retry_ptr=t.forward_retry_ptr; 
     return_retry_ptr=t.return_retry_ptr;   

  //*****************************************************************************//
   // Response Header fields
                        
   return_tag=t.return_tag;         
                         


  // Response Tail fields
             
  error_status=t.error_status;        
 data_invalid=t.data_invalid;      
                         
  //*****************************************************************************//
  // special bits for IRTRY
       start_retry=t.start_retry;         
       clear_error_abort=t.clear_error_abort;  

  // CRC status fields
            poisoned=t.poisoned;      
           crc_error=t.crc_error;      

  is_state_item=t. is_state_item;
  init_state=t.init_state;
new_request=t.new_request ;
	  
        cmd_cov.sample();
		pkt_cov.sample();
		
   endfunction : write
   
   
   
   
   
   endclass : coverage