----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:25 05/28/2023 
-- Design Name: 
-- Module Name:    MIPS_Processor_20101181_2023 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MIPS_Processor_20101181_2023 is
	Port ( CLK1 : in  STD_LOGIC);
end MIPS_Processor_20101181_2023;

architecture Behavioral of MIPS_Processor_20101181_2023 is
component ALUCTRL_20101181_2023 is
    Port ( ALU_op : in  STD_LOGIC_VECTOR (1 downto 0);
           FUNCT : in  STD_LOGIC_VECTOR (5 downto 0);
           Cout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component ALU_20101181_2023 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (3 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end component;

component Adder_20101181_2023 is
    Port ( in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2 : in  STD_LOGIC_VECTOR (31 downto 0);
           res : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component ControlUnit_20101181_2023 is
    Port ( instruct : in  STD_LOGIC_VECTOR (5 downto 0);
           regDst : out  STD_LOGIC;
           aluSrc : out  STD_LOGIC;
           memtoReg : out  STD_LOGIC;
           regWrite : out  STD_LOGIC;
           memRead : out  STD_LOGIC;
           memWrite : out  STD_LOGIC;
           branch : out  STD_LOGIC;
           aluOp : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component InstructionMemory_20101181_2023 is
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux1_2to1_32bits_20101181_2023 is
	Port ( in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2_2to1_32bits_20101181_2023 is
    Port ( in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux3_2to1_32bits_20101181_2023 is
    Port ( in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux4_2to1_5bits_20101181_2023 is
    Port ( in0 : in  STD_LOGIC_VECTOR (4 downto 0);
           in1 : in  STD_LOGIC_VECTOR (4 downto 0);
           s : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (4 downto 0));
end component;


component MemoryUnit_20101181_2023 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           MemRead : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component PC_20101181_2023 is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end component;

component PC_Adder_20101181_2023 is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RegFile_20101181_2023 is
    Port ( ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Shift_20101181_2023 is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SignExtend_20101181_2023 is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

	signal ALUinput1: std_logic_vector(31 downto 0);
	signal ALUinput2: std_logic_vector(31 downto 0);
	signal ALUoutput: std_logic_vector(31 downto 0);
	signal ALUzeroFlag: std_logic;
	signal ALUselect: std_logic_vector(3 downto 0);
	
	signal PCoutput: std_logic_vector(31 downto 0);
	signal PCinput: std_logic_vector (31 downto 0);
	signal AdderOut: std_logic_vector (31 downto 0);
	
	signal inputInstruction: std_logic_vector (31 downto 0);
	signal readData2: std_logic_vector (31 downto 0);
	signal dataMemoryOut: std_logic_vector (31 downto 0);
	signal writeDataIn: std_logic_vector (31 downto 0);
	signal MUXregDstOut:std_logic_vector (4 downto 0);
	
	signal regDst: std_logic;
	signal branch: std_logic;
	signal memRead: std_logic;
	signal memToReg: std_logic;
	signal ALUopControl: std_logic_vector (1 downto 0);
	signal memWrite: std_logic;
	signal ALUSrc: std_logic;
	signal RegWrite: std_logic;
	
	signal signExtend: std_logic_vector (31 downto 0);
	signal shiftLeft2: std_logic_vector (31 downto 0);
	
	signal ALUoutputToPCMUX: std_logic_vector (31 downto 0);
	signal PCMUXcontrol: std_logic;
begin
pc : PC_20101181_2023 port map(
clk => Clk1,
input => PCinput,
output => PCoutput
);

pcadder:Adder_20101181_2023 port map (
	in1 => PCoutput,
	in2 => "00000000000000000000000000000100",
	res => AdderOut
);

branchadder: Adder_20101181_2023 port map (
   in1 => AdderOut,
	in2 => shiftLeft2,
	res => ALUoutputToPCMUX
);

instructionmemory: InstructionMemory_20101181_2023 port map(
	PC => PCoutput,
	Instruction => inputInstruction
);
           

controlunit:ControlUnit_20101181_2023 port map (
	instruct => inputInstruction (31 downto 26),
	regDst => regDst,
	aluSrc => ALUSrc,
	memtoReg => memToReg,
	regWrite => RegWrite,
	memRead => memRead,
	memWrite => memWrite,
	branch => branch,
	aluOp => ALUopControl
);

muxregdst: Mux4_2to1_5bits_20101181_2023 port map (
in0 => inputInstruction (20 downto 16),
in1 => inputInstruction (15 downto 11),
s => regDst,
o => MUXregDstOut
);

memorymux: Mux1_2to1_32bits_20101181_2023 port map (
	in0 => ALUoutput,
	in1 => dataMemoryOut,
	s => memToReg,
	o => writeDataIn
);

alumux:Mux2_2to1_32bits_20101181_2023 port map (
in0=> readData2,
in1 => signExtend,
s  => ALUSrc,
o  => ALUinput2
);

PCMUXcontrol <= (branch AND ALUzeroFlag);

pcmux: Mux3_2to1_32bits_20101181_2023 port map (
in0 => AdderOut,
in1 => ALUoutputToPCMUX,
s => PCMUXcontrol,
o => PCinput
);

registerflemain: RegFile_20101181_2023 port map (
	Data1 => ALUinput1,
	Data2 => readData2,
	ReadReg1 => inputInstruction (25 downto 21),
	ReadReg2 => inputInstruction (20 downto 16),
	WriteReg  => MUXregDstOut,
	WriteData => writeDataIn,
	RegWrite => RegWrite,
   Clk => Clk1
);

signextendmain: SignExtend_20101181_2023 port map (
input => inputInstruction (15 downto 0),
output => signExtend
);

ShiftLeft:Shift_20101181_2023 port map(
Input => signExtend,
Output => shiftLeft2
);

alucontrol:ALUCTRL_20101181_2023 port map(
FUNCT => inputInstruction (5 downto 0),
ALU_op => ALUopControl,
Cout => ALUselect
);

ALU: ALU_20101181_2023 port map(
A => ALUinput1,
B => ALUinput2,
AluOp => ALUselect,
Result => ALUoutput,
Zero => ALUzeroFlag
);
MemoryUnitMain: MemoryUnit_20101181_2023 port map(
MemRead => memRead,
MemWrite => memWrite,
WriteData => readData2,
Address => ALUoutput,
ReadData => dataMemoryOut,
CLK => Clk1
);

end Behavioral;

