local gc = Var("GameCommand");

local function key1(axe,why)
	return Def.Quad{
		InitCommand=cmd(x,axe;y,why;zoomto,10,20;diffuse,color("#666666"));
		GainFocusCommand=cmd(diffuse,color("#fe6300"));
		LoseFocusCommand=cmd(diffuse,color("#666666"));
	};
end
local function key2(axe,why)
	return Def.ActorFrame {
		Def.Quad{
			InitCommand=cmd(x,axe;y,why;zoomto,10,20;diffuse,color("#666666"));
			GainFocusCommand=cmd(diffuse,color("#fe6300"));
			LoseFocusCommand=cmd(diffuse,color("#666666"));
		};
		Def.Quad{
			InitCommand=cmd(x,axe;y,why;zoomto,8,18;diffuse,color("#000000"));
		};
	};
end

local function knob(axe,why,rot)
	return Def.ActorFrame {
		InitCommand=cmd(x,axe;y,why;rotationz,rot);
		Def.Quad{
			InitCommand=cmd(zoomto,15,15;diffuse,color("#666666"));
			GainFocusCommand=cmd(diffuse,color("#fe6300"));
			LoseFocusCommand=cmd(diffuse,color("#666666"));
		};
		Def.Quad{
			InitCommand=cmd(x,-5;zoomto,8,2;diffuse,color("#000000"));
		};
	};
end

local function chara(axe,why)
	return Def.ActorFrame {
		InitCommand=cmd(x,axe;y,why);
		Def.Quad{
			InitCommand=cmd(zoomto,18,18;diffuse,color("#000000"));
		};
		Def.Quad{
			InitCommand=cmd(y,20;zoomto,33,33;diffuse,color("#000000"));
		};
		Def.Quad{
			InitCommand=cmd(y,40;zoomto,18,33;diffuse,color("#000000"));
		};
		Def.Quad{
			InitCommand=cmd(zoomto,15,15;diffuse,color("#666666"));
			GainFocusCommand=cmd(diffuse,color("#fe6300"));
			LoseFocusCommand=cmd(diffuse,color("#666666"));
		};
		Def.Quad{
			InitCommand=cmd(y,20;zoomto,30,30;diffuse,color("#666666"));
			GainFocusCommand=cmd(diffuse,color("#fe6300"));
			LoseFocusCommand=cmd(diffuse,color("#666666"));
		};
		Def.Quad{
			InitCommand=cmd(y,40;zoomto,15,30;diffuse,color("#666666"));
			GainFocusCommand=cmd(diffuse,color("#fe6300"));
			LoseFocusCommand=cmd(diffuse,color("#666666"));
		};
	};
end

local function door(why)
	return Def.ActorFrame {
		InitCommand=cmd(y,why);
		Def.Quad{
			InitCommand=cmd(x,-15;zoomto,33,63;diffuse,color("#666666"));
			GainFocusCommand=cmd(diffuse,color("#fe6300"));
			LoseFocusCommand=cmd(diffuse,color("#666666"));
		};
		Def.Quad{
			InitCommand=cmd(x,-15;zoomto,30,60;diffuse,color("#000000"));
		};
		Def.Quad{
			InitCommand=cmd(x,15;zoomto,30,60;diffuse,color("#666666"));
			GainFocusCommand=cmd(diffuse,color("#fe6300"));
			LoseFocusCommand=cmd(diffuse,color("#666666"));
		};
		Def.Quad{
			InitCommand=cmd(x,20;zoomto,8,3;diffuse,color("#000000"));
		};
	};
end

local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(y,75;zoomto,140,210;diffuse,color("#000000"));
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	Def.Quad{
		InitCommand=cmd(y,75;zoomto,130,200;diffuse,color("#fd8e01"));
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	Def.Quad{
		InitCommand=cmd(y,160;zoomto,122,25;diffuse,color("#000000"));
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadFont("Common Normal") .. {
		Text="DECIDE?";
		InitCommand=cmd(y,162.5;diffuse,color("#ff9801");zoomy,0.7);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	Def.Quad{
		InitCommand=cmd(y,65;zoomto,122,174;diffuse,color("#7c909d"));
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};	
	Def.Quad{
		InitCommand=cmd(y,65;zoomto,120,170;diffuse,0,0,0,1);
	};
	Def.Quad{
		InitCommand=cmd(y,80;zoomto,100,100;diffuse,color("#666666"));
		GainFocusCommand=cmd(diffuse,color("#fe6300"));
		LoseFocusCommand=cmd(diffuse,color("#666666"));
	};
	Def.Quad{
		InitCommand=cmd(y,80;zoomto,85,85;diffuse,color("#000000"));
	};
	Def.Quad{
		InitCommand=cmd(y,0;zoomto,110,25);
		GainFocusCommand=cmd(diffuseblink;effectperiod,0.1;effectcolor1,color("#fe5d00");effectcolor2,color("#ffba00"));
		LoseFocusCommand=cmd(diffuseblink;effectperiod,0.1;effectcolor1,color("#ffffff");effectcolor2,color("#ffffff"));
	};
	LoadFont("Common Normal") .. {
		Text=string.upper(THEME:GetString("ScreenTitleMenu",gc:GetText()));
		InitCommand=cmd(diffuse,color("#000000");zoom,0.8);
	};
};

if gc:GetText() == "Settings" then
	t[#t+1] = Def.ActorFrame {
		knob(-20,50,-25);
		knob(20,50,140);
		knob(-20,80,80);
		knob(20,80,70);
		knob(-20,110,180);
		knob(20,110,100);
	};
elseif gc:GetText() == "SMO" then
	t[#t+1] = Def.ActorFrame {
		chara(20,50);
		chara(0,55);
		chara(-20,60);
	};
elseif gc:GetText() == "Edit" then
	t[#t+1] = Def.ActorFrame {	
		key1(0,70);
		key2(-15,70);
		key2(15,70);
		key2(7.5,95);
		key1(-7.5,95);
		key2(22.5,95);
		key2(-22.5,95);
	};
elseif gc:GetText() == "Exit" then
	t[#t+1] = Def.ActorFrame {	
		door(80)
	};
else
	t[#t+1] = Def.ActorFrame {
		key2(0,70);
		key2(-15,70);
		key2(15,70);
		key1(7.5,95);
		key1(-7.5,95);
		key1(22.5,95);
		key1(-22.5,95);
	};
end

return t;