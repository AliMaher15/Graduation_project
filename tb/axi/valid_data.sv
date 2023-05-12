
class valid_data #(parameter T_USER_WIDTH = 16, parameter T_DATA_BIT = 128) extends  uvm_sequence_item;

rand  bit [T_DATA_BIT-1 : 0]    t_data;
rand  bit [T_USER_WIDTH-1 : 0]  t_user;
rand  int unsigned delay = 0;

`uvm_object_param_utils_begin(valid_data #(.T_DATA_BIT(T_DATA_BIT), .T_USER_WIDTH(T_USER_WIDTH)))
`uvm_field_int(t_data, UVM_ALL_ON | UVM_NOPACK | UVM_HEX)
`uvm_field_int(t_user, UVM_ALL_ON | UVM_NOPACK | UVM_HEX)
`uvm_field_int(delay, UVM_ALL_ON | UVM_NOPACK | UVM_HEX)
`uvm_object_utils_end	


//constructor
function new (string name = "valid_data");
super.new(name);
endfunction 


endclass : valid_data


