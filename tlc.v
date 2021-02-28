`timescale 1ns / 1ps
// Engineer: RAKESH KUMAR RAY
// Create Date: 02/28/2021 09:38:19 PM
// Module Name: tlc
module tlc(clk,reset,r,g,y);
input clk,reset;
output  reg r,g,y;
reg[1:0] state,nextstate;
initial 
begin
state = 0;
nextstate = 0;
end
parameter start = 0;
parameter red = 1;
parameter green = 2;
parameter yellow = 3;

always @(posedge clk or posedge reset)
begin
if(reset == 1'b1)
state <= start;
else 
state <= nextstate;
end

always @(state)
begin
case(state)
start: begin
nextstate = red;
r = 0;
g = 0;
y = 0;
end
red: begin
nextstate = yellow;
r = 1;
g = 0;
y = 0;
end
yellow: begin
nextstate = green;
r = 0;
g = 0;
y = 1;
end
green: begin
nextstate = red;
r = 0;
g = 1;
y = 0;
end
default: nextstate = start;
endcase
end
endmodule
