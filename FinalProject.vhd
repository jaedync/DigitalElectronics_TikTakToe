LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tiktaktoe IS
PORT(
	trig1, trig2, trig3, trig4, trig5, trig6, trig7, trig8, trig9: IN std_logic;
	out1a, out1b, out2a, out2b, out3a, out3b, out4a, out4b, out5a, out5b, out6a, out6b, out7a, out7b, out8a, out8b, out9a, out9b: OUT std_logic);
END tiktaktoe;

ARCHITECTURE arc OF tiktaktoe IS
signal stat1a, stat1b, stat2a, stat2b, stat3a, stat3b, stat4a, stat4b, stat5a, stat5b, stat6a, stat6b, stat7a, stat7b, stat8a, stat8b, stat9a, stat9b : std_ulogic := '0';
signal set1a, set1b, set2a, set2b, set3a, set3b, set4a, set4b, set5a, set5b, set6a, set6b, set7a, set7b, set8a, set8b, set9a, set9b : std_ulogic := '0';
signal done1, done2, done3, done4, done5, done6, done7, done8, done9: std_ulogic := '0';
signal wina, winb, checkwin, drawgame, reset, dispmode, gameover, clk, winclk, team: std_ulogic := '0';
BEGIN
	
	process
	begin
		wait for 10 ms;
		clk <= not clk;
	end process;
	
	
	process(clk)
	begin
	
		if(dispmode = '0') then
			out1a <= stat1a;
			out1b <= stat1b;
			out2a <= stat2a;
			out2b <= stat2b;
			out3a <= stat3a;
			out3b <= stat3b;
			out4a <= stat4a;
			out4b <= stat4b;
			out5a <= stat5a;
			out5b <= stat5b;
			out6a <= stat6a;
			out6b <= stat6b;
			out7a <= stat7a;
			out7b <= stat7b;
			out8a <= stat8a;
			out8b <= stat8b;
			out9a <= stat9a;
			out9b <= stat9b;
			winclk <= not winclk;
		else
			out1a <= set1a;
			out1b <= set1b;
			out2a <= set2a;
			out2b <= set2b;
			out3a <= set3a;
			out3b <= set3b;
			out4a <= set4a;
			out4b <= set4b;
			out5a <= set5a;
			out5b <= set5b;
			out6a <= set6a;
			out6b <= set6b;
			out7a <= set7a;
			out7b <= set7b;
			out8a <= set8a;
			out8b <= set8b;
			out9a <= set9a;
			out9b <= set9b;
		end if;
	
	end process;
	
	-- These are the win/draw conditions
	
	process(checkwin)
	begin
	
	wina <= ((stat1a AND stat2a AND stat3a) OR (stat4a AND stat5a AND stat6a) OR (stat7a AND stat8a AND stat9a) OR (stat1a AND stat4a AND stat7a) OR (stat2a AND stat5a AND stat8a) OR (stat3a AND stat6a AND stat9a) OR (stat1a AND stat5a AND stat9a) OR (stat3a AND stat5a AND stat7a));
	winb <= ((stat1b AND stat2b AND stat3b) OR (stat4b AND stat5b AND stat6b) OR (stat7b AND stat8b AND stat9b) OR (stat1b AND stat4b AND stat7b) OR (stat2b AND stat5b AND stat8b) OR (stat3b AND stat6b AND stat9b) OR (stat1b AND stat5b AND stat9b) OR (stat3b AND stat5b AND stat7b));
	drawgame <= (done1 AND done2 AND done3 AND done4 AND done5 AND done6 AND done7 AND done8 AND done9);
	
	end process;
	
	-- This is the process for any input on the game board
	
	process(trig1, trig2, trig3, trig4, trig5, trig6, trig7, trig8, trig9, reset)
	begin
	
		if(reset'event) then
			stat1a <= '0';
			stat1b <= '0';
			stat2a <= '0';
			stat2b <= '0';
			stat3a <= '0';
			stat3b <= '0';
			stat4a <= '0';
			stat4b <= '0';
			stat5a <= '0';
			stat5b <= '0';
			stat6a <= '0';
			stat6b <= '0';
			stat7a <= '0';
			stat7b <= '0';
			stat8a <= '0';
			stat8b <= '0';
			stat9a <= '0';
			stat9b <= '0';
			done1 <= '0';
			done2 <= '0';
			done3 <= '0';
			done4 <= '0';
			done5 <= '0';
			done6 <= '0';
			done7 <= '0';
			done8 <= '0';
			done9 <= '0';
			team <= '0';
			checkwin <= not checkwin;
		end if;
	
		if(rising_edge(trig1)) then
			if (done1 = '0') then
				if(team = '0') then
					out1a <= '1';
					done1 <= '1';
					team <= '1';
				elsif(team = '1') then
					out1b <= '1';
					done1 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig1)) then
			checkwin <= not checkwin;
		end if;
	
		if(rising_edge(trig2)) then
			if (done2 = '0') then
				if(team = '0') then
					out2a <= '1';
					done2 <= '1';
					team <= '1';
				elsif(team = '1') then
					out2b <= '1';
					done2 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig2)) then
			checkwin <= not checkwin;
		end if;
	
		if(rising_edge(trig3)) then
			if (done3 = '0') then
				if(team = '0') then
					out3a <= '1';
					done3 <= '1';
					team <= '1';
				elsif(team = '1') then
					out3b <= '1';
					done3 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig3)) then
			checkwin <= not checkwin;
		end if;
	
		if(rising_edge(trig4)) then
			if (done4 = '0') then
				if(team = '0') then
					out4a <= '1';
					done4 <= '1';
					team <= '1';
				elsif(team = '1') then
					out4b <= '1';
					done4 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig4)) then
			checkwin <= not checkwin;
		end if;
	
		if(rising_edge(trig5)) then
			if (done5 = '0') then
				if(team = '0') then
					out5a <= '1';
					done5 <= '1';
					team <= '1';
				elsif(team = '1') then
					out5b <= '1';
					done5 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig5)) then
			checkwin <= not checkwin;
		end if;
		
		if(rising_edge(trig6)) then
			if (done6 = '0') then
				if(team = '0') then
					out6a <= '1';
					done6 <= '1';
					team <= '1';
				elsif(team = '1') then
					out6b <= '1';
					done6 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig6)) then
			checkwin <= not checkwin;
		end if;
		
		if(rising_edge(trig7)) then
			if (done7 = '0') then
				if(team = '0') then
					out7a <= '1';
					done7 <= '1';
					team <= '1';
				elsif(team = '1') then
					out7b <= '1';
					done7 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig7)) then
			checkwin <= not checkwin;
		end if;
		
		if(rising_edge(trig8)) then
			if (done8 = '0') then
				if(team = '0') then
					out8a <= '1';
					done8 <= '1';
					team <= '1';
				elsif(team = '1') then
					out8b <= '1';
					done8 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig8)) then
			checkwin <= not checkwin;
		end if;
		
		if(rising_edge(trig9)) then
			if (done9 = '0') then
				if(team = '0') then
					out9a <= '1';
					done9 <= '1';
					team <= '1';
				elsif(team = '1') then
					out9b <= '1';
					done9 <= '1';
					team <= '0';
				end if;
			end if;
		end if;
		
		if(falling_edge(trig9)) then
			checkwin <= not checkwin;
		end if;
		
	end process;
	
	-- This is the process for the game end display condition
	
	process(wina, winb, drawgame, reset)
	begin
		if(wina'event OR winb'event OR drawgame'event) then
			dispmode <= '1';
			gameover <= not gameover;
		end if;
		if(reset'event) then
		dispmode <= '1';
		end if;
	end process;
	
	-- This is the process that describes the game end display animation
	
	process(winclk)
	variable count : integer range 0 to 255 := 0;
	begin
		if(wina = '1') then -- player a condition
			if(count <= 10) then
				set1a <= '0';
				set2a <= '0';
				set3a <= '0';
				set4a <= '0';
				set5a <= '0';
				set6a <= '0';
				set7a <= '0';
				set8a <= '0';
				set9a <= '0';
				count := count + 1;
			elsif(count <= 20) then
				set1a <= '1';
				set2a <= '1';
				set8a <= '1';
				set9a <= '1';
				count := count + 1;
			elsif(count <= 30) then
				set1a <= '0';
				set3a <= '1';
				set7a <= '1';
				set9a <= '0';
			count := count + 1;
			elsif(count <= 40) then
				set2a <= '0';
				set4a <= '1';
				set6a <= '1';
				set8a <= '0';
				count := count + 1;
			elsif(count <= 50) then
				set1a <= '1';
				set3a <= '0';
				set7a <= '0';
				set9a <= '1';
				count := count + 1;
			elsif(count <= 60) then
				set2a <= '1';
				set4a <= '0';
				set6a <= '0';
				set8a <= '1';
				count := count + 1;
			elsif(count <= 66) then
				set1a <= '0';
				set2a <= '0';
				set8a <= '0';
				set9a <= '0';
				count := count + 1;
			elsif(count <= 146) then
				set1a <= '1';
				set2a <= '1';
				set3a <= '1';
				set4a <= '1';
				set5a <= '1';
				set6a <= '1';
				set7a <= '1';
				set8a <= '1';
				set9a <= '1';
				count := count + 1;
			else
				set1a <= '0';
				set2a <= '0';
				set3a <= '0';
				set4a <= '0';
				set5a <= '0';
				set6a <= '0';
				set7a <= '0';
				set8a <= '0';
				set9a <= '0';
				count := 0;
				
				reset <= not reset;
			end if;
			
		elsif(winb = '1') then -- plbyer b condition
			if(count <= 10) then
				set1b <= '0';
				set2b <= '0';
				set3b <= '0';
				set4b <= '0';
				set5b <= '0';
				set6b <= '0';
				set7b <= '0';
				set8b <= '0';
				set9b <= '0';
				count := count + 1;
			elsif(count <= 20) then
				set5b <= '1';
				count := count + 1;
			elsif(count <= 30) then
				set2b <= '1';
				set4b <= '1';
				set5b <= '0';
				set6b <= '1';
				set8b <= '1';
				count := count + 1;
			elsif(count <= 40) then
				set1b <= '1';
				set2b <= '0';
				set3b <= '1';
				set4b <= '0';
				set6b <= '0';
				set7b <= '1';
				set8b <= '0';
				set9b <= '1';
				count := count + 1;
			elsif(count <= 50) then
				set1b <= '0';
				set2b <= '1';
				set3b <= '0';
				set4b <= '1';
				set6b <= '1';
				set7b <= '0';
				set8b <= '1';
				set9b <= '0';
				count := count + 1;
			elsif(count <= 60) then
				set2b <= '0';
				set4b <= '0';
				set5b <= '1';
				set6b <= '0';
				set8b <= '0';
				count := count + 1;
			elsif(count <= 66) then
				set5b <= '0';
				count := count + 1;
			elsif(count <= 146) then
				set1b <= '1';
				set2b <= '1';
				set3b <= '1';
				set4b <= '1';
				set5b <= '1';
				set6b <= '1';
				set7b <= '1';
				set8b <= '1';
				set9b <= '1';
				count := count + 1;
			else
				set1b <= '0';
				set2b <= '0';
				set3b <= '0';
				set4b <= '0';
				set5b <= '0';
				set6b <= '0';
				set7b <= '0';
				set8b <= '0';
				set9b <= '0';
				count := 0;
				
				reset <= not reset;
			end if;
			
		elsif(drawgame = '1') then -- draw condition
		
			reset <= not reset;
		end if;
		
	end process;
	
END arc;

-- Jaedyn Chilton
-- EEGR_3213 Final Project; TikTakToe
-- 04/16/22