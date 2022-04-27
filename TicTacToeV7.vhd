----------------------------------------------------------------------------------
-- Engineer: 		Jaedyn Chilton
-- Create Date:    	03:15 04/27/2022
-- Project Name: 	TicTacToeV7
-- Target Devices: 	CoolRunner II
-- Description:    	VHDL is fun-ish
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;


entity TicTacToeV7 is
port( 	CLK			: in std_logic;
		BTN			: in std_logic_vector(8 downto 0);
		RST			: in std_logic;
		player_o	: out std_logic;
		n1 			: out std_logic_vector(1 downto 0) := "00";
		n2 			: out std_logic_vector(1 downto 0) := "00";
		n3 			: out std_logic_vector(1 downto 0) := "00";
		n4 			: out std_logic_vector(1 downto 0) := "00";
		n5 			: out std_logic_vector(1 downto 0) := "00";
		n6 			: out std_logic_vector(1 downto 0) := "00";
		n7 			: out std_logic_vector(1 downto 0) := "00";
		n8 			: out std_logic_vector(1 downto 0) := "00";
		n9 			: out std_logic_vector(1 downto 0) := "00";
		seg			: out std_logic_vector(5 downto 0) := "000000";
		oEND		: out std_logic_vector(5 downto 0) := "000000";
		c			: out std_logic;
		a			: out std_logic);
end TicTacToeV7;

architecture Behavioral of TicTacToeV7 is
	signal enable		: std_logic_vector(8 downto 0) := "111111111";
	signal player		: std_logic := '0';
	signal tn1 			: std_logic_vector(1 downto 0) := "00";
	signal tn2 			: std_logic_vector(1 downto 0) := "00";
	signal tn3 			: std_logic_vector(1 downto 0) := "00";
	signal tn4 			: std_logic_vector(1 downto 0) := "00";
	signal tn5 			: std_logic_vector(1 downto 0) := "00";
	signal tn6 			: std_logic_vector(1 downto 0) := "00";
	signal tn7 			: std_logic_vector(1 downto 0) := "00";
	signal tn8 			: std_logic_vector(1 downto 0) := "00";
	signal tn9 			: std_logic_vector(1 downto 0) := "00";
	signal end_signal	: std_logic_vector(5 downto 0) := "000000";
	signal o1			: std_logic_vector(1 downto 0) := "00";
	signal o2			: std_logic_vector(1 downto 0) := "00";
	signal o3			: std_logic_vector(1 downto 0) := "00";
	signal o4			: std_logic_vector(1 downto 0) := "00";
	signal o5			: std_logic_vector(1 downto 0) := "00";
	signal o6			: std_logic_vector(1 downto 0) := "00";
	signal o7			: std_logic_vector(1 downto 0) := "00";
	signal o8			: std_logic_vector(1 downto 0) := "00";
	signal o9			: std_logic_vector(1 downto 0) := "00";
	signal clk_count	: std_logic_vector(24 downto 0) := "0000000000000000000000000";
	signal animating	: std_logic := '0';
