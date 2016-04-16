local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-30);
	--[[OnCommand=function(self)
		self:SetLife(0.022)
	end;--]]
	Def.Quad {
		InitCommand=cmd(zoomto,SCREEN_WIDTH-10,60;diffuse,color("#302e2d"));
	};
	Def.Quad {
		InitCommand=cmd(zoomto,500,50;diffuse,color("#302e2d");halign,1;y,-50;x,100);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,100,40;diffuse,color("#302e2d");halign,1;y,-90;x,40);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,490,40;diffuse,color("#9e8574");halign,1;y,-50;x,95);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,90,40;diffuse,color("#9e8574");halign,1;y,-85;x,35);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,70,30;diffuse,color("#9e8574")y,15);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,180,30;diffuse,color("#9e8574")y,-10);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,480,30;diffuse,color("#000000");halign,1;y,-50;x,90);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,70,30;diffuse,color("#000000");halign,1;y,-85;x,25);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,50,20;diffuse,color("#000000")y,15);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,170,20;diffuse,color("#000000")y,-10);
	};
	
	LoadFont("Common Normal") .. {
		InitCommand=cmd(halign,1;x,20;y,-85;diffuse,color("#6af9fe");strokecolor,color("#1e476f"));
		OnCommand=function(self)
			self:settext(tonumber(string.format("%.0f", SCREENMAN:GetTopScreen():GetLifeMeter(PLAYER_1):GetLife()*100/2))*2 .."%")
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
		InitCommand=cmd(y,15;diffuse,color("#6af9fe");strokecolor,color("#000000"));
		OnCommand=function(self)
			self:settext(string.format("%03.0f",GAMESTATE:GetSongBPS()*60))
			self:sleep(0.01)
			self:queuecommand("On")
		end;
	};
};

for i = 1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-30);
	Def.Quad {
		InitCommand=cmd(zoomto,6,26;diffuse,color("#043a3a");halign,0;y,-50;x,-395+i*9.5);
		OnCommand=function(self)
			if i > 39 then
				self:diffuse(color("#4a0c06"))
			else
				self:diffuse(color("#043a3a"))
			end
		end;
	};
	Def.Quad {
		InitCommand=cmd(zoomto,6,26;diffuse,color("#043a3a");halign,0;y,-50;x,-395+i*9.5);
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
				if i == life-1 or i == life-2 then
					self:queuecommand("RepeatDiffuse")
				else
					self:stoptweening():diffusealpha(1)
				end
			end
			self:sleep(0.1)
			self:queuecommand("On")
		end;
		RepeatDiffuseCommand=function(self)
			self:linear(0.05)
			self:diffusealpha(0)
			self:linear(0.05)
			self:diffusealpha(1)
		end
		
	};
};
end

return t;