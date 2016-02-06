library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity pipeline is
port (clk : in std_logic;
	  a, b, c, d, e : in integer;
	  op1, op2, op3, op4, op5, final_output : out integer
  );
end pipeline;

architecture behavioral of pipeline is

signal i_op1, i_op2, i_op3, i_op4, i_op5 : integer := 0;


begin
	-- todo: complete this

	op1 <= i_op1;
	op2 <= i_op2;
	op3 <= i_op3;
	op4 <= i_op4;
	op5 <= i_op5;
	
	process (clk)
	begin
		if rising_edge(clk) then
			i_op1 <= a + b;
			i_op2 <= i_op1 * 42;
			i_op3 <= c * d;
			i_op4 <= a - e;
			i_op5 <= i_op3 * i_op4;
			final_output <= i_op2 - i_op5;
		end if;
	end process;

end behavioral;