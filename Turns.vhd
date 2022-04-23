----------------------------------------------------------------------------------
-- Engineer:		Jaedyn Chilton
-- Create Date:		02:05:04 04/21/2022 
-- Module Name:		Turn
-- Project Name:	TicTakToe
-- Description:		Tracks which player's turn it is currently w/ XOR gates
----------------------------------------------------------------------------------
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Turns IS
	PORT(	Rst		: in STD_LOGIC;
			s1		: in STD_LOGIC_VECTOR(1 downto 0);
			s2		: in STD_LOGIC_VECTOR(1 downto 0);
			s3		: in STD_LOGIC_VECTOR(1 downto 0);
			s4		: in STD_LOGIC_VECTOR(1 downto 0);
			s5		: in STD_LOGIC_VECTOR(1 downto 0);
			s6		: in STD_LOGIC_VECTOR(1 downto 0);
			s7		: in STD_LOGIC_VECTOR(1 downto 0);
			s8		: in STD_LOGIC_VECTOR(1 downto 0);
			s9		: in STD_LOGIC_VECTOR(1 downto 0);
			Turn	: out STD_LOGIC_VECTOR(1 downto 0));
END Turns;

ARCHITECTURE Behavioral OF Turns IS
	signal temp : STD_LOGIC_VECTOR(8 downto 0);
	signal result : STD_LOGIC;

BEGIN
	
	-- even number of plays means player A, odd is player B
	-- so XOR all stored values for team value
	
	-- broken up to fit on screen and be read-able
	temp(0) <= s1(0) XOR s1(1);
	temp(1) <= s2(0) XOR s2(1);
	temp(2) <= s3(0) XOR s3(1);
	temp(3) <= s4(0) XOR s4(1);
	temp(4) <= s5(0) XOR s5(1);
	temp(5) <= s6(0) XOR s6(1);
	temp(6) <= s7(0) XOR s7(1);
	temp(7) <= s8(0) XOR s8(1);
	temp(8) <= s9(0) XOR s9(1);
	
	result <= temp(0) XOR temp(1) XOR temp(2) XOR temp(3) XOR temp(4) XOR temp(5) XOR temp(6) XOR temp(7) XOR temp(8);
	
	Turn(0) <= result;
	Turn(1) <= not(result);
	
END Behavioral;