/*---Created by Jorge Munoz Taylor---*/
/*------University of Costa Rica-----*/
/*---------Digital circuits II-------*/
/*-----------Homework 6--------------*/

module elevator (
    input CLK,
    input Go_Up,
    input Go_Down,
    input Halt,
    input Top_Limit_Hit,
    input Bottom_Limit_Hit,
    output reg [4:0] state
); 
    reg [4:0] next;  //Next state

    localparam [4:0] Idle      = 5'b00001, //One hot define, every state is
                     Going_Up  = 5'b00010, //encoded using only one 1 in
                     Going_Down= 5'b00100, //diferent position.
                     At_Top    = 5'b01000,
                     At_Bottom = 5'b10000;

    always @(posedge CLK) state <= next;

    always @(*) begin
        next <= Idle;
    
        case(state)
            Idle:
                if      (Go_Up)   next <= Going_Up; 
                else if (Go_Down) next <= Going_Down;  
                else    next <= Idle;
                
            Going_Up:
                if      (Top_Limit_Hit) next <= At_Top; 
                else if (Halt) next <= Idle;
                else    next <= Going_Up;

            Going_Down:
                if      (Bottom_Limit_Hit)  next <= At_Bottom;
                else if (Halt) next <= Idle;
                else    next <= Going_Down; 

            At_Top:
                if      (Go_Down) next <= Going_Down;
                else    next <= At_Top;
            
            At_Bottom:
                if      (Go_Up) next <= Going_Up;
                else    next <= At_Bottom; 

            default:
                next <= Idle; //Default state, define in the homework description            
        endcase  
    end 
endmodule