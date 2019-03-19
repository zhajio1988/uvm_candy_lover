## Testbench of *UVM Tutorial for Candy Lovers* which uses YASA as simulation script

### List of testcases
- `testcases/sanity1`: for Tutorial #9.
- `testcases/sanity2`: for Tutorial #9..
- `testcases/sanity3`: for Tutorial #9.

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
    
#### Reference
uvm candy lover is my favourite UVM tutorial.[UVM Tutorial for Candy Lovers](http://cluelogic.com/).

我将教程翻译成中文并发表在我的博客上[UVM糖果爱好者教程](https://blog.csdn.net/zhajio/column/info/20484).
