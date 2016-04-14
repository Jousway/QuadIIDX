--SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("MusicWheelItem"):GetChild("SongName"):queuecommand("AfterSet");
--TextBannerAfterSet(SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("MusicWheelItem"):GetChild("SongName"))
diffcolours = {
	["Difficulty_Beginner"] = "#01c6f8",
	["Difficulty_Easy"] = "#01c6f8",
	["Difficulty_Medium"] = "#f1a201",
	["Difficulty_Hard"] = "#f1a201",
	["Difficulty_Challenge"] = "#f00200",
	["Difficulty_Edit"] = "#f00200",
}

function ChangeDiff(self)
	local Title = self:GetParent():GetParent():GetChild("SongName"):GetChild("Title")
	local st = GAMESTATE:GetCurrentStyle():GetStepsType()
	local SongFind = SONGMAN:FindSong(Title:GetText())
	if SongFind then
		local diff = SongFind:GetOneSteps( st, GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty())
		local diffname = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()
		if diff then
			self:settext(diff:GetMeter())
			--self:settext(diffname)
			if diffcolours[diffname] then
				self:diffuse(color(diffcolours[diffname]))
			else
				self:diffuse(color("#c3a545"))
			end
		else
			self:settext("N")
			self:diffuse(color("#c3a545"))
		end
	else
		self:settext("B")
		self:diffuse(color("#c3a545"))
	end
end


return Def.ActorFrame {	
	CurrentSongChangedMessageCommand=function(self)
		local Title = self:GetParent():GetChild("SongName"):GetChild("Title")
		local Song = GAMESTATE:GetCurrentSong()
		if Song then
			if Title:GetText() == Song:GetDisplayMainTitle() then
				self:x(-20)
			else
				self:x(0)
			end
		else
			self:x(0)
		end
	end;
	Def.Quad{
		InitCommand=cmd(zoomto,310,30;diffuse,color("0.5,0.5,0.5,0.5");halign,0;x,-35);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,5,30;diffuse,color("0,0,0,0.5");halign,0;x,-35);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(strokecolor,color("#000000");halign,1;uppercase,true);
		CurrentStepsP1ChangedMessageCommand=function(self) ChangeDiff(self) end;
		CurrentSongChangedMessageCommand=function(self) ChangeDiff(self) end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(diffuse,color("#c3a545");strokecolor,color("#000000");halign,0;uppercase,true);
		CurrentSongChangedMessageCommand=function(self) 
			local Title = self:GetParent():GetParent():GetChild("SongName"):GetChild("Title")
			self:settext(Title:GetText()):maxwidth(200):x(10)
		end;
	};
};