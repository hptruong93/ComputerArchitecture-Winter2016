library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Do not modify the port map of this structure
entity comments_fsm is
port (clk : in std_logic;
      reset : in std_logic;
      input : in std_logic_vector(7 downto 0);
      output : out std_logic
  );
end comments_fsm;

architecture behavioral of comments_fsm is

-- The ASCII value for the '/', '*' and end-of-line characters
constant SLASH_CHARACTER : std_logic_vector(7 downto 0) := "00101111";
constant STAR_CHARACTER : std_logic_vector(7 downto 0) := "00101010";
constant NEW_LINE_CHARACTER : std_logic_vector(7 downto 0) := "00001010";

type state is (A, B, C, D, E);
-- A: waiting for delimiter
-- B: encountered first slash
-- C: comment single line
-- D: comment multiple lines
-- E: waiting for slash to end multiple lines comment
signal current_state : state;

begin

-- Insert your processes here
process (clk, reset)
begin
    if reset = '1' then
        current_state <= A;
        output <= '0';  
    elsif clk = '1' and Clk'event then
        if current_state = A then
            if input = SLASH_CHARACTER then
                current_state <= B;
            end if;
            output <= '0';
        elsif current_state = B then
            if input = SLASH_CHARACTER then
                current_state <= C;
            elsif input = STAR_CHARACTER then
                current_state <= D;
            else
                current_state <= A;
            end if;
            output <= '0';
        elsif current_state = C then
            if input = NEW_LINE_CHARACTER then
                current_state <= A;
            end if;
            output <= '1';
        elsif current_state = D then
            if input = STAR_CHARACTER then
                current_state <= E;
            end if;
            output <= '1';
        elsif current_state = E then
            if input = STAR_CHARACTER then
            elsif input = SLASH_CHARACTER then
                current_state <= A;
            else
                current_state <= D;
            end if;
            output <= '1';
        end if;
    end if;
    
end process;

end behavioral;