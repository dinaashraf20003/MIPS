
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALUCTRL_TB_20101181_2023 IS
END  ALUCTRL_TB_20101181_2023 ;
 
ARCHITECTURE behavior OF  ALUCTRL_TB_20101181_2023  IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUCTRL_20101181_2023
    PORT(
         ALU_op : IN  std_logic_vector(1 downto 0);
         FUNCT : IN  std_logic_vector(5 downto 0);
         Cout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALU_op : std_logic_vector(1 downto 0) := (others => '0');
   signal FUNCT : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUCTRL_20101181_2023 PORT MAP (
          ALU_op => ALU_op,
          FUNCT => FUNCT,
          Cout => Cout
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
	
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
ALU_op<="00";
wait for 100 ns;
ALU_op<="01";
wait for 100 ns;
ALU_op<="10";
FUNCT(3 downto 0)<="0000";
wait for 100 ns;
ALU_op<="10";
FUNCT(3 downto 0)<="0010";
wait for 100 ns;
ALU_op<="10";
FUNCT(3 downto 0)<="0100";
wait for 100 ns;
ALU_op<="10";
FUNCT(3 downto 0)<="0101";
wait for 100 ns;
ALU_op<="10";
FUNCT(3 downto 0)<="1010";
wait for 100 ns;
ALU_op<="11";
FUNCT(3 downto 0)<="0010";
wait for 100 ns;
ALU_op<="11";
FUNCT(3 downto 0)<="1010";
wait for 100 ns;
	
      wait;
   end process;

END;

