module NEGATOR_16(Y,IN);
    
    output [15:0]Y;
    input [15:0]IN;
        
    nand(Y[0],IN[0],IN[0]);
    nand(Y[1],IN[1],IN[1]);
    nand(Y[2],IN[2],IN[2]);
    nand(Y[3],IN[3],IN[3]);
    nand(Y[4],IN[4],IN[4]);
    nand(Y[5],IN[5],IN[5]);
    nand(Y[6],IN[6],IN[6]);
    nand(Y[7],IN[7],IN[7]);
    nand(Y[8],IN[8],IN[8]);
    nand(Y[9],IN[9],IN[9]);
    nand(Y[10],IN[10],IN[10]);
    nand(Y[11],IN[11],IN[11]);
    nand(Y[12],IN[12],IN[12]);
    nand(Y[13],IN[13],IN[13]);
    nand(Y[14],IN[14],IN[14]);
    nand(Y[15],IN[15],IN[15]);
    
endmodule
