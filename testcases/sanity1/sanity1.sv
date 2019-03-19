`ifndef __SANITY1_SV__
`define __SANITY1_SV__
class sanity1 extends jelly_bean_base_test;
   `uvm_component_utils( sanity1 )

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   task main_phase( uvm_phase phase );
      jelly_bean_reg_sequence jb_reg_seq;

      phase.raise_objection( .obj( this ) );
      jb_reg_seq = jelly_bean_reg_sequence::type_id::create( .name( "jb_reg_seq" ) );
      jb_reg_seq.model = jb_reg_block;
      repeat(100)
         jb_reg_seq.start( .sequencer( jb_env.jb_agent.jb_seqr ) );
      
      #100ns;
      phase.drop_objection( .obj( this ) );
      `uvm_warning(this.get_name(), "debug point warning")
      
   endtask: main_phase
endclass: sanity1

`endif
