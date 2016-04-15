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

function ChangeDiff(self,param)
	local Title = self:GetParent():GetParent():GetChild("SongName"):GetChild("Title")
	local st = GAMESTATE:GetCurrentStyle():GetStepsType()
	--local SongFind = SONGMAN:FindSong(Title:GetText())
	if self.ParamSong then
		if GAMESTATE:GetCurrentSteps(PLAYER_1) then
			local diff = self.ParamSong:GetOneSteps( st, GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty())
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
				--N as in Not as in difficulty not found
				self:settext("N")
				self:diffuse(color("#c3a545"))
			end
		end
	else
		--B for Bad as in cant find song
		self:settext("B")
		self:diffuse(color("#c3a545"))
	end
end


return Def.ActorFrame {	
	Def.Quad{
		InitCommand=cmd(zoomto,400,30;diffuse,color("0.5,0.5,0.5,0.5");halign,0;x,-35);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,400,28;diffuse,color("0.5,0.5,0.5,0.5");halign,0;x,6);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,32,28;diffuse,color("0.5,0.5,0.5,0.5");halign,1;x,4);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,5,28;diffuse,color("0,0,0,0.5");halign,0;x,-35);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(strokecolor,color("#000000");halign,1;uppercase,true);
		CurrentStepsP1ChangedMessageCommand=function(self) ChangeDiff(self) end;
		CurrentSongChangedMessageCommand=function(self) ChangeDiff(self) end;
		SetCommand=function(self,param)
			self.ParamSong = param.Song
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(diffuse,color("#c3a545");strokecolor,color("#000000");halign,0;uppercase,true);
		CurrentSongChangedMessageCommand=function(self) 
			local Title = self:GetParent():GetParent():GetChild("SongName"):GetChild("Title")
			self:settext(Title:GetText()):maxwidth(200):x(10)
		end;
	};
};