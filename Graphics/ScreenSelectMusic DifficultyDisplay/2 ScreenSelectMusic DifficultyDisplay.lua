local t = Def.ActorFrame {};

local tLocation = {
	Beginner	= 26*0.40,
	Easy 		= 26*1.46,
	Medium		= 26*2.52,
	Hard		= 26*3.58,
	Challenge	= 26*4.64,
	Edit 		= 26*5.70,
};
local tColour = {
	Beginner	= "#01c6f8",
	Easy 		= "#01c6f8",
	Medium		= "#f1a201",
	Hard		= "#f1a201",
	Challenge	= "#f00200",
	Edit 		= "#f00200",
};
function str(num)
	str2 = " "
	for e = 1,num do	
		str2 = str2.." " 
	end
	return str2
end

t[#t+1] = Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(zoomto,425,200;x,-190;y,72.5;diffuse,color("#000000"));
	};
	Def.Quad{
		InitCommand=cmd(zoomto,420,180;x,-190;y,80;diffuse,color("#dceef1"));
	};
	Def.Quad{
		InitCommand=cmd(zoomto,100,14;x,-345;y,-18;diffuse,color("#ff8d01"));
	};
	LoadFont("StepsDisplay","Meter") .. {
		Text="DIFFICULTY";
		InitCommand=cmd(y,-18;zoom,0.6;zoomy,0.4;diffuse,color("#000000");x,-345);
	};
	LoadFont("StepsDisplay","Meter") .. {
		--i'm lazy ;)
		Text="EASY"..str(39).."HARD";
		InitCommand=cmd(y,-18;zoom,0.8;zoomy,0.6;x,-280;halign,0);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,452,32;x,-200);
		CurrentSongChangedMessageCommand=cmd(playcommand,"On");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"On");
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSteps(PLAYER_1) then
				local diffname = ToEnumShortString(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty())
				local song = GAMESTATE:GetCurrentSong()
				if song then
					self:y(tLocation[diffname])
					self:diffuse(color("#000000"))
				else
					self:diffusealpha(0)
				end;
			end;
		end
	};
	Def.Quad{
		InitCommand=cmd(zoomto,450,30;x,-200);
		CurrentSongChangedMessageCommand=cmd(playcommand,"On");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"On");
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSteps(PLAYER_1) then
				local diffname = ToEnumShortString(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty())
				local song = GAMESTATE:GetCurrentSong()
				if song then
					self:y(tLocation[diffname])
					self:diffuse(color(tColour[diffname]))
				else
					self:diffusealpha(0)
				end;
			end;
		end
	};
	LoadFont("StepsDisplay","Meter") .. {
		Text="DECIDE?";
		InitCommand=cmd(x,-390;diffuse,0,0,0,1;zoom,0.5);
		CurrentSongChangedMessageCommand=cmd(playcommand,"On");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"On");
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSteps(PLAYER_1) then
				local diffname = ToEnumShortString(GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty())
				local song = GAMESTATE:GetCurrentSong()
				if song then
					self:y(tLocation[diffname])
					self:diffusealpha(1)
				else
					self:diffusealpha(0)
				end;
			end;
		end
	};
};

for idx,diff in pairs(Difficulty) do
	local sDifficulty = ToEnumShortString( diff );
	t[#t+1] = Def.ActorFrame {
		SetCommand=function(self)
			local c = self:GetChildren();
			local song = GAMESTATE:GetCurrentSong()
			local meter = "";
			if song then
				local st = GAMESTATE:GetCurrentStyle():GetStepsType()
				local steps = song:GetOneSteps( st, diff );
				if steps then
					meter = steps:GetMeter();
				end
			end
			c.Diff:settext( sDifficulty );
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		--
		Def.Quad{
			InitCommand=cmd(zoomto,290,23;y,tLocation[sDifficulty];diffuse,color("0,0,0,1");x,-135);
		};
		Def.Quad{
			InitCommand=cmd(zoomto,70,23;y,tLocation[sDifficulty];diffuse,color("0,0,0,1");x,-320);
		};
		LoadFont("StepsDisplay","Meter") .. {
			Name="Diff";
			InitCommand=cmd(y,tLocation[sDifficulty];zoom,0.5;diffuse,color( tColour[sDifficulty] );x,-320;strokecolor,color("#000000"));
		};
	};
	for i = 1,12 do
		t[#t+1] = Def.ActorFrame {
			InitCommand=cmd(x,-280);
			Def.Quad{
				InitCommand=cmd(zoomto,18,18;y,tLocation[sDifficulty];diffuse,color( tColour[sDifficulty] )x,-12+i*24);
				CurrentSongChangedMessageCommand=function(self) 
				local song = GAMESTATE:GetCurrentSong()
					local song = GAMESTATE:GetCurrentSong()
					if song then
						local st = GAMESTATE:GetCurrentStyle():GetStepsType()
						local steps = song:GetOneSteps( st, diff );
						if steps then
							meter = steps:GetMeter();
							if i < meter+1 then 
								self:diffusealpha(1)
							else
								self:diffusealpha(0.2)
							end
						else
							self:diffusealpha(0.2)
						end
					else
						self:diffusealpha(0.2)
					end	
				end;
			};
			LoadFont("StepsDisplay","Meter") .. {
				Text=i;
				InitCommand=cmd(y,tLocation[sDifficulty];zoom,0.4;x,-12+i*24);
			};
		};
	end
end
return t