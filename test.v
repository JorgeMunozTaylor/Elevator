/*---Created by Jorge Munoz Taylor---*/
/*------University of Costa Rica-----*/
/*---------Digital circuits II-------*/
/*-----------Homework 6--------------*/

module test (
    CLK,
    Go_Up,
    Go_Down,
    Halt,
    Top_Limit_Hit,
    Bottom_Limit_Hit,
    state
);
    input [4:0] state;
    output reg  CLK;
    output reg  Go_Up;
    output reg  Go_Down;
    output reg  Halt;
    output reg  Top_Limit_Hit;
    output reg  Bottom_Limit_Hit;

    parameter t_CLK  = 1;
            
    initial CLK             = 0;
    initial Go_Up           = 0;
    initial Go_Down         = 0;
    initial Halt            = 0;
    initial Top_Limit_Hit   = 0;
    initial Bottom_Limit_Hit= 0;

    always #t_CLK CLK = !CLK;

    initial
    begin
        #4 Go_Up   = 1;
        #4 Go_Up   = 0;
    end

    initial
    begin
        #8 Top_Limit_Hit   = 1;
        #4  Top_Limit_Hit   = 0;
    end

    initial
    begin
        #12 Go_Down   = 1;
        #4  Go_Down   = 0;
    end

    initial
    begin
        #16 Bottom_Limit_Hit   = 1;
        #4  Bottom_Limit_Hit   = 0;
    end

    initial
    begin
        #20 Go_Up   = 1;
        #4 Go_Up   = 0;
    end

    initial
    begin
        #24 Halt = 1;
        #4  Halt = 0;
    end

endmodule