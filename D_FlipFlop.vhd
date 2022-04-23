----------------------------------------------------------------------------------
-- Engineer:		Jaedyn Chilton
-- Create Date:		02:05:04 04/21/2022 
-- Module Name:		D Flip Flop
-- Project Name:	TicTakToe
-- Description:		Does D Flip Flop things :)
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY D_FlipFlop IS
	PORT (Clock	: in std_logic;
			Reset	: in std_logic;
			Enable: in std_logic;
			D 		: in std_logic;
			Q 		: out std_logic);
END D_FlipFlop;

ARCHITECTURE Behavioral OF D_FlipFlop IS
BEGIN

	process (Clock, Reset, Enable, D) is
	BEGIN
		if (rising_edge(Clock)) then
			if (Enable = '1') then
				Q <= D;
			end if;
			if (reset = '1') then
				Q <= '0';
			end if;
		end if;

	end process;

end Behavioral;