begin

	player <= enable(0) XOR enable(1) XOR enable(2) XOR enable(3) XOR enable(4) XOR enable(5) XOR enable(6) XOR enable(7) XOR enable(8);
	
		c <= BTN(1);

	-- GAME BOARD ACTIVITY

	process(CLK,BTN(0), RST) is
	begin
		if(rising_edge(BTN(0))) then
			if(enable(0) = '1') then
				if(player = '0') then
					tn1(0) <= '1';
				elsif(player = '1') then
					tn1(1) <= '1';
				end if;
				enable(0) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn1 <= "00";
			enable(0) <= '1';
		end if;
	end process;

	process(CLK, BTN(1), RST) is
	begin
		if(rising_edge(BTN(1))) then
			if(enable(1) = '1') then
				if(player = '0') then
					tn2(0) <= '1';
				elsif(player = '1') then
					tn2(1) <= '1';
				end if;
				enable(1) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn2 <= "00";
			enable(1) <= '1';
		end if;
	end process;

	process(CLK, BTN(2), RST) is
	begin
		if(rising_edge(BTN(2))) then
			if(enable(2) = '1') then
				if(player = '0') then
					tn3(0) <= '1';
				elsif(player = '1') then
					tn3(1) <= '1';
				end if;
				enable(2) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn3 <= "00";
			enable(2) <= '1';
		end if;
	end process;

	process(CLK, BTN(3), RST) is
	begin
		if(rising_edge(BTN(3))) then
			if(enable(3) = '1') then
				if(player = '0') then
					tn4(0) <= '1';
				elsif(player = '1') then
					tn4(1) <= '1';
				end if;
				enable(3) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn4 <= "00";
			enable(3) <= '1';
		end if;
	end process;

	process(CLK, BTN(4), RST) is
	begin
		if(rising_edge(BTN(4))) then
			if(enable(4) = '1') then
				if(player = '0') then
					tn5(0) <= '1';
				elsif(player = '1') then
					tn5(1) <= '1';
				end if;
				enable(4) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn5 <= "00";
			enable(4) <= '1';
		end if;
	end process;

	process(CLK, BTN(5), RST) is
	begin
		if(rising_edge(BTN(5))) then
			if(enable(5) = '1') then
				if(player = '0') then
					tn6(0) <= '1';
				elsif(player = '1') then
					tn6(1) <= '1';
				end if;
				enable(5) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn6 <= "00";
			enable(5) <= '1';
		end if;
	end process;

	process(CLK, BTN(6), RST) is
	begin
		if(rising_edge(BTN(6))) then
			if(enable(6) = '1') then
				if(player = '0') then
					tn7(0) <= '1';
				elsif(player = '1') then
					tn7(1) <= '1';
				end if;
				enable(6) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn7 <= "00";
			enable(6) <= '1';
		end if;
	end process;

	process(CLK, BTN(7), RST) is
	begin
		if(rising_edge(BTN(7))) then
			if(enable(7) = '1') then
				if(player = '0') then
					tn8(0) <= '1';
				elsif(player = '1') then
					tn8(1) <= '1';
				end if;
				enable(7) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn8 <= "00";
			enable(7) <= '1';
		end if;
	end process;

	process(CLK, BTN(8), RST) is
	begin
		if(rising_edge(BTN(8))) then
			if(enable(8) = '1') then
				if(player = '0') then
					tn9(0) <= '1';
				elsif(player = '1') then
					tn9(1) <= '1';
				end if;
				enable(8) <= '0';
			end if;
		end if;
		
		if(RST = '1') then
			tn9 <= "00";
			enable(8) <= '1';
		end if;
	end process;
	
	-- WIN TEST
	
	process(CLK, tn1, tn2, tn3, tn4, tn5, tn6, tn7, tn8, tn9, enable) is
	begin
		
		-- PLAYER 0 CONDITION
		
		-- HORIZONTAL
		if (tn1(0) = '1' AND tn2(0) = '1' AND tn3(0) = '1') then
			END_SIGNAL <= "101000";
		elsif(tn4(0) = '1' AND tn5(0) = '1' AND tn6(0) = '1') then
			END_SIGNAL <= "101001";
		elsif(tn7(0) = '1' AND tn8(0) = '1' AND tn9(0) = '1') then
			END_SIGNAL <= "101010";
		-- VERTICAL
		elsif(tn1(0) = '1' AND tn4(0) = '1' AND tn7(0) = '1') then
			END_SIGNAL <= "101011";
		elsif(tn2(0) = '1' AND tn5(0) = '1' AND tn8(0) = '1') then
			END_SIGNAL <= "101100";
		elsif(tn3(0) = '1' AND tn6(0) = '1' AND tn9(0) = '1') then
			END_SIGNAL <= "101101";
		-- DIAGONAL
		elsif(tn1(0) = '1' AND tn5(0) = '1' AND tn9(0) = '1') then
			END_SIGNAL <= "101110";
		elsif(tn3(0) = '1' AND tn5(0) = '1' AND tn7(0) = '1') then
			END_SIGNAL <= "101111";
		
		-- PLAYER 1 CONDITION
		
		-- HORIZONTAL
		elsif(tn1(1) = '1' AND tn2(1) = '1' AND tn3(1) = '1') then
			END_SIGNAL <= "011000";
		elsif(tn4(1) = '1' AND tn5(1) = '1' AND tn6(1) = '1') then
			END_SIGNAL <= "011001";
		elsif(tn7(1) = '1' AND tn8(1) = '1' AND tn9(1) = '1') then
			END_SIGNAL <= "011010";
		-- VERTICAL
		elsif(tn1(1) = '1' AND tn4(1) = '1' AND tn7(1) = '1') then
			END_SIGNAL <= "011011";
		elsif(tn2(1) = '1' AND tn5(1) = '1' AND tn8(1) = '1') then
			END_SIGNAL <= "011100";
		elsif(tn3(1) = '1' AND tn6(1) = '1' AND tn9(1) = '1') then
			END_SIGNAL <= "011101";
		-- DIAGONAL
		elsif(tn1(1) = '1' AND tn5(1) = '1' AND tn9(1) = '1') then
			END_SIGNAL <= "011110";
		elsif(tn3(1) = '1' AND tn5(1) = '1' AND tn7(1) = '1') then
			END_SIGNAL <= "011111";
		
		
		-- TIED CONDITION
		elsif(enable(0) = '0' AND enable(1) = '0' AND enable(2) = '0' AND enable(3) = '0' AND enable(4) = '0' AND enable(5) = '0' AND enable(6) = '0' AND enable(7) = '0' AND enable(8) = '0') then
			END_SIGNAL <= "001000";
			
			
		-- GAME NOT DONE CONDITION
		else
			END_SIGNAL <= "000000";
		end if;
		
	end process;
	
	-- ANIMATE END OF GAME
	
	process(CLK, RST, BTN) is
	begin
		
		if (end_signal(3) = '1') then
				--player 0
			if(end_signal = "101000") then
				o1 <= "01";
				o2 <= "01";
				o3 <= "01";
				o4 <= "00";
				o5 <= "00";
				o6 <= "00";
				o7 <= "00";
				o8 <= "00";
				o9 <= "00";
			elsif(end_signal = "101001") then
				o1 <= "00";
				o2 <= "00";
				o3 <= "00";
				o4 <= "01";
				o5 <= "01";
				o6 <= "01";
				o7 <= "00";
				o8 <= "00";
				o9 <= "00";
			elsif(end_signal = "101010") then
				o1 <= "00";
				o2 <= "00";
				o3 <= "00";
				o4 <= "00";
				o5 <= "00";
				o6 <= "00";
				o7 <= "01";
				o8 <= "01";
				o9 <= "01";
			elsif(end_signal = "101011") then
				o1 <= "01";
				o2 <= "00";
				o3 <= "00";
				o4 <= "01";
				o5 <= "00";
				o6 <= "00";
				o7 <= "01";
				o8 <= "00";
				o9 <= "00";
			elsif(end_signal = "101100") then
				o1 <= "00";
				o2 <= "01";
				o3 <= "00";
				o4 <= "00";
				o5 <= "01";
				o6 <= "00";
				o7 <= "00";
				o8 <= "01";
				o9 <= "00";
			elsif(end_signal = "101101") then
				o1 <= "00";
				o2 <= "00";
				o3 <= "01";
				o4 <= "00";
				o5 <= "00";
				o6 <= "01";
				o7 <= "00";
				o8 <= "00";
				o9 <= "01";
			elsif(end_signal = "101110") then
				o1 <= "01";
				o2 <= "00";
				o3 <= "00";
				o4 <= "00";
				o5 <= "01";
				o6 <= "00";
				o7 <= "00";
				o8 <= "00";
				o9 <= "01";
			elsif(end_signal = "101111") then
				o1 <= "00";
				o2 <= "00";
				o3 <= "01";
				o4 <= "00";
				o5 <= "01";
				o6 <= "00";
				o7 <= "01";
				o8 <= "00";
				o9 <= "00";
				
				--player 1
			elsif(end_signal = "011000") then
				o1 <= "10";
				o2 <= "10";
				o3 <= "10";
				o4 <= "00";
				o5 <= "00";
				o6 <= "00";
				o7 <= "00";
				o8 <= "00";
				o9 <= "00";
			elsif(end_signal = "011001") then
				o1 <= "00";
				o2 <= "00";
				o3 <= "00";
				o4 <= "10";
				o5 <= "10";
				o6 <= "10";
				o7 <= "00";
				o8 <= "00";
				o9 <= "00";
			elsif(end_signal = "011010") then
				o1 <= "00";
				o2 <= "00";
				o3 <= "00";
				o4 <= "00";
				o5 <= "00";
				o6 <= "00";
				o7 <= "10";
				o8 <= "10";
				o9 <= "10";
			elsif(end_signal = "011011") then
				o1 <= "10";
				o2 <= "00";
				o3 <= "00";
				o4 <= "10";
				o5 <= "00";
				o6 <= "00";
				o7 <= "10";
				o8 <= "00";
				o9 <= "00";
			elsif(end_signal = "011100") then
				o1 <= "00";
				o2 <= "10";
				o3 <= "00";
				o4 <= "00";
				o5 <= "10";
				o6 <= "00";
				o7 <= "00";
				o8 <= "10";
				o9 <= "00";
			elsif(end_signal = "011101") then
				o1 <= "00";
				o2 <= "00";
				o3 <= "10";
				o4 <= "00";
				o5 <= "00";
				o6 <= "10";
				o7 <= "00";
				o8 <= "00";
				o9 <= "10";
			elsif(end_signal = "011110") then
				o1 <= "10";
				o2 <= "00";
				o3 <= "00";
				o4 <= "00";
				o5 <= "10";
				o6 <= "00";
				o7 <= "00";
				o8 <= "00";
				o9 <= "10";
			elsif(end_signal = "011111") then
				o1 <= "01";
				o2 <= "01";
				o3 <= "11";
				o4 <= "01";
				o5 <= "11";
				o6 <= "01";
				o7 <= "11";
				o8 <= "01";
				o9 <= "01";
				
				--tied
			elsif(end_signal = "001000") then
				o1 <= "11";
				o2 <= "11";
				o3 <= "11";
				o4 <= "11";
				o5 <= "11";
				o6 <= "11";
				o7 <= "11";
				o8 <= "11";
				o9 <= "11";
			end if;
			
			animating <= '1';
		end if;
		
		if(RST = '1') then
			animating <= '0';
		end if;
		
	end process;
	
	-- SWITCH DISPLAY MODES
	
	process(BTN, animating, RST) is
	begin
		if(animating = '0') then
			n1 <= tn1;
			n2 <= tn2;
			n3 <= tn3;
			n4 <= tn4;
			n5 <= tn5;
			n6 <= tn6;
			n7 <= tn7;
			n8 <= tn8;
			n9 <= tn9;
		else
			n1 <= o1;
			n2 <= o2;
			n3 <= o3;
			n4 <= o4;
			n5 <= o5;
			n6 <= o6;
			n7 <= o7;
			n8 <= o8;
			n9 <= o9;
		end if;
	end process;
	
	a <= animating;
	
	process(CLK) is
	begin
		seg(0) <= end_signal(0);
		seg(1) <= end_signal(1);
		seg(2) <= end_signal(2);
		seg(3) <= end_signal(3);
		seg(4) <= end_signal(4);
		seg(5) <= end_signal(5);
	end process;
	
	oEND <= END_SIGNAL;

end Behavioral;

