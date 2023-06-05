--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:29:58 02/27/2023
-- Design Name:   
-- Module Name:   D:/Student/shabacy/Mux_20101181_2023/mux_test.vhd
-- Project Name:  Mux_20101181_2023
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_20101181_2023
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
 
ENTITY MUX1_TB_20101181_2023 IS
END MUX1_TB_20101181_2023;
 
ARCHITECTURE behavior OF MUX1_TB_20101181_2023 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux1_2to1_32bits_20101181_2023   PORT(
         in1 : IN  std_logic;
         in2 : IN  std_logic;
         s : IN  std_logic;
         o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal s : std_logic := '0';

 	--Outputs
   signal o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux1_2to1_32bits_20101181_2023 PORT MAP (
          in1 => in1,
          in2 => in2,
          s => s,
          o => o
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		in1<='0'; in2<='1'; s<='0';
		wait for 100 ns;	
		in1<='0'; in2<='1'; s<='1';
	   wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
