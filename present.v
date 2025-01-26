`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2023 20:36:15
// Design Name: 
// Module Name: present
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



module present(key0,dat0,odat,clk, reset);
input [63:0]dat0;
input [79:0]key0;
input clk,reset;
output odat;
 wire [63:0]dat1,dat2,dat3,dat4,dat5,dat6,dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat15,dat16,dat17,dat18,dat19
 ,dat20,dat21,dat22,dat23,dat24,dat25,dat26,dat27,dat28,dat29,dat30,dat31;
 wire [79:0]key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19
 ,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31;
 reg [4:0]count;
reg dreg;
reg kreg;


rounddd m1(dat1,dat0,key0,reset,clk);
rounddd m2(dat2,dat1,key1,reset,clk);
rounddd m3(dat3,dat2,key2,reset,clk);
rounddd m4(dat4,dat3,key3,reset,clk);
rounddd m5(dat5,dat4,key4,reset,clk);
rounddd m6(dat6,dat5,key5,reset,clk);
rounddd m7(dat7,dat6,key6,reset,clk);
rounddd m8(dat8,dat7,key7,reset,clk);
rounddd m9(dat9,dat8,key8,reset,clk);
rounddd m10(dat10,dat8,key9,reset,clk);
rounddd m11(dat11,dat10,key10,reset,clk);
rounddd m12(dat12,dat11,key11,reset,clk);
rounddd m13(dat13,dat12,key12,reset,clk);
rounddd m14(dat14,dat13,key13,reset,clk);
rounddd m15(dat15,dat14,key14,reset,clk);
rounddd m16(dat16,dat15,key15,reset,clk);
rounddd m17(dat17,dat16,key16,reset,clk);
rounddd m18(dat18,dat17,key17,reset,clk);
rounddd m19(dat19,dat18,key18,reset,clk);
rounddd m20(dat20,dat19,key19,reset,clk);
rounddd m21(dat21,dat20,key20,reset,clk);
rounddd m22(dat22,dat21,key21,reset,clk);
rounddd m23(dat23,dat22,key22,reset,clk);
rounddd m24(dat24,dat23,key23,reset,clk);
rounddd m25(dat25,dat24,key24,reset,clk);
rounddd m26(dat26,dat25,key25,reset,clk);
rounddd m27(dat27,dat26,key26,reset,clk);
rounddd m28(dat28,dat27,key27,reset,clk);
rounddd m29(dat29,dat28,key28,reset,clk);
rounddd m30(dat30,dat29,key29,reset,clk);
rounddd m31(dat31,dat30,key30,reset,clk);

///instantiate last round in main module

round l1(odat,dat31,key31,reset,clk);

//instantiate key_updation 

key_updation p1( key1,key0,clk,count,reset);
key_updation p2( key2,key1,clk,count,reset);
key_updation p3( key3,key2,clk,count,reset);
key_updation p4( key4,key3,clk,count,reset);
key_updation p5( key5,key4,clk,count,reset);
key_updation p6( key6,key5,clk,count,reset);
key_updation p7( key7,key6,clk,count,reset);
key_updation p8( key8,key7,clk,count,reset);
key_updation p9( key9,key8,clk,count,reset);
key_updation p10( key10,key9,clk,count,reset);
key_updation p11( key11,key10,clk,count,reset);
key_updation p12( key12,key11,clk,count,reset);
key_updation p13( key13,key12,clk,count,reset);
key_updation p14( key14,key13,clk,count,reset);
key_updation p15( key15,key14,clk,count,reset);
key_updation p16( key16,key15,clk,count,reset);
key_updation p17( key17,key16,clk,count,reset);
key_updation p18( key18,key17,clk,count,reset);
key_updation p19( key19,key18,clk,count,reset);
key_updation p20( key20,key19,clk,count,reset);
key_updation p22( key21,key20,clk,count,reset);
key_updation p23( key22,key21,clk,count,reset);
key_updation p24( key23,key22,clk,count,reset);
key_updation p25( key24,key23,clk,count,reset);
key_updation p26( key25,key24,clk,count,reset);
key_updation p27( key26,key25,clk,count,reset);
key_updation p28( key27,key26,clk,count,reset);
key_updation p29( key28,key27,clk,count,reset);
key_updation p30( key29,key28,clk,count,reset);
key_updation p31( key30,key29,clk,count,reset);
key_updation p32( key31,key30,clk,count,reset);


//sequential circuit

always @(posedge clk) begin
    if (reset) begin
      dreg <= dat0;
      kreg <= key0;
      count=5'b00000;
    end
    else 
    begin
      dreg <= dat31;
      kreg <= key31;
      count<=count+5'b00001;
    end
  end
    endmodule 
     
 // calling rounddd   
     
module rounddd(dat1,dat0,key0,reset,clk);
input [79:0]key0;
input [63:0]dat0;
input reset,clk;
output [63:0]dat1;
wire [63:0]dat1a,dat2a;

  assign dat1a=key0[79:16]^dat0;

 ////////////having xor operation we are passing the data from substitution boxes
 
 genvar i;
 generate 

        for(i=0;i<64;i=i+4) begin 
        present_Encryption_Sbox Sbox_inst(.d(dat2a[i+3:i]), .c(dat1a[i+3:i]));
        end 
        endgenerate
        
   ////permutation layer 
        
      Present_Encryption_Pbox Pbox_inst(.f(dat1),.e(dat2a));
      endmodule 
      
      ////// calling last round 
     module round(odat,key31,dat31,reset,clk);
     input [79:0]key31;
     input [63:0]dat31;
     input clk,reset;
     output [63:0]odat;
     assign odat=key31[79:16]^dat31;
     endmodule
     
     
     ///module for key updation 
     module key_updation(key1,key0,clk,count,reset);
     input [79:0]key0;
     input clk;
     input reset;
     output [79:0]key1;
     input [4:0]count;
     
     
     wire [79:0]key01;
     assign key01={key0[18:0],key0[79:19]};
     assign key1[14:0]=key0[14:0];
     assign key1[75:20]=key0[75:0];
     assign key1[19:15]=key0[19:15]^count;
     present_Encryption_Sbox keyBox_inst(.d(key1[79:76]), .c(key0[79:76])); 
    
     endmodule
     
     
     
      //  module for permutation layer
          
     module Present_Encryption_Pbox(
   output [63:0] f,
   input  [63:0] e);

 assign f[0 ] = e[0 ];
 assign f[16] = e[1 ];
 assign f[32] = e[2 ];
 assign f[48] = e[3 ];
 assign f[1 ] = e[4 ];
 assign f[17] = e[5 ];
 assign f[33] = e[6 ];
 assign f[49] = e[7 ];
 assign f[2 ] = e[8 ];
 assign f[18] = e[9 ];
 assign f[34] = e[10];
 assign f[50] = e[11];
 assign f[3 ] = e[12];
 assign f[19] = e[13];
 assign f[35] = e[14];
 assign f[51] = e[15];
 assign f[4 ] = e[16];
 assign f[20] = e[17];
 assign f[36] = e[18];
 assign f[52] = e[19];
 assign f[5 ] = e[20];
 assign f[21] = e[21]; 
 assign f[37] = e[22];
 assign f[53] = e[23];
 assign f[6 ] = e[24];
 assign f[22] = e[25];
 assign f[38] = e[26];
 assign f[54] = e[27];
 assign f[7 ] = e[28];
 assign f[23] = e[29];
 assign f[39] = e[30];
 assign f[55] = e[31];
 assign f[8 ] = e[32];
 assign f[24] = e[33];
 assign f[40] = e[34];
 assign f[56] = e[35];
 assign f[9 ] = e[36];
 assign f[25] = e[37];
 assign f[41] = e[38];
 assign f[57] = e[39];
 assign f[10] = e[40];
 assign f[26] = e[41];
 assign f[42] = e[42];
 assign f[58] = e[43];
 assign f[11] = e[44];
 assign f[27] = e[45];
 assign f[43] = e[46];
 assign f[59] = e[47];
 assign f[12] = e[48];
 assign f[28] = e[49];
 assign f[44] = e[50];
 assign f[60] = e[51];
 assign f[13] = e[52];
 assign f[29] = e[53];
 assign f[45] = e[54];
 assign f[61] = e[55];
 assign f[14] = e[56];
 assign f[30] = e[57];
 assign f[46] = e[58];
 assign f[62] = e[59];
 assign f[15] = e[60];
 assign f[31] = e[61];
 assign f[47] = e[62];
 assign f[63] = e[63];

 endmodule
 
 
 //module for substitution layer
 
 module   present_Encryption_Sbox(
   output reg [3:0] d,
   input      [3:0] c
 );


always @(c)
    case (c)
        4'h0 : d = 4'hC;
        4'h1 : d = 4'h5;
        4'h2 : d = 4'h6;
        4'h3 : d = 4'hB;
        4'h4 : d = 4'h9;
        4'h5 : d = 4'h0;
        4'h6 : d = 4'hA;
        4'h7 : d = 4'hD;
        4'h8 : d = 4'h3;
        4'h9 : d = 4'hE;
        4'hA : d = 4'hF;
        4'hB : d = 4'h8;
        4'hC : d = 4'h4;
        4'hD : d = 4'h7;
        4'hE : d = 4'h1;
        4'hF : d = 4'h2;
    endcase
endmodule

