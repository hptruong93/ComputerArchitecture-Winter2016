LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

ENTITY pipeline_tb IS
END pipeline_tb;

ARCHITECTURE behaviour OF pipeline_tb IS

COMPONENT pipeline IS
port (clk : in std_logic;
      a, b, c, d, e : in integer;
      op1, op2, op3, op4, op5, final_output : out integer
  );
END COMPONENT;

--The input signals with their initial values
SIGNAL clk: STD_LOGIC := '0';
SIGNAL s_a, s_b, s_c, s_d, s_e : INTEGER := 0;
SIGNAL s_op1, s_op2, s_op3, s_op4, s_op5, s_final_output : INTEGER := 0;

CONSTANT clk_period : time := 1 ns;

BEGIN
dut: pipeline
PORT MAP(clk, s_a, s_b, s_c, s_d, s_e, s_op1, s_op2, s_op3, s_op4, s_op5, s_final_output);

 --clock process
clk_process : PROCESS
BEGIN
	clk <= '1';
	WAIT FOR clk_period/2;
	clk <= '0';
	WAIT FOR clk_period/2;
END PROCESS;
 

stim_process: PROCESS
BEGIN   
	--TODO: Stimulate the inputs for the pipelined equation ((a + b) * 42) - (c * d * (a - e)) and assert the results

	s_a <= 1;
	s_b <= 0;
	s_c <= 0;
	s_d <= 0;
	s_e <= -1;


	WAIT FOR 1.5 * clk_period;
	ASSERT (s_op1 = 1) REPORT "s_op1 not 1" SEVERITY ERROR;
	ASSERT (s_op3 = 0) REPORT "s_op3 not 0" SEVERITY ERROR;
	ASSERT (s_op4 = 2) REPORT "s_op4 not 2" SEVERITY ERROR;

	WAIT FOR 1 * clk_period;
	ASSERT (s_op2 = 42) REPORT "s_op2 not 42" SEVERITY ERROR;
	ASSERT (s_op5 = 0) REPORT "s_op5 not 0" SEVERITY ERROR;

	WAIT FOR 1 * clk_period;
	ASSERT (s_final_output = 42) REPORT "Final result is not 42" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	WAIT FOR 0.5 * clk_period;
	REPORT "***************************************************************";

	s_a <= -3;
	s_b <= -3;
	s_c <= -1;
	s_d <= -2;
	s_e <= -5;

	WAIT FOR 1.1 * clk_period;
	ASSERT (s_op1 = -6) REPORT "s_op1 not -6" SEVERITY ERROR;
	ASSERT (s_op3 = 2) REPORT "s_op3 not 2" SEVERITY ERROR;
	ASSERT (s_op4 = 2) REPORT "s_op4 not 2" SEVERITY ERROR;

	s_a <= 1;
	s_b <= 1;
	s_c <= -4;
	s_d <= 2;
	s_e <= -3;

	WAIT FOR 1 * clk_period;
	ASSERT (s_op2 = -252) REPORT "s_op2 not -252" SEVERITY ERROR;
	ASSERT (s_op5 = 4) REPORT "s_op5 not 4" SEVERITY ERROR;

	ASSERT (s_op1 = 2) REPORT "s_op1 not 2" SEVERITY ERROR;
	ASSERT (s_op3 = -8) REPORT "s_op3 not -8" SEVERITY ERROR;
	ASSERT (s_op4 = 4) REPORT "s_op4 not 4" SEVERITY ERROR;

	WAIT FOR 1 * clk_period;
	ASSERT (s_final_output = -256) REPORT "Final result is not -256" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);

	ASSERT (s_op2 = 84) REPORT "s_op2 not 84" SEVERITY ERROR;
	ASSERT (s_op5 = -32) REPORT "s_op5 not -32" SEVERITY ERROR;

	WAIT FOR 1 * clk_period;
	ASSERT (s_final_output = 116) REPORT "Final result is not 116" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	WAIT FOR 0.9 * clk_period;
	REPORT "***************************************************************";
	
	s_a <= 34;
	s_b <= 37;
	s_c <= -44;
	s_d <= -25;
	s_e <= 25;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 71) REPORT "s_op1 not 71" SEVERITY ERROR;
	ASSERT (s_op3 = 1100) REPORT "s_op3 not 1100" SEVERITY ERROR;
	ASSERT (s_op4 = 9) REPORT "s_op4 not 9" SEVERITY ERROR;
	ASSERT (s_op2 = 2982) REPORT "s_op2 not 2982" SEVERITY ERROR;
	ASSERT (s_op5 = 9900) REPORT "s_op5 not 9900" SEVERITY ERROR;

	ASSERT (s_final_output = -6918) REPORT "Final result is not -6918" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -7;
	s_b <= -12;
	s_c <= -21;
	s_d <= -34;
	s_e <= 44;

	WAIT FOR 1.1 * clk_period;
	ASSERT (s_op1 = -19) REPORT "s_op1 not -19" SEVERITY ERROR;
	ASSERT (s_op3 = 714) REPORT "s_op3 not 714" SEVERITY ERROR;
	ASSERT (s_op4 = -51) REPORT "s_op4 not -51" SEVERITY ERROR;

	s_a <= -32;
	s_b <= -5;
	s_c <= -45;
	s_d <= 17;
	s_e <= -34;

	WAIT FOR 1 * clk_period;
	ASSERT (s_op2 = -798) REPORT "s_op2 not -798" SEVERITY ERROR;
	ASSERT (s_op5 = -36414) REPORT "s_op5 not -36414" SEVERITY ERROR;

	ASSERT (s_op1 = -37) REPORT "s_op1 not -37" SEVERITY ERROR;
	ASSERT (s_op3 = -765) REPORT "s_op3 not -765" SEVERITY ERROR;
	ASSERT (s_op4 = 2) REPORT "s_op4 not 2" SEVERITY ERROR;

	s_a <= 40;
	s_b <= 5;
	s_c <= -39;
	s_d <= 26;
	s_e <= -26;

	WAIT FOR 1 * clk_period;
	ASSERT (s_final_output = 35616) REPORT "Final result is not 35616" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);

	ASSERT (s_op1 = 45) REPORT "s_op1 not 45" SEVERITY ERROR;
	ASSERT (s_op3 = -1014) REPORT "s_op3 not -1014" SEVERITY ERROR;
	ASSERT (s_op4 = 66) REPORT "s_op4 not 66" SEVERITY ERROR;

	ASSERT (s_op2 = -1554) REPORT "s_op2 not -1554" SEVERITY ERROR;
	ASSERT (s_op5 = -1530) REPORT "s_op5 not -1530" SEVERITY ERROR;

	WAIT FOR 1 * clk_period;
	ASSERT (s_final_output = -24) REPORT "Final result is not -24" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);

	ASSERT (s_op2 = 1890) REPORT "s_op2 not 1890" SEVERITY ERROR;
	ASSERT (s_op5 = -66924) REPORT "s_op5 not -66924" SEVERITY ERROR;

	WAIT FOR 1 * clk_period;
	ASSERT (s_final_output = 68814) REPORT "Final result is not 68814" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);

	REPORT "***************************************************************";

	WAIT;
END PROCESS stim_process;
END;
