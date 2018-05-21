CC1=iverilog
CC2=vvp
CC3=gtkwave
tb=./testbench.v
OUT=OUT
gtkwave=./simulacion.vcd

registro: simulation

simulation:
	$(CC1) -o $(OUT) $(tb)&&$(CC2) $(OUT);
	$(CC3) $(gtkwave);

clean:
	rm -f *.o *.vcd OUT make