----------------------------------------------------------------------------------
-- Engineer:		Jaedyn Chilton
-- Create Date:		02:05:04 04/21/2022 
-- Module Name:		LED
-- Project Name:	TicTakToe
-- Description:		Makes pretty lights for all to see
----------------------------------------------------------------------------------

LIBRARY ieee;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY LED IS
	PORT(	Clk 	: in STD_LOGIC;
			Rst		: in STD_LOGIC;
			BtnLED	: in STD_LOGIC;
			A		: in STD_LOGIC;
			B		: in STD_LOGIC;
			LEDs	: out STD_LOGIC_VECTOR(1 downto 0);
			stat	: out STD_LOGIC_VECTOR(1 downto 0));
END LED;

ARCHITECTURE arc OF LED IS
	signal tA, tB : STD_LOGIC;
	component D_FlipFlop is
		port (	Clock	: in std_logic;
				Reset	: in std_logic;
				Enable: in std_logic;
				D 		: in std_logic;
				Q 		: out std_logic);
	end component;

BEGIN

	-- Uses D_FF to remember output for LEDS
	D_FF_A : D_FlipFlop  port map(Clk, Rst, BtnLED, A, tA);
	D_FF_B : D_FlipFlop  port map(Clk, Rst, BtnLED, B, tB);


	-- Maps outputs to signals
	LEDs(0) <= not(tA);
	LEDs(1) <= not(tB);
	stat(0) <= tA;
	stat(1) <= tB;

END arc;