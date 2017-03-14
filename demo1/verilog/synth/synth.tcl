echo "********** CS552 Reading files begin ********************"
set my_verilog_files [list alu.v
set my_toplevel proc
define_design_lib WORK -path ./WORK
analyze -f verilog $my_verilog_files
elaborate $my_toplevel -architecture verilog
echo "********** CS552 Reading files end ********************"
echo "********** CS552 Linking all modules begin ********************"
link
echo "********** CS552 Linking all modules end **********************"
echo "********** CS552 Checking design of all modules begin**********"
check_design -summary
echo "********** CS552 Checking design of all modules end************"
report_hierarchy > synth/hierarchy.txt
set filename [format "%s%s"  $my_toplevel ".syn.v"]
write -f verilog $my_toplevel -output synth/$filename -hierarchy
quit