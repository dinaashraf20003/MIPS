--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:41:35 05/28/2023
-- Design Name:   
-- Module Name:   C:/Users/user/Desktop/MIPS/MIPS_DinaAshraf_20101181_2023/ControlUnit_TB_20101181_2023.vhd
-- Project Name:  MIPS_DinaAshraf_20101181_2023
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnit_20101181_2023
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ControlUnit_TB_20101181_2023 IS
END ControlUnit_TB_20101181_2023;
 
ARCHITECTURE behavior OF ControlUnit_TB_20101181_2023 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit_20101181_2023
    PORT(
         instruct : IN  std_logic_vector(5 downto 0);
         regDst : OUT  std_logic;
         aluSrc : OUT  std_logic;
         memtoReg : OUT  std_logic;
         regWrite : OUT  std_logic;
         memRead : OUT  std_logic;
         memWrite : OUT  std_logic;
         branch : OUT  std_logic;
         aluOp : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal regDst : std_logic;
   signal aluSrc : std_logic;
   signal memtoReg : std_logic;
   signal regWrite : std_logic;
   signal memRead : std_logic;
   signal memWrite : std_logic;
   signal branch : std_logic;
   signal aluOp : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit_20101181_2023 PORT MAP (
          instruct => instruct,
          regDst => regDst,
          aluSrc => aluSrc,
          memtoReg => memtoReg,
          regWrite => regWrite,
          memRead => memRead,
          memWrite => memWrite,
          branch => branch,
          aluOp => aluOp
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		instruct = 0;
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 
		instruct = 6'b100011; #100;
		instruct = 6'b101011; #100;
		instruct = 6'b000100; #100;

      wait;
   end process;

END;
