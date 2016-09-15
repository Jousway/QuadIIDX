function resetscore()
	totaliidxscore = 0
	totalexscore = 0
	iidxfullcombo = true
	iidxlifetable = {22};
	judgW5 = 0
	judgW4 = 0
	judgW3 = 0
	judgW2 = 0
	judgW1 = 0
end;

function radarvalue(value)
	return GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1):GetValue(value)
end

function iidxscore(self,params)
	local N;
	local nGame = GAMESTATE:GetCurrentGame():GetName();
	-- https://remywiki.com/IIDX_General_Info#How_is_your_money_score_calculated.3F
	if nGame == "beat" or nGame == "popn" then
		N = radarvalue("RadarCategory_Notes") + radarvalue("RadarCategory_Holds") + radarvalue("RadarCategory_Rolls")
	else
		N = radarvalue("RadarCategory_TapsAndHolds") + radarvalue("RadarCategory_Holds") + radarvalue("RadarCategory_Rolls")
	end
    local B = 100000 / N
    local C = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetCurrentCombo()
	--local V = 50000 / (10 * N - 55) -- remy math
	--local V = 5000 / (10 * N - ( ( N / 2 ) + ( N / 12.5 ) ) ) --NOBODY KNOWS THE RIGHT MATH
    local V = 50000 / (10 * N)
	if C < 11 then
		if params.TapNoteScore == "TapNoteScore_W3" then
			S = 0.2 * B + (C - 1) * V	
			iidxfullcombo = false
		elseif params.TapNoteScore == "TapNoteScore_W2" then
			S = 1.0 * B + (C - 1) * V
			iidxfullcombo = false
		elseif params.TapNoteScore == "TapNoteScore_W1" then
			if iidxfullcombo then
				S = 1.5 * B + 10 * V
			else
				S = 1.5 * B + (C - 1) * V
			end
		else
			S = 0
		end
	else
		if params.TapNoteScore == "TapNoteScore_W3" then
			S = 0.2 * B + 10 * V
			iidxfullcombo = false
		elseif params.TapNoteScore == "TapNoteScore_W2" then
			S = 1.0 * B + 10 * V
			iidxfullcombo = false
		elseif params.TapNoteScore == "TapNoteScore_W1" then
				S = 1.5 * B + 10 * V
		else
			S = 0
		end
	end
	totaliidxscore = totaliidxscore + S
	return tonumber(string.format("%.0f", totaliidxscore))
end

function exscore(self,params)
	if params.TapNoteScore == "TapNoteScore_W2" then
		S2 = 1
	elseif params.TapNoteScore == "TapNoteScore_W1" then
		S2 = 2
	else
		S2 = 0
	end
	totalexscore = totalexscore + S2
	return tonumber(string.format("%.0f", totalexscore))
end

function countjudg(self,params)
	if params.TapNoteScore == "TapNoteScore_W5" or params.TapNoteScore == "TapNoteScore_Miss" then
		judgW5 = judgW5 + 1
	elseif params.TapNoteScore == "TapNoteScore_W4" then
		judgW4 = judgW4 + 1
	elseif params.TapNoteScore == "TapNoteScore_W3" then
		judgW3 = judgW3 + 1
	elseif params.TapNoteScore == "TapNoteScore_W2" then
		judgW2 = judgW2 + 1
	elseif params.TapNoteScore == "TapNoteScore_W1" then
		judgW1 = judgW1 + 1
	end
end

function iidxlife()
	local life = tonumber(string.format("%.0f", SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()*100))
	iidxlifetable[#iidxlifetable+1] = life
end