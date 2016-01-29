LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY fsm_tb IS
END fsm_tb;

ARCHITECTURE behaviour OF fsm_tb IS

COMPONENT comments_fsm IS
PORT (clk : in std_logic;
      reset : in std_logic;
      input : in std_logic_vector(7 downto 0);
      output : out std_logic
  );
END COMPONENT;

--The input signals with their initial values
SIGNAL clk, s_reset, s_output: STD_LOGIC := '0';
SIGNAL s_input: std_logic_vector(7 downto 0) := (others => '0');

CONSTANT clk_period : time := 1 ns;
CONSTANT SLASH_CHARACTER : std_logic_vector(7 downto 0) := "00101111";
CONSTANT STAR_CHARACTER : std_logic_vector(7 downto 0) := "00101010";
CONSTANT NEW_LINE_CHARACTER : std_logic_vector(7 downto 0) := "00001010";

---------------------------------------------------------------------------------------

--/*AA*/
--//BB
--type T_DATA is array (0 to 10) of std_logic_vector(7 downto 0);
--constant DATA : T_DATA :=
--	("00101111","00101010","01000001","01000001","00101010","00101111","00001010","00101111","00101111","01000010","01000010");
--
--type T_RESULT is array (0 to 10) of STD_LOGIC;
--constant RESULT : T_RESULT :=
--	('0','0','1','1','1','1','0','0','0','1','1');


--//CC
--type T_DATA is array (0 to 3) of std_logic_vector(7 downto 0);
--constant DATA : T_DATA :=
--	("00101111","00101111","01000011","01000011");
--
--type T_RESULT is array (0 to 3) of STD_LOGIC;
--constant RESULT : T_RESULT :=
--	('0','0','1','1');


--//CC
--//DD
--type T_DATA is array (0 to 8) of std_logic_vector(7 downto 0);
--constant DATA : T_DATA :=
--	("00101111","00101111","01000011","01000011","00001010","00101111","00101111","01000100","01000100");
--
--type T_RESULT is array (0 to 8) of STD_LOGIC;
--constant RESULT : T_RESULT :=
--	('0','0','1','1','1','0','0','1','1');


--//CC
--/*****/
--type T_DATA is array (0 to 11) of std_logic_vector(7 downto 0);
--constant DATA : T_DATA :=
--	("00101111","00101111","01000011","01000011","00001010","00101111","00101010","00101010","00101010","00101010","00101010","00101111");
--
--type T_RESULT is array (0 to 11) of STD_LOGIC;
--constant RESULT : T_RESULT :=
--	('0','0','1','1','1','0','0','1','1','1','1','1');


----/*//*/ ;//C
--type T_DATA is array (0 to 10) of std_logic_vector(7 downto 0);
--constant DATA : T_DATA :=
--	("00101111","00101010","00101111","00101111","00101010","00101111","00100000","00111011","00101111","00101111","01000011");
--
--type T_RESULT is array (0 to 10) of STD_LOGIC;
--constant RESULT : T_RESULT :=
--	('0','0','1','1','1','1','0','0','0','0','1');



--/*
--* XXX
--*/
--/*AAA*///BBB
--/*CCC*/void main(){/*DDD*/} //E/E/E//
--void test(){
--	/*//*/ ;//Comment
--}
--//FFF
type T_DATA is array (0 to 101) of std_logic_vector(7 downto 0);
constant DATA : T_DATA :=
	("00101111","00101010","00001010","00101010","00100000","01011000","01011000","01011000","00001010","00101010","00101111","00001010","00101111","00101010","01000001","01000001","01000001","00101010","00101111","00101111","00101111","01000010","01000010","01000010","00001010","00101111","00101010","01000011","01000011","01000011","00101010","00101111","01110110","01101111","01101001","01100100","00100000","01101101","01100001","01101001","01101110","00101000","00101001","01111011","00101111","00101010","01000100","01000100","01000100","00101010","00101111","01111101","00100000","00101111","00101111","01000101","00101111","01000101","00101111","01000101","00101111","00101111","00001010","01110110","01101111","01101001","01100100","00100000","01110100","01100101","01110011","01110100","00101000","00101001","01111011","00001010","00001001","00101111","00101010","00101111","00101111","00101010","00101111","00100000","00111011","00101111","00101111","01000011","01101111","01101101","01101101","01100101","01101110","01110100","00001010","01111101","00001010","00101111","00101111","01000110","01000110","01000110");

type T_RESULT is array (0 to 101) of STD_LOGIC;
constant RESULT : T_RESULT :=
	('0','0','1','1','1','1','1','1','1','1','1','0','0','0','1','1','1','1','1','0','0','1','1','1','1','0','0','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','1','1','0','0','0','0','1','1','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','1','0','0','0','0','1','1','1','1','1','1','1','1','0','0','0','0','1','1','1');



---------------------------------------------------------------------------------------

BEGIN
dut: comments_fsm
PORT MAP(clk, s_reset, s_input, s_output);

 --clock process
clk_process : PROCESS
BEGIN
	clk <= '0';
	WAIT FOR clk_period/2;
	clk <= '1';
	WAIT FOR clk_period/2;
END PROCESS;
 
--TODO: Thoroughly test your FSM
stim_process: PROCESS
BEGIN

	for i in DATA'range loop
		--s_input <= "01011000";
		s_input <= DATA(i);

		WAIT FOR 1 * clk_period;
		--ASSERT (s_output = '0') REPORT "When reading a meaningless character, the output should be '0'" SEVERITY ERROR;
		--REPORT "***************************************************************";
		if s_output = RESULT(i) then
		else
			REPORT "---------------------------------------------------------------------------------->Failure. Mismatched result..." SEVERITY ERROR;
		end if;
	end loop;
	REPORT "DONE";
	WAIT;


END PROCESS stim_process;
END;
