## Testbench of *UVM Candy Lovers* which uses YASA as simulation script

### List of testcases
- `testcases/sanity1`: for Tutorial #9.
- `testcases/sanity2`: for Tutorial #9..
- `testcases/sanity3`: for Tutorial #9.

Mandatory: each testcase dir name should be same with xxx.sv name

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
`%> YASAsim -g top_smoke`

Part of log
```
Compile passed
Log:
    /home/IC/github/uvm_candy_lover_m3d19/uvm_candy_lover/uvm_candy_lover_out/top_smoke/candy_lover/compile.log

Starting top_smoke__sanity1__12345
Output file: yasa_out/test_output/top_smoke__sanity1__12345_1ae3ecaaa2d2275db4cd18af359c46ad39a7cf24/output.txt
warn (P=0 W=1 F=0 T=5) top_smoke__sanity1__12345 (18.4 seconds)

Starting top_smoke__sanity2__56789
Output file: yasa_out/test_output/top_smoke__sanity2__56789_739ee350705b6245bad54c506770c647a283d9e3/output.txt
pass (P=1 W=1 F=0 T=5) top_smoke__sanity2__56789 (5.4 seconds)

Starting top_smoke__sanity3__1494303291
Output file: yasa_out/test_output/top_smoke__sanity3__1494303291_083ec24b5103daa8f2f7b71e6dcdea957b0aae12/output.txt
fail (P=1 W=1 F=1 T=5) top_smoke__sanity3__1494303291 (14.8 seconds)

Starting top_smoke__sanity3__4018961881
Output file: yasa_out/test_output/top_smoke__sanity3__4018961881_05c8092cf91f2c3b951231c31a4c1151507866fd/output.txt
fail (P=1 W=1 F=2 T=5) top_smoke__sanity3__4018961881 (14.6 seconds)

Starting top_smoke__sanity3__376008663
Output file: yasa_out/test_output/top_smoke__sanity3__376008663_e05177caa20c66a6df793653ba83f3f1be33c653/output.txt
fail (P=1 W=1 F=3 T=5) top_smoke__sanity3__376008663 (20.7 seconds)

==== Summary ==========================================
pass top_smoke__sanity2__56789      (5.4 seconds)
warn top_smoke__sanity1__12345      (18.4 seconds)
fail top_smoke__sanity3__1494303291 (14.8 seconds)
fail top_smoke__sanity3__4018961881 (14.6 seconds)
fail top_smoke__sanity3__376008663  (20.7 seconds)
=======================================================
pass 1 of 5
warn 1 of 5
fail 3 of 5
=======================================================
Total time was 74.0 seconds
Elapsed time was 74.2 seconds
=======================================================
Some failed!
```
More YASA options, ref YASA [README.md](https://github.com/zhajio1988/YASA/blob/master/README.md)
#### Reference
uvm candy lover is my favourite UVM tutorial.[UVM Tutorial for Candy Lovers](http://cluelogic.com/).

我将教程翻译成中文并发表在我的博客上.[UVM糖果爱好者教程](https://blog.csdn.net/zhajio/column/info/20484).
