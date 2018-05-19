/*---Created by Jorge Munoz Taylor---*/
/*-----------Homework 6--------------*/

module elevator (
    input CLK,
    input Go_Up,
    input Go_Down,
    input Halt,
    input Top_Limit_Hit,
    input Bottom_Limit_Hit
    OUT
); 
    /*2 bit output, there is 3 posible output states:
    move up, move down or dont move, 10 down, 01 up, 11 dont move*/ 
    output reg [1:0] direction;
    reg        [4:0] state, next;

    parameter [4:0] Idle      = 0, //State index
                    Going_Up  = 1,
                    Going_Down= 2,
                    At_Top    = 3,
                    At_Bottom = 4;

    reg [4:0] state, next;  //Five states, five bits

    always @(posedge CLK)
        if (halt)
            begin
            state       <= 5'b0;
            state[Idle] <= 1'b1; //Idle is 00001
            end
        else
            state <= next;
        

    always @(Go_Up, Go_Down, Top_Limit_Hit, Bottom_Limit_Hit)
    begin
        next      = 5'b0;
        direction = 2'b11;

        case(1'b1)
            state[Idle]:
                begin
                end
            state[Going_Up]:
                begin
                end
            state[Going_Down]:
                begin
                end
            state[At_Top]:
                begin
                end
            state[At_Bottom]:
                begin
                end

        endcase

    end     

endmodule
