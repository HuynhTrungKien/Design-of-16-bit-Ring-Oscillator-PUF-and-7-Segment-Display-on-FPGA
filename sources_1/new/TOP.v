`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2025 01:16:10 PM
// Design Name: 
// Module Name: TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TOP(input clk,en,rst,[7:0]challenge,output [6:0] seg, output [3:0] digit,output [3:0] out1,out2,out3,out4);
//wire [3:0] out1,out2,out3,out4;
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic1 (clk,rst,en,challenge,out1[0]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic2 (clk,rst,en,challenge,out1[1]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic3 (clk,rst,en,challenge,out1[2]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic4 (clk,rst,en,challenge,out1[3]);

(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic5 (clk,rst,en,challenge,out2[0]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic6 (clk,rst,en,challenge,out2[1]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic7 (clk,rst,en,challenge,out2[2]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic8 (clk,rst,en,challenge,out2[3]);

(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic9 (clk,rst,en,challenge,out3[0]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic10 (clk,rst,en,challenge,out3[1]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic11 (clk,rst,en,challenge,out3[2]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic12 (clk,rst,en,challenge,out3[3]);

(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic13 (clk,rst,en,challenge,out4[0]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic14 (clk,rst,en,challenge,out4[1]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic15 (clk,rst,en,challenge,out4[2]);
(* dont_touch = "yes",keep_hierarchy = "yes" *) RO ic16 (clk,rst,en,challenge,out4[3]);

(* dont_touch = "yes",keep_hierarchy = "yes" *) BCD ic17 (clk,rst,out1,out2,out3,out4,seg,digit);
endmodule