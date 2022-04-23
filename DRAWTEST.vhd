----------------------------------------------------------------------------------
-- Engineer:		Jaedyn Chilton
-- Create Date:		02:05:04 04/21/2022 
-- Module Name:		DRAWTEST
-- Project Name:	TicTakToe
-- Description:		test for draw condition
----------------------------------------------------------------------------------
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DRAWTEST IS
	PORT(	Clk		: in STD_LOGIC;
			Rst		: in STD_LOGIC;
			BTN_D	: in STD_LOGIC_VECTOR(8 downto 0);
			Draw	: out STD_LOGIC);
END DRAWTEST;

ARCHITECTURE Behavioral OF DRAWTEST IS
	signal b1, b2, b3, b4, b5, b6, b7, b8, b9 : STD_LOGIC;
	component D_FlipFlop is
		port (	Clock	: in std_logic;
				Reset	: in std_logic;
				Enable: in std_logic;
				D 		: in std_logic;
				Q 		: out std_logic);
	end component;

BEGIN
	
	-- track every button press during the current turn
	D_FF_Draw1 : D_FlipFlop port map(Clk, Rst, BTN_D(0), '1', b1);
	D_FF_Draw2 : D_FlipFlop port map(Clk, Rst, BTN_D(1), '1', b2);
	D_FF_Draw3 : D_FlipFlop port map(Clk, Rst, BTN_D(2), '1', b3);
	D_FF_Draw4 : D_FlipFlop port map(Clk, Rst, BTN_D(3), '1', b3);
	D_FF_Draw5 : D_FlipFlop port map(Clk, Rst, BTN_D(4), '1', b5);
	D_FF_Draw6 : D_FlipFlop port map(Clk, Rst, BTN_D(5), '1', b6);
	D_FF_Draw7 : D_FlipFlop port map(Clk, Rst, BTN_D(6), '1', b7);
	D_FF_Draw8 : D_FlipFlop port map(Clk, Rst, BTN_D(7), '1', b8);
	D_FF_Draw9 : D_FlipFlop port map(Clk, Rst, BTN_D(8), '1', b9);
	
	-- Flag draw possibility when all buttons have been pressed
	Draw <= b1 AND b2 AND b3 AND b4 AND b5 AND b6 AND b7 AND b8 AND b9;
	
END Behavioral;