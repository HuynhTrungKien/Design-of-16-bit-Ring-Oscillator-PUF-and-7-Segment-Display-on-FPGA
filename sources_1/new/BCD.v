`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2025 01:15:11 PM
// Design Name: 
// Module Name: BCD
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


module BCD(
    input clk_100MHz,
    input reset,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    output reg [6:0] seg,       // segment pattern 0-9
    output reg [3:0] digit      // digit select signals
    );
    
// Cathode chung: 1 = sáng, 0 = tắt
parameter ZERO  = 7'b011_1111;  // 0
parameter ONE   = 7'b000_0110;  // 1
parameter TWO   = 7'b101_1011;  // 2
parameter THREE = 7'b100_1111;  // 3
parameter FOUR  = 7'b110_0110;  // 4
parameter FIVE  = 7'b110_1101;  // 5
parameter SIX   = 7'b111_1101;  // 6
parameter SEVEN = 7'b000_0111;  // 7
parameter EIGHT = 7'b111_1111;  // 8
parameter NINE  = 7'b110_1111;  // 9
parameter A_HEX = 7'b111_0111;  // A
parameter B_HEX = 7'b111_1100;  // b
parameter C_HEX = 7'b011_1001;  // C
parameter D_HEX = 7'b101_1110;  // d
parameter E_HEX = 7'b111_1001;  // E
parameter F_HEX = 7'b111_0001;  // F
    
    // To select each digit in turn
    reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
    // Logic for controlling digit select and digit timer
    always @(posedge clk_100MHz or posedge reset) begin
        if(reset) begin
            digit_select <= 0;
            digit_timer <= 0; 
        end
        else                                        // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 99_999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
                digit_timer <= 0;                   // 10ns x 100,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
    
    // Logic for driving the 4 bit anode output based on digit select
    always @(digit_select) begin
        case(digit_select) 
            2'b00 : digit = 4'b1110;   // Turn on ones digit
            2'b01 : digit = 4'b1101;   // Turn on tens digit
            2'b10 : digit = 4'b1011;   // Turn on hundreds digit
            2'b11 : digit = 4'b0111;   // Turn on thousands digit
        endcase
    end
    
    // Logic for driving segments based on which digit is selected and the value of each digit
    always @*
        case(digit_select)
            2'b00 : begin       // ONES DIGIT
                        case(ones)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            4'b1010 : seg = A_HEX;
                            4'b1011 : seg = B_HEX;
                            4'b1100 : seg = C_HEX;
                            4'b1101 : seg = D_HEX;
                            4'b1110 : seg = E_HEX;
                            4'b1111 : seg = F_HEX;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(tens)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            4'b1010 : seg = A_HEX;
                            4'b1011 : seg = B_HEX;
                            4'b1100 : seg = C_HEX;
                            4'b1101 : seg = D_HEX;
                            4'b1110 : seg = E_HEX;
                            4'b1111 : seg = F_HEX;
                        endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
                        case(hundreds)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            4'b1010 : seg = A_HEX;
                            4'b1011 : seg = B_HEX;
                            4'b1100 : seg = C_HEX;
                            4'b1101 : seg = D_HEX;
                            4'b1110 : seg = E_HEX;
                            4'b1111 : seg = F_HEX;
                        endcase
                    end
                    
            2'b11 : begin       // MINUTES ONES DIGIT
                        case(thousands)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            4'b1010 : seg = A_HEX;
                            4'b1011 : seg = B_HEX;
                            4'b1100 : seg = C_HEX;
                            4'b1101 : seg = D_HEX;
                            4'b1110 : seg = E_HEX;
                            4'b1111 : seg = F_HEX;
                        endcase
                    end
        endcase

endmodule
