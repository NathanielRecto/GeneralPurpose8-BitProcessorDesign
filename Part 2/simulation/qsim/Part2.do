onerror {quit -f}
vlib work
vlog -work work moddedALU.vo
vlog -work work Part2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Block1_vlg_vec_tst
vcd file -direction Part2.msim.vcd
vcd add -internal Block1_vlg_vec_tst/*
vcd add -internal Block1_vlg_vec_tst/i1/*
add wave /*
run -all
