`ifndef __SANITY3_SV__
`define __SANITY3_SV__
class sanity3 extends jelly_bean_base_test;
   `uvm_component_utils( sanity3 )

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   task main_phase( uvm_phase phase );
      jelly_bean_reg_sequence jb_reg_seq;

      phase.raise_objection( .obj( this ) );
      jb_reg_seq = jelly_bean_reg_sequence::type_id::create( .name( "jb_reg_seq" ) );
      jb_reg_seq.model = jb_reg_block;
      repeat(3000)
         jb_reg_seq.start( .sequencer( jb_env.jb_agent.jb_seqr ) );
      
      #100ns;
      phase.drop_objection( .obj( this ) );
      //`uvm_error(this.get_name(), "debug point error")
      
   endtask: main_phase
endclass: sanity3

`endif
