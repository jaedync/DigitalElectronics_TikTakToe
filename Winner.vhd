----------------------------------------------------------------------------------
-- Engineer:		Jaedyn Chilton
-- Create Date:		02:05:04 04/21/2022 
-- Module Name:		Winner
-- Project Name:	TicTakToe
-- Description:		Tests for Win / Tie for game board
----------------------------------------------------------------------------------
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Winner IS
	PORT(	node1 : in STD_LOGIC_VECTOR(1 downto 0);
			node2 : in STD_LOGIC_VECTOR(1 downto 0);
			node3 : in STD_LOGIC_VECTOR(1 downto 0);
			node4 : in STD_LOGIC_VECTOR(1 downto 0);
			node5 : in STD_LOGIC_VECTOR(1 downto 0);
			node6 : in STD_LOGIC_VECTOR(1 downto 0);
			node7 : in STD_LOGIC_VECTOR(1 downto 0);
			node8 : in STD_LOGIC_VECTOR(1 downto 0);
			node9 : in STD_LOGIC_VECTOR(1 downto 0);
			WinA : out STD_LOGIC;
			WinB : out STD_LOGIC;
			Tied : out STD_LOGIC);
END Winner;

ARCHITECTURE Behavioral OF Winner IS
	signal t1, t2, t3, t4, t5, t6, t7, t8, t9 : STD_LOGIC_VECTOR(1 downto 0);
	signal A, B, T : STD_LOGIC;

BEGIN
	
	-- map signals to inputs
	
	t1 <= node1;
	t2 <= node2;
	t3 <= node3;
	t4 <= node4;
	t5 <= node5;
	t6 <= node6;
	t7 <= node7;
	t8 <= node8;
	t9 <= node9;
	
	-- map outputs to signals
	
	Tied <= T;
	WinA <= A;
	WinB <= B;
	
	-- Win Condition Test Process
	
	process(t1, t2, t3, t4, t5, t6, t7, t8, t9) is
	begin
		
		-- Player A Win Conditions
		
		-- Horizontal
		if    ( t1(1) = '1' AND t2(1) = '1' AND t3(1) = '1' ) then
			A <= '1';
		elsif ( t4(1) = '1' AND t5(1) = '1' AND t6(1) = '1' ) then
			A <= '1';
		elsif ( t7(1) = '1' AND t8(1) = '1' AND t9(1) = '1' ) then
			A <= '1';
		-- Vertical
		elsif ( t1(1) = '1' AND t4(1) = '1' AND t7(1) = '1' ) then
			A <= '1';
		elsif ( t2(1) = '1' AND t5(1) = '1' AND t8(1) = '1' ) then
			A <= '1';
		elsif ( t3(1) = '1' AND t6(1) = '1' AND t9(1) = '1' ) then
			A <= '1';
		-- Diagonals
		elsif ( t1(1) = '1' AND t5(1) = '1' AND t9(1) = '1' ) then
			A <= '1';
		elsif ( t3(1) = '1' AND t5(1) = '1' AND t7(1) = '1' ) then
			A <= '1';
		-- Not A Condition
		else
			A <= '1';
		end if;
		
		
		-- Player B Win Conditions
		
		-- Horizontal
		if    ( t1(0) = '1' AND t2(0) = '1' AND t3(0) = '1' ) then
			B <= '1';
		elsif ( t4(0) = '1' AND t5(0) = '1' AND t6(0) = '1' ) then
			B <= '1';
		elsif ( t7(0) = '1' AND t8(0) = '1' AND t9(0) = '1' ) then
			B <= '1';
		-- Vertical
		elsif ( t1(0) = '1' AND t4(0) = '1' AND t7(0) = '1' ) then
			B <= '1';
		elsif ( t2(0) = '1' AND t5(0) = '1' AND t8(0) = '1' ) then
			B <= '1';
		elsif ( t3(0) = '1' AND t6(0) = '1' AND t9(0) = '1' ) then
			B <= '1';
		-- Diagonals
		elsif ( t1(0) = '1' AND t5(0) = '1' AND t9(0) = '1' ) then
			B <= '1';
		elsif ( t3(0) = '1' AND t5(0) = '1' AND t7(0) = '1' ) then
			B <= '1';
		-- Not B Condition
		else
			B <= '0';
		end if;
	
	end process;
		
	-- Tie Condition Test Process
	
	process (A, B) is
	begin
		if (A = '0' and B = '0') then
			T <= '1';
		else
			T <= '0';
		end if;
	end process;
		
		
END Behavioral;