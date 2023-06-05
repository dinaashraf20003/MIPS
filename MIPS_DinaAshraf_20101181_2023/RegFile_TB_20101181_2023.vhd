LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RegFile_TB_20101181_2023 IS
END RegFile_TB_20101181_2023;
 
ARCHITECTURE behavior OF RegFile_TB_20101181_2023 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegFile_20101181_2023
    PORT(
         ReadReg1 : IN  std_logic_vector(4 downto 0);
         ReadReg2 : IN  std_logic_vector(4 downto 0);
         WriteReg : IN  std_logic_vector(4 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         RegWrite : IN  std_logic;
         Clk : IN  std_logic;
         Data1 : OUT  std_logic_vector(31 downto 0);
         Data2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ReadReg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ReadReg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal WriteReg : std_logic_vector(4 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Data1 : std_logic_vector(31 downto 0);
   signal Data2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegFile_20101181_2023 PORT MAP (
          ReadReg1 => ReadReg1,
          ReadReg2 => ReadReg2,
          WriteReg => WriteReg,
          WriteData => WriteData,
          RegWrite => RegWrite,
          Clk => Clk,
          Data1 => Data1,
          Data2 => Data2
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 
		ReadReg1<="01110";
		ReadReg2<="01000";
		wait for 100 ns;
		RegWrite<='1';
		WriteData<=X"0020001F";
		WriteReg<="00111";
		wait for 100 ns;
		ReadReg2<="00011";
      wait;
   end process;

END;
