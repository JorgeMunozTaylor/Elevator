/*---Created by Jorge Munoz Taylor---*/
/*------University of Costa Rica-----*/
/*---------Digital circuits II-------*/
/*-----------Homework 6--------------*/
`timescale 1ns/1ps

`ifndef TEST_V
    `define TEST_V
    `include "test.v"
`endif

`ifndef ELEVATOR_V
    `define ELEVATOR_V
    `include "elevator.v"
`endif

`ifndef SYNTH_V
    `define SYNTH_V
    `include "synth.v"
`endif

`include "cmos_cells.v"

module testbench;
    wire [1:0] CLK;
    wire [1:0] Go_Up;
    wire [1:0] Go_Down;
    wire [1:0] Halt;
    wire [1:0] Top_Limit_Hit;
    wire [1:0] Bottom_Limit_Hit;
    wire [4:0] state;
    wire [4:0] statey;

    test prueba_conductual(
        CLK[0],
        Go_Up[0],
        Go_Down[0],
        Halt[0],
        Top_Limit_Hit[0],
        Bottom_Limit_Hit[0],
        state
    );

    elevator elevador(
        CLK[0],
        Go_Up[0],
        Go_Down[0],
        Halt[0],
        Top_Limit_Hit[0],
        Bottom_Limit_Hit[0],
        state
    );

    /*----------------------------------*/
    test prueba_yosys(
        CLK[1],
        Go_Up[1],
        Go_Down[1],
        Halt[1],
        Top_Limit_Hit[1],
        Bottom_Limit_Hit[1],
        statey
    );

    elevator_yosys elevador_yosys(
        CLK[1],
        Go_Up[1],
        Go_Down[1],
        Halt[1],
        Top_Limit_Hit[1],
        Bottom_Limit_Hit[1],
        statey
    );

    initial $dumpfile("./simulacion.vcd");
    initial $dumpvars;
    initial #30 $finish;
endmodule
