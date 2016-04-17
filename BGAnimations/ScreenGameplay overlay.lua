local t = Def.ActorFrame {};

local judg = {
	["TapNoteScore_W1"] = "GREAT",
	["TapNoteScore_W2"] = "GREAT",
	["TapNoteScore_W3"] = "GOOD",
	["TapNoteScore_W4"] = "BAD",
	["TapNoteScore_W5"] = "POOR",
	["TapNoteScore_Miss"] = "POOR",
};

local lastjudg = 22;

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-30);
	OnCommand=function(self)
		 SCREENMAN:GetTopScreen():GetChild("PlayerP1"):SetLife(0.22)
	end;
	Def.Quad {
		InitCommand=cmd(zoomto,SCREEN_WIDTH-10,80;diffuse,color("#302e2d"));
	};
	Def.Quad {
		InitCommand=cmd(zoomto,32,SCREEN_HEIGHT;diffuse,color("#302e2d");y,-300;x,-384);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,500,50;diffuse,color("#302e2d");halign,1;y,-50;x,100);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,100,40;diffuse,color("#302e2d");halign,1;y,-90;x,40);
	};
	
	Def.Quad {
		InitCommand=cmd(zoomto,200,40;diffuse,color("#ffffff");y,-8);
	};
	
	Def.Quad {
		InitCommand=cmd(zoomto,180,40;diffuse,color("#000000");y,10);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,200,40;diffuse,color("#000000");y,33);
	};
	
	Def.Quad {
		InitCommand=cmd(zoomto,490,32;diffuse,color("#9e8574");halign,1;y,-55;x,95);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,90,40;diffuse,color("#9e8574");halign,1;y,-85;x,35);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,70,30;diffuse,color("#9e8574");y,15);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,180,30;diffuse,color("#9e8574");y,-10);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,150,5;diffuse,color("#9e8574");y,12.5);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,100,5;diffuse,color("#9e8574");y,17.5);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,10,40;diffuse,color("#9e8574");x,-395;y,-95);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,22,SCREEN_HEIGHT;diffuse,color("#9e8574");y,-300;x,-384);
	};
	
	Def.Quad {
		InitCommand=cmd(zoomto,480,22;diffuse,color("#000000");halign,1;y,-55;x,90);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,70,30;diffuse,color("#000000");halign,1;y,-85;x,25);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,50,20;diffuse,color("#000000");y,15);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,170,20;diffuse,color("#000000");y,-10);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,6,320;diffuse,color("#000000");y,-280;x,-380);
	};
	
	Def.Quad {
		InitCommand=cmd(zoomto,65,5;diffuse,color("#ffffff");halign,1;y,-72.5;x,100);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,5,10;diffuse,color("#ffffff");halign,1;y,-65;x,100);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,100,5;diffuse,color("#ffffff");halign,1;y,-107.5;x,40);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,5,35;diffuse,color("#ffffff");halign,1;y,-90;x,40);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,75,5;diffuse,color("#ffffff");halign,1;y,-105;x,30);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,70,5;diffuse,color("#000000");halign,1;y,-107.5;x,27.5);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,70,5;diffusealpha,0;diffuseblink;effectperiod,0.1;effectcolor1,color("0,0,0,0");effectcolor2,color("#2afcfe");halign,1;y,-107.5;x,27.5);
		OnCommand=function(self)
			local newjudg = tonumber(string.format("%.0f", SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()*100/2))*2
			if newjudg > 79 then
				self:diffusealpha(1)
			elseif lastjudg < newjudg then
				self:diffusealpha(1)
				self:sleep(0.2)
				self:diffusealpha(0)
				lastjudg = newjudg
			else
				self:sleep(0.01)
				self:diffusealpha(0)
				lastjudg = newjudg
			end
			self:sleep(0.01)
			self:queuecommand("On")
		end;
	};
	
	Def.Quad {
		InitCommand=cmd(zoomto,4,340;diffuse,color("#fdc875");y,-280;x,-389);
	};	
	Def.ActorFrame {
		InitCommand=cmd(x,-395;y,-100);
		Def.Quad {
			InitCommand=cmd(zoomto,4,20;diffuse,color("#fdc875");rotationz,-45);
		};
		Def.Quad {
			InitCommand=cmd(zoomto,4,20;diffuse,color("#fdc875");rotationz,-45;y,15);
		};
	};
	Def.Quad {
		InitCommand=cmd(zoomto,2.5,12;diffuse,color("#fdc875");halign,0;y,-55;x,-395);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,40,7;diffuse,color("#fdc875");y,-26);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,5,5;diffuse,color("#fdc875");y,7.5;x,-70);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,5,5;diffuse,color("#fdc875");y,7.5;x,70);
	};
	
	Def.Quad {
		InitCommand=cmd(zoomto,6,20;diffuse,color("#f2af16");y,-430;x,-380);
		OnCommand=function(self)
			local sec = GAMESTATE:GetSongPercent(GAMESTATE:GetSongBeat());
			if sec < 0 then sec = 0 end
			if sec > 1 then sec = 1 end
			self:y(-430+sec*300)
			self:sleep(0.01)
			self:queuecommand("On")
		end;
	};	
	LoadFont("Common Normal") .. {
		InitCommand=cmd(halign,1;x,20;y,-85;diffuse,color("#6af9fe");strokecolor,color("#1e476f"));
		OnCommand=function(self)
			if SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife() < 0.02 then
				SCREENMAN:GetTopScreen():GetChild("PlayerP1"):SetLife(0.02)
				self:settext("2%")
			else
				self:settext(tonumber(string.format("%.0f", SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()*100/2))*2 .."%")
			end;
			self:sleep(0.01)
			self:queuecommand("On")
		end;
	};
	LoadFont("Common Normal") .. {
		Text=GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString("ModsLevel_Preferred");
		InitCommand=cmd(y,-10;diffuse,color("#6af9fe");strokecolor,color("#000000");zoom,0.8;maxwidth,200);
	};
	LoadFont("Common Normal") .. {
		Text="BPM";
		InitCommand=cmd(y,2;diffuse,color("#6af9fe");strokecolor,color("#000000");zoom,0.8;zoomy,0.4);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,15;diffuse,color("#6af9fe");strokecolor,color("#000000");zoom,.9);
		OnCommand=function(self)
			self:settext(string.format("%03.0f",GAMESTATE:GetSongBPS()*60))
			self:sleep(0.01)
			self:queuecommand("On")
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,-200;x,-210;diffuse,color("#f87800");strokecolor,color("#000000");zoom,1.5;diffusealpha,0);
		JudgmentMessageCommand=function(self,params)
			local curcomb = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetCurrentCombo()
			self:diffuseblink():effectperiod(0.1):effectcolor1(color("#0,0,0,0")):effectcolor2(color("#f87800"))
			if curcomb == 0 then curcomb = "" end
			if judg[params.TapNoteScore] then
				self:settext(judg[params.TapNoteScore].." "..curcomb)
				self:diffusealpha(1)
				if params.TapNoteScore == "TapNoteScore_W1" then
					self:diffuseblink():effectperiod(0.1):effectcolor1(color("#f85890")):effectcolor2(color("#5888f8"))
				elseif params.TapNoteScore == "TapNoteScore_W2" or params.TapNoteScore == "TapNoteScore_W3" then
					self:diffuseblink():effectperiod(0.1):effectcolor1(color("0,0,0,0")):effectcolor2(color("#f0e000"))
				else
					self:diffuseblink():effectperiod(0.1):effectcolor1(color("0,0,0,0")):effectcolor2(color("#f87800"))
				end
			else
				self:diffusealpha(0)
			end
			self:sleep(0.5):diffusealpha(0)
		end;
	};
};

