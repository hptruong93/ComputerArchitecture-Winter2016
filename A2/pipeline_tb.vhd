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
	clk <= '0';
	WAIT FOR clk_period/2;
	clk <= '1';
	WAIT FOR clk_period/2;
END PROCESS;
 

stim_process: PROCESS
BEGIN   
	--TODO: Stimulate the inputs for the pipelined equation ((a + b) * 42) - (c * d * (a - e)) and assert the results

	s_a <= 0;
	s_b <= 0;
	s_c <= 0;
	s_d <= 0;
	s_e <= 0;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 0) REPORT "s_op1 not 0" SEVERITY ERROR;
	ASSERT (s_op3 = 0) REPORT "s_op3 not 0" SEVERITY ERROR;
	ASSERT (s_op4 = 0) REPORT "s_op4 not 0" SEVERITY ERROR;
	ASSERT (s_op2 = 0) REPORT "s_op2 not 0" SEVERITY ERROR;
	ASSERT (s_op5 = 0) REPORT "s_op5 not 0" SEVERITY ERROR;

	ASSERT (s_final_output = 0) REPORT "Final result is not 0" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 1;
	s_b <= 0;
	s_c <= 0;
	s_d <= 0;
	s_e <= -1;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 1) REPORT "s_op1 not 1" SEVERITY ERROR;
	ASSERT (s_op3 = 0) REPORT "s_op3 not 0" SEVERITY ERROR;
	ASSERT (s_op4 = 2) REPORT "s_op4 not 2" SEVERITY ERROR;
	ASSERT (s_op2 = 42) REPORT "s_op2 not 42" SEVERITY ERROR;
	ASSERT (s_op5 = 0) REPORT "s_op5 not 0" SEVERITY ERROR;

	ASSERT (s_final_output = 42) REPORT "Final result is not 42" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 1;
	s_b <= 1;
	s_c <= -1;
	s_d <= 1;
	s_e <= -2;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 2) REPORT "s_op1 not 2" SEVERITY ERROR;
	ASSERT (s_op3 = -1) REPORT "s_op3 not -1" SEVERITY ERROR;
	ASSERT (s_op4 = 3) REPORT "s_op4 not 3" SEVERITY ERROR;
	ASSERT (s_op2 = 84) REPORT "s_op2 not 84" SEVERITY ERROR;
	ASSERT (s_op5 = -3) REPORT "s_op5 not -3" SEVERITY ERROR;

	ASSERT (s_final_output = 87) REPORT "Final result is not 87" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -1;
	s_b <= -2;
	s_c <= -1;
	s_d <= -1;
	s_e <= 0;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -3) REPORT "s_op1 not -3" SEVERITY ERROR;
	ASSERT (s_op3 = 1) REPORT "s_op3 not 1" SEVERITY ERROR;
	ASSERT (s_op4 = -1) REPORT "s_op4 not -1" SEVERITY ERROR;
	ASSERT (s_op2 = -126) REPORT "s_op2 not -126" SEVERITY ERROR;
	ASSERT (s_op5 = -1) REPORT "s_op5 not -1" SEVERITY ERROR;

	ASSERT (s_final_output = -125) REPORT "Final result is not -125" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 0;
	s_b <= 1;
	s_c <= 1;
	s_d <= -2;
	s_e <= 0;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 1) REPORT "s_op1 not 1" SEVERITY ERROR;
	ASSERT (s_op3 = -2) REPORT "s_op3 not -2" SEVERITY ERROR;
	ASSERT (s_op4 = 0) REPORT "s_op4 not 0" SEVERITY ERROR;
	ASSERT (s_op2 = 42) REPORT "s_op2 not 42" SEVERITY ERROR;
	ASSERT (s_op5 = 0) REPORT "s_op5 not 0" SEVERITY ERROR;

	ASSERT (s_final_output = 42) REPORT "Final result is not 42" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 0;
	s_b <= 0;
	s_c <= 0;
	s_d <= -2;
	s_e <= 0;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 0) REPORT "s_op1 not 0" SEVERITY ERROR;
	ASSERT (s_op3 = 0) REPORT "s_op3 not 0" SEVERITY ERROR;
	ASSERT (s_op4 = 0) REPORT "s_op4 not 0" SEVERITY ERROR;
	ASSERT (s_op2 = 0) REPORT "s_op2 not 0" SEVERITY ERROR;
	ASSERT (s_op5 = 0) REPORT "s_op5 not 0" SEVERITY ERROR;

	ASSERT (s_final_output = 0) REPORT "Final result is not 0" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -1;
	s_b <= 2;
	s_c <= -4;
	s_d <= -2;
	s_e <= 0;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 1) REPORT "s_op1 not 1" SEVERITY ERROR;
	ASSERT (s_op3 = 8) REPORT "s_op3 not 8" SEVERITY ERROR;
	ASSERT (s_op4 = -1) REPORT "s_op4 not -1" SEVERITY ERROR;
	ASSERT (s_op2 = 42) REPORT "s_op2 not 42" SEVERITY ERROR;
	ASSERT (s_op5 = -8) REPORT "s_op5 not -8" SEVERITY ERROR;

	ASSERT (s_final_output = 50) REPORT "Final result is not 50" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -3;
	s_b <= -3;
	s_c <= -1;
	s_d <= -2;
	s_e <= -5;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -6) REPORT "s_op1 not -6" SEVERITY ERROR;
	ASSERT (s_op3 = 2) REPORT "s_op3 not 2" SEVERITY ERROR;
	ASSERT (s_op4 = 2) REPORT "s_op4 not 2" SEVERITY ERROR;
	ASSERT (s_op2 = -252) REPORT "s_op2 not -252" SEVERITY ERROR;
	ASSERT (s_op5 = 4) REPORT "s_op5 not 4" SEVERITY ERROR;

	ASSERT (s_final_output = -256) REPORT "Final result is not -256" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 1;
	s_b <= 1;
	s_c <= -4;
	s_d <= 2;
	s_e <= -3;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 2) REPORT "s_op1 not 2" SEVERITY ERROR;
	ASSERT (s_op3 = -8) REPORT "s_op3 not -8" SEVERITY ERROR;
	ASSERT (s_op4 = 4) REPORT "s_op4 not 4" SEVERITY ERROR;
	ASSERT (s_op2 = 84) REPORT "s_op2 not 84" SEVERITY ERROR;
	ASSERT (s_op5 = -32) REPORT "s_op5 not -32" SEVERITY ERROR;

	ASSERT (s_final_output = 116) REPORT "Final result is not 116" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -4;
	s_b <= -3;
	s_c <= 4;
	s_d <= -3;
	s_e <= -5;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -7) REPORT "s_op1 not -7" SEVERITY ERROR;
	ASSERT (s_op3 = -12) REPORT "s_op3 not -12" SEVERITY ERROR;
	ASSERT (s_op4 = 1) REPORT "s_op4 not 1" SEVERITY ERROR;
	ASSERT (s_op2 = -294) REPORT "s_op2 not -294" SEVERITY ERROR;
	ASSERT (s_op5 = -12) REPORT "s_op5 not -12" SEVERITY ERROR;

	ASSERT (s_final_output = -282) REPORT "Final result is not -282" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -3;
	s_b <= -2;
	s_c <= -2;
	s_d <= 1;
	s_e <= -3;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -5) REPORT "s_op1 not -5" SEVERITY ERROR;
	ASSERT (s_op3 = -2) REPORT "s_op3 not -2" SEVERITY ERROR;
	ASSERT (s_op4 = 0) REPORT "s_op4 not 0" SEVERITY ERROR;
	ASSERT (s_op2 = -210) REPORT "s_op2 not -210" SEVERITY ERROR;
	ASSERT (s_op5 = 0) REPORT "s_op5 not 0" SEVERITY ERROR;

	ASSERT (s_final_output = -210) REPORT "Final result is not -210" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 48;
	s_b <= 37;
	s_c <= 40;
	s_d <= 25;
	s_e <= -36;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 85) REPORT "s_op1 not 85" SEVERITY ERROR;
	ASSERT (s_op3 = 1000) REPORT "s_op3 not 1000" SEVERITY ERROR;
	ASSERT (s_op4 = 84) REPORT "s_op4 not 84" SEVERITY ERROR;
	ASSERT (s_op2 = 3570) REPORT "s_op2 not 3570" SEVERITY ERROR;
	ASSERT (s_op5 = 84000) REPORT "s_op5 not 84000" SEVERITY ERROR;

	ASSERT (s_final_output = -80430) REPORT "Final result is not -80430" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 43;
	s_b <= -37;
	s_c <= 18;
	s_d <= -20;
	s_e <= -27;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 6) REPORT "s_op1 not 6" SEVERITY ERROR;
	ASSERT (s_op3 = -360) REPORT "s_op3 not -360" SEVERITY ERROR;
	ASSERT (s_op4 = 70) REPORT "s_op4 not 70" SEVERITY ERROR;
	ASSERT (s_op2 = 252) REPORT "s_op2 not 252" SEVERITY ERROR;
	ASSERT (s_op5 = -25200) REPORT "s_op5 not -25200" SEVERITY ERROR;

	ASSERT (s_final_output = 25452) REPORT "Final result is not 25452" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
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

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -19) REPORT "s_op1 not -19" SEVERITY ERROR;
	ASSERT (s_op3 = 714) REPORT "s_op3 not 714" SEVERITY ERROR;
	ASSERT (s_op4 = -51) REPORT "s_op4 not -51" SEVERITY ERROR;
	ASSERT (s_op2 = -798) REPORT "s_op2 not -798" SEVERITY ERROR;
	ASSERT (s_op5 = -36414) REPORT "s_op5 not -36414" SEVERITY ERROR;

	ASSERT (s_final_output = 35616) REPORT "Final result is not 35616" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -32;
	s_b <= -5;
	s_c <= -45;
	s_d <= 17;
	s_e <= -34;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -37) REPORT "s_op1 not -37" SEVERITY ERROR;
	ASSERT (s_op3 = -765) REPORT "s_op3 not -765" SEVERITY ERROR;
	ASSERT (s_op4 = 2) REPORT "s_op4 not 2" SEVERITY ERROR;
	ASSERT (s_op2 = -1554) REPORT "s_op2 not -1554" SEVERITY ERROR;
	ASSERT (s_op5 = -1530) REPORT "s_op5 not -1530" SEVERITY ERROR;

	ASSERT (s_final_output = -24) REPORT "Final result is not -24" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 40;
	s_b <= 5;
	s_c <= -39;
	s_d <= 26;
	s_e <= -26;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 45) REPORT "s_op1 not 45" SEVERITY ERROR;
	ASSERT (s_op3 = -1014) REPORT "s_op3 not -1014" SEVERITY ERROR;
	ASSERT (s_op4 = 66) REPORT "s_op4 not 66" SEVERITY ERROR;
	ASSERT (s_op2 = 1890) REPORT "s_op2 not 1890" SEVERITY ERROR;
	ASSERT (s_op5 = -66924) REPORT "s_op5 not -66924" SEVERITY ERROR;

	ASSERT (s_final_output = 68814) REPORT "Final result is not 68814" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -33;
	s_b <= 29;
	s_c <= 18;
	s_d <= -13;
	s_e <= -3;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -4) REPORT "s_op1 not -4" SEVERITY ERROR;
	ASSERT (s_op3 = -234) REPORT "s_op3 not -234" SEVERITY ERROR;
	ASSERT (s_op4 = -30) REPORT "s_op4 not -30" SEVERITY ERROR;
	ASSERT (s_op2 = -168) REPORT "s_op2 not -168" SEVERITY ERROR;
	ASSERT (s_op5 = 7020) REPORT "s_op5 not 7020" SEVERITY ERROR;

	ASSERT (s_final_output = -7188) REPORT "Final result is not -7188" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 15;
	s_b <= -8;
	s_c <= 4;
	s_d <= -26;
	s_e <= 6;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 7) REPORT "s_op1 not 7" SEVERITY ERROR;
	ASSERT (s_op3 = -104) REPORT "s_op3 not -104" SEVERITY ERROR;
	ASSERT (s_op4 = 9) REPORT "s_op4 not 9" SEVERITY ERROR;
	ASSERT (s_op2 = 294) REPORT "s_op2 not 294" SEVERITY ERROR;
	ASSERT (s_op5 = -936) REPORT "s_op5 not -936" SEVERITY ERROR;

	ASSERT (s_final_output = 1230) REPORT "Final result is not 1230" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 22;
	s_b <= -24;
	s_c <= -39;
	s_d <= -47;
	s_e <= -8;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -2) REPORT "s_op1 not -2" SEVERITY ERROR;
	ASSERT (s_op3 = 1833) REPORT "s_op3 not 1833" SEVERITY ERROR;
	ASSERT (s_op4 = 30) REPORT "s_op4 not 30" SEVERITY ERROR;
	ASSERT (s_op2 = -84) REPORT "s_op2 not -84" SEVERITY ERROR;
	ASSERT (s_op5 = 54990) REPORT "s_op5 not 54990" SEVERITY ERROR;

	ASSERT (s_final_output = -55074) REPORT "Final result is not -55074" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -28;
	s_b <= 41;
	s_c <= 17;
	s_d <= -28;
	s_e <= -12;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 13) REPORT "s_op1 not 13" SEVERITY ERROR;
	ASSERT (s_op3 = -476) REPORT "s_op3 not -476" SEVERITY ERROR;
	ASSERT (s_op4 = -16) REPORT "s_op4 not -16" SEVERITY ERROR;
	ASSERT (s_op2 = 546) REPORT "s_op2 not 546" SEVERITY ERROR;
	ASSERT (s_op5 = 7616) REPORT "s_op5 not 7616" SEVERITY ERROR;

	ASSERT (s_final_output = -7070) REPORT "Final result is not -7070" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 33;
	s_b <= 18;
	s_c <= -17;
	s_d <= -46;
	s_e <= -8;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 51) REPORT "s_op1 not 51" SEVERITY ERROR;
	ASSERT (s_op3 = 782) REPORT "s_op3 not 782" SEVERITY ERROR;
	ASSERT (s_op4 = 41) REPORT "s_op4 not 41" SEVERITY ERROR;
	ASSERT (s_op2 = 2142) REPORT "s_op2 not 2142" SEVERITY ERROR;
	ASSERT (s_op5 = 32062) REPORT "s_op5 not 32062" SEVERITY ERROR;

	ASSERT (s_final_output = -29920) REPORT "Final result is not -29920" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 43;
	s_b <= 12;
	s_c <= -35;
	s_d <= 4;
	s_e <= 18;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 55) REPORT "s_op1 not 55" SEVERITY ERROR;
	ASSERT (s_op3 = -140) REPORT "s_op3 not -140" SEVERITY ERROR;
	ASSERT (s_op4 = 25) REPORT "s_op4 not 25" SEVERITY ERROR;
	ASSERT (s_op2 = 2310) REPORT "s_op2 not 2310" SEVERITY ERROR;
	ASSERT (s_op5 = -3500) REPORT "s_op5 not -3500" SEVERITY ERROR;

	ASSERT (s_final_output = 5810) REPORT "Final result is not 5810" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 47;
	s_b <= -10;
	s_c <= -38;
	s_d <= 20;
	s_e <= 9;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 37) REPORT "s_op1 not 37" SEVERITY ERROR;
	ASSERT (s_op3 = -760) REPORT "s_op3 not -760" SEVERITY ERROR;
	ASSERT (s_op4 = 38) REPORT "s_op4 not 38" SEVERITY ERROR;
	ASSERT (s_op2 = 1554) REPORT "s_op2 not 1554" SEVERITY ERROR;
	ASSERT (s_op5 = -28880) REPORT "s_op5 not -28880" SEVERITY ERROR;

	ASSERT (s_final_output = 30434) REPORT "Final result is not 30434" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 28;
	s_b <= 38;
	s_c <= -14;
	s_d <= 7;
	s_e <= -45;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 66) REPORT "s_op1 not 66" SEVERITY ERROR;
	ASSERT (s_op3 = -98) REPORT "s_op3 not -98" SEVERITY ERROR;
	ASSERT (s_op4 = 73) REPORT "s_op4 not 73" SEVERITY ERROR;
	ASSERT (s_op2 = 2772) REPORT "s_op2 not 2772" SEVERITY ERROR;
	ASSERT (s_op5 = -7154) REPORT "s_op5 not -7154" SEVERITY ERROR;

	ASSERT (s_final_output = 9926) REPORT "Final result is not 9926" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -6;
	s_b <= 4;
	s_c <= -15;
	s_d <= 41;
	s_e <= -14;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -2) REPORT "s_op1 not -2" SEVERITY ERROR;
	ASSERT (s_op3 = -615) REPORT "s_op3 not -615" SEVERITY ERROR;
	ASSERT (s_op4 = 8) REPORT "s_op4 not 8" SEVERITY ERROR;
	ASSERT (s_op2 = -84) REPORT "s_op2 not -84" SEVERITY ERROR;
	ASSERT (s_op5 = -4920) REPORT "s_op5 not -4920" SEVERITY ERROR;

	ASSERT (s_final_output = 4836) REPORT "Final result is not 4836" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 36;
	s_b <= 32;
	s_c <= -23;
	s_d <= -42;
	s_e <= 43;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 68) REPORT "s_op1 not 68" SEVERITY ERROR;
	ASSERT (s_op3 = 966) REPORT "s_op3 not 966" SEVERITY ERROR;
	ASSERT (s_op4 = -7) REPORT "s_op4 not -7" SEVERITY ERROR;
	ASSERT (s_op2 = 2856) REPORT "s_op2 not 2856" SEVERITY ERROR;
	ASSERT (s_op5 = -6762) REPORT "s_op5 not -6762" SEVERITY ERROR;

	ASSERT (s_final_output = 9618) REPORT "Final result is not 9618" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -21;
	s_b <= -39;
	s_c <= 47;
	s_d <= 28;
	s_e <= 3;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -60) REPORT "s_op1 not -60" SEVERITY ERROR;
	ASSERT (s_op3 = 1316) REPORT "s_op3 not 1316" SEVERITY ERROR;
	ASSERT (s_op4 = -24) REPORT "s_op4 not -24" SEVERITY ERROR;
	ASSERT (s_op2 = -2520) REPORT "s_op2 not -2520" SEVERITY ERROR;
	ASSERT (s_op5 = -31584) REPORT "s_op5 not -31584" SEVERITY ERROR;

	ASSERT (s_final_output = 29064) REPORT "Final result is not 29064" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= -21;
	s_b <= -21;
	s_c <= -34;
	s_d <= 34;
	s_e <= -36;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = -42) REPORT "s_op1 not -42" SEVERITY ERROR;
	ASSERT (s_op3 = -1156) REPORT "s_op3 not -1156" SEVERITY ERROR;
	ASSERT (s_op4 = 15) REPORT "s_op4 not 15" SEVERITY ERROR;
	ASSERT (s_op2 = -1764) REPORT "s_op2 not -1764" SEVERITY ERROR;
	ASSERT (s_op5 = -17340) REPORT "s_op5 not -17340" SEVERITY ERROR;

	ASSERT (s_final_output = 15576) REPORT "Final result is not 15576" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 28;
	s_b <= 35;
	s_c <= -40;
	s_d <= 24;
	s_e <= 29;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 63) REPORT "s_op1 not 63" SEVERITY ERROR;
	ASSERT (s_op3 = -960) REPORT "s_op3 not -960" SEVERITY ERROR;
	ASSERT (s_op4 = -1) REPORT "s_op4 not -1" SEVERITY ERROR;
	ASSERT (s_op2 = 2646) REPORT "s_op2 not 2646" SEVERITY ERROR;
	ASSERT (s_op5 = 960) REPORT "s_op5 not 960" SEVERITY ERROR;

	ASSERT (s_final_output = 1686) REPORT "Final result is not 1686" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";

	s_a <= 47;
	s_b <= -31;
	s_c <= 39;
	s_d <= -6;
	s_e <= 43;

	WAIT FOR 3 * clk_period;
	ASSERT (s_op1 = 16) REPORT "s_op1 not 16" SEVERITY ERROR;
	ASSERT (s_op3 = -234) REPORT "s_op3 not -234" SEVERITY ERROR;
	ASSERT (s_op4 = 4) REPORT "s_op4 not 4" SEVERITY ERROR;
	ASSERT (s_op2 = 672) REPORT "s_op2 not 672" SEVERITY ERROR;
	ASSERT (s_op5 = -936) REPORT "s_op5 not -936" SEVERITY ERROR;

	ASSERT (s_final_output = 1608) REPORT "Final result is not 1608" SEVERITY ERROR;
	REPORT "The value of 's_final_output' is " & integer'image(s_final_output);
	REPORT "***************************************************************";


	WAIT;
END PROCESS stim_process;
END;
