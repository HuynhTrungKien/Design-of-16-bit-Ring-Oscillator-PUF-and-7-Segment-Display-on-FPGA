`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2025 01:15:54 PM
// Design Name: 
// Module Name: RO
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


module RO(
	input clk,
	input rst,
	input in_valid,
	input [7:0] challange,
	output out
);
	(* dont_touch = "yes" *) wire[15:0] ro_out1,ro_out2;
	(* dont_touch = "yes" *) wire mux_out1;
	(* dont_touch = "yes" *) wire mux_out2;
	(* dont_touch = "yes" *) reg[1:0] out_led;
	(* dont_touch = "yes" *) reg [20:0]on_counter;
	(* dont_touch = "yes" *) wire n_in_valid = &on_counter;
	(* dont_touch = "yes" *) reg [40:0] cnt1;
	(* dont_touch = "yes" *) reg [40:0] cnt2;
	//ro
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro1 (.enable(n_in_valid), .out(ro_out1[0]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro2 (.enable(n_in_valid), .out(ro_out1[1]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro3 (.enable(n_in_valid), .out(ro_out1[2]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro4 (.enable(n_in_valid), .out(ro_out1[3]));
	
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro5 (.enable(n_in_valid), .out(ro_out1[4]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro6 (.enable(n_in_valid), .out(ro_out1[5]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro7 (.enable(n_in_valid), .out(ro_out1[6]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro8 (.enable(n_in_valid), .out(ro_out1[7]));

	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro9 (.enable(n_in_valid), .out(ro_out1[8]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro10 (.enable(n_in_valid), .out(ro_out1[9]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro11 (.enable(n_in_valid), .out(ro_out1[10]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro12 (.enable(n_in_valid), .out(ro_out1[11]));
	
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro13 (.enable(n_in_valid), .out(ro_out1[12]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro14 (.enable(n_in_valid), .out(ro_out1[13]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro15 (.enable(n_in_valid), .out(ro_out1[14]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro16 (.enable(n_in_valid), .out(ro_out1[15]));
	//-------------------------------------------------------------------------------------------------------
    (* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro17 (.enable(n_in_valid), .out(ro_out2[0]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro18 (.enable(n_in_valid), .out(ro_out2[1]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro19 (.enable(n_in_valid), .out(ro_out2[2]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro20 (.enable(n_in_valid), .out(ro_out2[3]));
	
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro21 (.enable(n_in_valid), .out(ro_out2[4]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro22 (.enable(n_in_valid), .out(ro_out2[5]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro23 (.enable(n_in_valid), .out(ro_out2[6]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro24 (.enable(n_in_valid), .out(ro_out2[7]));

	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro25 (.enable(n_in_valid), .out(ro_out2[8]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro26 (.enable(n_in_valid), .out(ro_out2[9]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro27 (.enable(n_in_valid), .out(ro_out2[10]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro28 (.enable(n_in_valid), .out(ro_out2[11]));
	
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro29 (.enable(n_in_valid), .out(ro_out2[12]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro30 (.enable(n_in_valid), .out(ro_out2[13]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro31 (.enable(n_in_valid), .out(ro_out2[14]));
	(* dont_touch = "yes",keep_hierarchy = "yes" *) ring_osci ro32 (.enable(n_in_valid), .out(ro_out2[15]));
	//mux
	(* dont_touch = "yes",keep_hierarchy = "yes" *) mux16to1 mux1(ro_out1,challange[3:0],mux_out1);
	(* dont_touch = "yes",keep_hierarchy = "yes" *) mux16to1 mux2(ro_out2,challange[7:4],mux_out2);
	
	always@(posedge mux_out1 or posedge rst)begin
		if(rst)
			cnt1<=0;
		else if(&cnt1)
			cnt1<=cnt1;
		else
			cnt1<=cnt1+1;
	end
	
	always@(posedge mux_out2 or posedge rst)begin
		if(rst)
			cnt2<=0;
		else if(&cnt2)
			cnt2<=cnt2;
		else
			cnt2<=cnt2+1;
	end
	always@(posedge clk or posedge rst)begin
		if(rst) begin
			on_counter<=0;
			end
		else if(n_in_valid)
		begin
			on_counter<=on_counter;
	    end
		else if(in_valid==1)
			on_counter<=on_counter+1;
	end
	assign out = (out_led==2'b01) ? 1'b0:
	             (out_led==2'b10) ? 1'b1: 1'b0;
	always@(posedge mux_out1 or posedge rst)begin
		if(rst)
			out_led<=2'b00;	
		else if(cnt1==41'b0_0000_0000_0000_11111_1111_1111_1111_1111_1111_1111)begin
			if(cnt1>cnt2)begin
				out_led<=2'b01;
			end
			else if(cnt1<cnt2)begin
				out_led<=2'b10;
			end
			else
				out_led<=2'b11;
		end
	end
endmodule


module ring_osci(
	input enable,
	output out
);

  (* dont_touch = "yes" *) wire w1;
  (* dont_touch = "yes" *) wire w2;
  (* dont_touch = "yes" *) wire w3;
  (* dont_touch = "yes" *) wire w4;
  (* dont_touch = "yes" *) wire w5;
  (* dont_touch = "yes" *) wire w6;
  (* dont_touch = "yes" *) wire w7;
  (* dont_touch = "yes" *) wire w8;
  (* dont_touch = "yes" *) wire w9;
  (* dont_touch = "yes" *) wire w10;
  (* dont_touch = "yes" *) wire w11;
  (* dont_touch = "yes" *) wire w12;
  (* dont_touch = "yes" *) wire w13;
  (* dont_touch = "yes" *) wire w14;
  (* dont_touch = "yes" *) wire w15;
  (* dont_touch = "yes" *) wire w16;
  (* dont_touch = "yes" *) wire fb;

  assign w1 = (enable & fb);
  assign w2 = ~w1;
  assign w3 = ~w2;
  assign w4 = ~w3;
  assign w5 = ~w4;
  assign w6 = ~w5;
  assign w7 = ~w6;
  assign w8 = ~w7;
  assign w9 = ~w8;
  assign w10 = ~w9;
  assign w11 = ~w10;
  assign w12 = ~w11;
  assign w13 = ~w12;
  assign w14 = ~w13;
  assign w15 = ~w14;
  assign w16 = ~w15;
  assign fb = w16;
  assign out = ~w16;

endmodule

module mux16to1(
	input [15:0]in,
	input [3:0]sel,
	output reg out_mux
);

always@(*)begin
	case(sel)
		0: out_mux = in[0];
		1: out_mux = in[1];
		2: out_mux = in[2];
		3: out_mux = in[3];
		4: out_mux = in[4];
		5: out_mux = in[5];
		6: out_mux = in[6];
		7: out_mux = in[7];
		8: out_mux = in[8];
		9: out_mux = in[9];
		10: out_mux = in[10];
		11: out_mux = in[11];
		12: out_mux = in[12];
		13: out_mux = in[13];
		14: out_mux = in[14];
		15: out_mux = in[15];
	endcase
end
endmodule
