----------------------------------------------------------------------------------
-- Engineer:		Jaedyn Chilton
-- Create Date:		02:05:04 04/21/2022 
-- Module Name:		Main 
-- Project Name:	TicTakToe
-- Description:		It all comes together here
-- Comments: 		i love you
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port ( CLK : in  STD_LOGIC;
			BTN : in STD_LOGIC_VECTOR(8 downto 0);
			RESET : in STD_LOGIC;
			out1 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out2 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out3 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out4 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out5 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out6 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out7 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out8 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out9 : out	STD_LOGIC_VECTOR(1 downto 0) := "00";
			out_turn : out  STD_LOGIC_VECTOR(1 downto 0)) "10";
end Main;


architecture Behavioral of Main is

	-- set up components
	
	component Winner is
		port(	node1 : in STD_LOGIC_VECTOR(1 downto 0);
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
	end component;

	component Turns is
		port(	Rst		: in STD_LOGIC;
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
	end component;

	component LED is
		PORT(	Clk 	: in STD_LOGIC;
				Rst		: in STD_LOGIC;
				BtnLED	: in STD_LOGIC;
				A		: in STD_LOGIC;
				B		: in STD_LOGIC;
				LEDs	: out STD_LOGIC_VECTOR(1 downto 0);
				stat	: out STD_LOGIC_VECTOR(1 downto 0));
	end component;

	component DRAWTEST is
		PORT(	Clk		: in STD_LOGIC;
				Rst		: in STD_LOGIC;
				BTN_D	: in STD_LOGIC_VECTOR(8 downto 0);
				Draw	: out STD_LOGIC);
	end component;

	-- define temporary signals
	
	signal tBtn									: STD_LOGIC_VECTOR(8 downto 0) := "000000000";
	signal winA, winB, tied, drawn				: STD_LOGIC;
	signal team									: STD_LOGIC_VECTOR(1 downto 0) := "10";
	signal t1, t2, t3, t4, t5, t6, t7, t8, t9	: STD_LOGIC_VECTOR(1 downto 0) := "00";
	
	
begin
	
	-- assign ports to components
	
	OT1 : LED port map (CLK, RESET, tBtn(0), team(0), team(1), out1, t1);
	OT2 : LED port map (CLK, RESET, tBtn(1), team(0), team(1), out2, t2);
	OT3 : LED port map (CLK, RESET, tBtn(2), team(0), team(1), out3, t3);
	OT4 : LED port map (CLK, RESET, tBtn(3), team(0), team(1), out4, t4);
	OT5 : LED port map (CLK, RESET, tBtn(4), team(0), team(1), out5, t5);
	OT6 : LED port map (CLK, RESET, tBtn(5), team(0), team(1), out6, t6);
	OT7 : LED port map (CLK, RESET, tBtn(6), team(0), team(1), out7, t7);
	OT8 : LED port map (CLK, RESET, tBtn(7), team(0), team(1), out8, t8);
	OT9 : LED port map (CLK, RESET, tBtn(8), team(0), team(1), out9, t9);
	
	TURNTRACK : Turns port map (RESET, t1, t2, t3, t4, t5, t6, t7, t8, t9, team);
	
	WIN : Winner port map (t1, t2, t3, t4, t5, t6, t7, t8, t9, winA, winB, tied);
	
	DRAWWOW : DRAWTEST port map (CLK, RESET, tBtn, drawn);
	
	process(team, BTN, CLK) is
	begin
		if(rising_edge(CLK)) then
			-- reset game behaviour
			if (tied = '0' OR drawn = '1') then
				tBtn <= "000000000";
			-- normal game behaviour
			else
				tBtn(0) <= BTN(0);
				tBtn(1) <= BTN(1);
				tBtn(2) <= BTN(2);
				tBtn(3) <= BTN(3);
				tBtn(4) <= BTN(4);
				tBtn(5) <= BTN(5);
				tBtn(6) <= BTN(6);
				tBtn(7) <= BTN(7);
				tBtn(8) <= BTN(8);
			end if;
		end if;
		out_turn <= team;
	end process;

	
end Behavioral;