for i = 1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-30);
	Def.Quad {
		InitCommand=cmd(zoomto,5,12;diffuse,color("#043a3a");halign,0;y,-55;x,-395+i*9.5);
		OnCommand=function(self)
			if i > 39 then
				self:diffuse(color("#4a0c06"))
			else
				self:diffuse(color("#043a3a"))
			end
		end;
	};
	Def.Quad {
		InitCommand=cmd(zoomto,5,12;diffuse,color("#043a3a");halign,0;y,-55;x,-395+i*9.5);
		OnCommand=function(self)
			local life = tonumber(string.format("%.0f", SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()*100/2))
			if i > 39 then
				self:diffuse(color("#ff0000"))
			else
				self:diffuse(color("#1cdfdf"))
			end
			if i > life then
				self:diffusealpha(0)
			else
				if i == life-2 then
					self:queuecommand("Repeat1Diffuse")
				elseif i == life-1 then
					self:queuecommand("Repeat2Diffuse")
				else
					self:stoptweening():diffusealpha(1)
				end
			end
			self:sleep(0.1)
			self:queuecommand("On")
		end;
		Repeat1DiffuseCommand=function(self)
			self:sleep(0.05)
			self:diffusealpha(0)
			self:sleep(0.05)
			self:diffusealpha(1)
		end;
		Repeat2DiffuseCommand=function(self)
			self:sleep(0.01)
			self:diffusealpha(0)
			self:sleep(0.09)
			self:diffusealpha(1)
		end;
		
	};
};
end

return t;