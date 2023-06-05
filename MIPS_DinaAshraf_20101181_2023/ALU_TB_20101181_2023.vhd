
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_TB_20101181_2023 IS
END ALU_TB_20101181_2023;
 
ARCHITECTURE behavior OF ALU_TB_20101181_2023 IS
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_20101181_2023
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(3 downto 0);
         Result : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic
        );
    END COMPONENT;
   

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
   signal Result : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name
 
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
   uut: ALU_20101181_2023 PORT MAP (
          A => A,
          B => B,
          AluOp => AluOp,
          Result => Result,
          Zero => Zero
        );

   -- Stimulus process
   stim_proc: process
   begin
 wait for 100 ns;

A <= X"00000005";
B <= X"00000007";
AluOp <= "0000";
wait for 100 ns;

AluOp <= "0001";
wait for 100 ns;

AluOp <= "0010";
wait for 100 ns;

AluOp <= "0110";
wait for 100 ns;

AluOp <= "0111";
wait for 100 ns;

AluOp <= "1100";
wait for 100 ns;

      wait;
   end process;

END;