
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module r2rv(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	inout 		          		CLOCK4_50,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// KEY //////////
	input 		     [3:0]		KEY,
	input 		          		RESET_N,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// PS2 //////////
	inout 		          		PS2_CLK,
	inout 		          		PS2_CLK2,
	inout 		          		PS2_DAT,
	inout 		          		PS2_DAT2,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// VGA //////////
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

  logic we;
  logic [2:0] rwm;
  logic [31:0] pc, instr, rwa, rd2, wd3;



//=======================================================
//  Structural coding
//=======================================================

  assign LEDR = SW;

  riscv riscv(.clk(KEY[0]), .reset(!RESET_N), .pc, .instr,
	.wem(we), .rwmm(rwm), .rwam(rwa), .wdm(wd3), .rdm(rd2),
    .SW, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);
  mem mem(.clk(KEY[0]), .we, .ra1(pc), .ra2(rwa), .wa3(rwa), 
    .rm1(WORD), .rm2(rwm), .wm3(rwm), .rd1(instr), .rd2, .wd3);



endmodule

