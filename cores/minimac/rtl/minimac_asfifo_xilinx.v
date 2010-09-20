//==========================================
// Function : Asynchronous FIFO (w/ 2 asynchronous clocks).
// Coder    : Alex Claros F.
// Date     : 15/May/2005.
// Notes    : This implementation is based on the article 
//            'Asynchronous FIFO in Virtex-II FPGAs'
//            writen by Peter Alfke. This TechXclusive 
//            article can be downloaded from the
//            Xilinx website. It has some minor modifications.
//=========================================

module minimac_asfifo_xilinx
  #(parameter    DATA_WIDTH    = 9,
                 ADDRESS_WIDTH = 4)
     //Reading port
    (output wire [8:0]        Data_out, 
     output wire                         Empty_out,
     input wire                          ReadEn_in,
     input wire                          RClk,        
     //Writing port.	 
     input wire  [8:0]        Data_in,  
     output wire                         Full_out,
     input wire                          WriteEn_in,
     input wire                          WClk,
     
     input wire                          Clear_in);

FIFO16 #(
        .DATA_WIDTH(9),
        .FIRST_WORD_FALL_THROUGH("TRUE")
) fifo16_1 (
        .ALMOSTEMPTY(),
        .ALMOSTFULL(),
        .DO(Data_out[7:0]),
        .DOP(Data_out[8]),
        .EMPTY(Empty_out),
        .FULL(Full_out),
        .RDCOUNT(),
        .RDERR(),
        .WRCOUNT(),
        .WRERR(),
        .DI(Data_in[7:0]),
        .DIP(Data_in[8]),
        .RDCLK(RClk),
        .RDEN(ReadEn_in),
        .RST(Clear_in),
        .WRCLK(WClk),
        .WREN(WriteEn_in)
);

endmodule
