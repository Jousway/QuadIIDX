local t = Def.ActorFrame {};

local setname = {
	SelectStyle(),
	SelectStyle2(),
	"Settings",
	"Online",
	"Edit",
	"Exit",
};
local setinfo = {
	"Play a game of StepMania",
	"Play a game of StepMania",
	"Edit your configuration",
	"Play with other people",
	"Edit your simfiles",
	"Quit the game",
};

t[#t+1] = Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(y,SCREEN_CENTER_Y-75;x,SCREEN_CENTER_X-80;zoomto,570,10;diffuse,color("#000000"));
	};
	LoadFont("Common Normal") .. {
		Text="WHICH MENU MATCHES YOU?";
		InitCommand=cmd(y,SCREEN_CENTER_Y-75;x,SCREEN_CENTER_X-360;diffuse,color("#ff8d01");zoomx,0.6;zoomy,0.3;halign,0);
	};
	LoadFont("Common Normal") .. {
		Text="MENU INFORMATION_";
		InitCommand=cmd(y,SCREEN_CENTER_Y-160;x,SCREEN_CENTER_X-380;diffuse,color("#ff8d01");zoomx,0.6;zoomy,0.3;halign,0);
	};
	Def.Quad{
		InitCommand=cmd(y,SCREEN_CENTER_Y-200;x,SCREEN_CENTER_X-220;zoomto,380,20;diffuse,color("#000000"));
	};
	Def.Quad{
		InitCommand=cmd(y,SCREEN_CENTER_Y-200;x,SCREEN_CENTER_X-340;zoomto,130,15;diffuse,color("#ff8d01"));
	};
	LoadFont("Common Normal") .. {
		Text="OPERATION";
		InitCommand=cmd(y,SCREEN_CENTER_Y-200;x,SCREEN_CENTER_X-340;diffuse,color("#000000");zoomx,0.6;zoomy,0.6);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-200;x,SCREEN_CENTER_X-240;diffuse,color("#ff8d01");zoomx,0.6;zoomy,0.6;halign,0);
		Text=string.upper("Welcome to StepMania");
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-110;x,SCREEN_LEFT+60;diffuse,color("#000000");strokecolor,color("#000000");zoomy,2;zoomx,4;halign,0;uppercase,true);
		Text=string.upper(SelectStyle());
		MenuSelectionChangedMessageCommand=function(self)
			self:settext(setname[SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1]);
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-55;x,SCREEN_LEFT+60;strokecolor,color("#000000");halign,0;zoom,1.1;uppercase,true);
		Text=string.upper(setinfo[1]);
		MenuSelectionChangedMessageCommand=function(self)
			self:settext(setinfo[SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1]);
		end;
	};
	LoadFont("Common Normal") .. {
		Text="    AIN MENU";
		InitCommand=cmd(y,SCREEN_TOP+10;x,SCREEN_LEFT+20;diffuse,color("#ffffff");zoomx,1.5;zoomy,0.8;halign,0);
	};
	LoadFont("Common Normal") .. {
		Text="M";
		InitCommand=cmd(y,SCREEN_TOP+10;x,SCREEN_LEFT+20;diffuse,color("#ff8d01");zoomx,1.5;zoomy,0.8;halign,0);
	};
};



return t;