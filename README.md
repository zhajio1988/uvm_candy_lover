## Testbench of *UVM Candy Lovers* which uses YASA as simulation script

### List of testcases
- `testcases/sanity1`: for Tutorial #9.
- `testcases/sanity2`: for Tutorial #9..
- `testcases/sanity3`: for Tutorial #9.
mandatory: each testcase dir name should be same with tests.sv name
such as: `testcases/sanity1/sanity1.sv`

```
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
```

### How to use
#### Using git
1. `%> git clone https://github.com/zhajio1988/uvm_candy_lover.git`
2. `%> cd uvm_candy_lover/bin`
3. `%> git clone https://github.com/zhajio1988/YASA.git`
4. `%> cd ../`
5. `%> source bin/bootenv.csh`
6. `%> YASAsim -t sanity1`

#### Run a testcase or a group
```
%> YASAsim -h    
%> YASAsim -doc 
%> YASAsim -version
%> YASAsim -t sanity1 -co
%> YASAsim -t sanity1 -r 5 
%> YASAsim -t sanity1 -seed 352938188
%> YASAsim -t sanity1 -seed 352938188 -so
%> YASAsim -g top_smoke -co
%> YASAsim -g top_smoke -p 5
```
more yasa options, ref YASA[README.md](https://github.com/zhajio1988/YASA/blob/master/README.md)
    
#### Reference
uvm candy lover is my favourite UVM tutorial.[UVM Tutorial for Candy Lovers](http://cluelogic.com/).

我将教程翻译成中文并发表在我的博客上.[UVM糖果爱好者教程](https://blog.csdn.net/zhajio/column/info/20484).
