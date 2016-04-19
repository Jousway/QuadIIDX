local t = Def.ActorFrame {	
	LoadFont("Common Normal") .. {
		Text=tonumber(string.format("%.0f", totaliidxscore));
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=function(self)
			local stageaward = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetStageAward()
			if stageaward == "StageAward_FullComboW1" then
				self:settext("204620")
			elseif stageaward == "StageAward_FullComboW1" then
				self:settext(tonumber(string.format("%.0f", totaliidxscore))+3111)
			end
		end
	};
};

return t;