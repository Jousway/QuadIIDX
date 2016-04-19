function resetscore()
	totaliidxscore = 0
	iidxfullcombo = true
end;
function iidxscore(self,params)
	-- https://remywiki.com/IIDX_General_Info#How_is_your_money_score_calculated.3F
	local N = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1):GetValue("RadarCategory_TapsAndHolds") + GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1):GetValue("RadarCategory_Holds") + GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1):GetValue("RadarCategory_Rolls")
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