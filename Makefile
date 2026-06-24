.PHONY : clean compile simulate waveform all gen_hex com sim wf all_os lint


clean :
	rm -rf simv *.vcd *.log *.out *.fsdb *.conf *.rc *.key verdiLog vfastLog *.daidir csrc

compile :
	vcs -f filelist/files.f -o simv -full64

simulate :
	./simv

waveform :
	verdi *.fsdb

all : clean compile simulate waveform 

gen_hex :
	./toolchain/nanocore16_toolchain asm/add.asm program.hex

com :
	iverilog src/*.v sim/tb_nanocore16_os.v -o simv

sim : 
	vvp simv

wf :
	gtkwave *.vcd 

all_os : clean com sim wf 


