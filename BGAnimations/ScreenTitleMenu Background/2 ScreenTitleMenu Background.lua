local function key1(axe,why)
	return Def.Quad{
		InitCommand=cmd(x,axe;y,why;zoomto,10,20;diffuse,color("#5d7998");diffusealpha,1);
		MenuSelectionChangedMessageCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 1 or SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 2 then
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end;
	};
end
local function key2(axe,why)
	return Def.ActorFrame {
		InitCommand=cmd(diffusealpha,1);
		Def.Quad{
			InitCommand=cmd(x,axe;y,why;zoomto,10,20;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(x,axe;y,why;zoomto,8,18;diffuse,color("#a8c3e4"));
		};
		MenuSelectionChangedMessageCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 1 or SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 2 then
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end;
	};
end

local function key3(axe,why)
	return Def.Quad{
		InitCommand=cmd(x,axe;y,why;zoomto,10,20;diffuse,color("#5d7998");diffusealpha,0);
		MenuSelectionChangedMessageCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 5 then
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end;
	};
end
local function key4(axe,why)
	return Def.ActorFrame {
		InitCommand=cmd(diffusealpha,0);
		Def.Quad{
			InitCommand=cmd(x,axe;y,why;zoomto,10,20;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(x,axe;y,why;zoomto,8,18;diffuse,color("#a8c3e4"));
		};
		MenuSelectionChangedMessageCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 5 then
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end;
	};
end

local function knob(axe,why,rot)
	return Def.ActorFrame {
		InitCommand=cmd(x,axe;y,why;rotationz,rot;diffusealpha,0);
		Def.Quad{
			InitCommand=cmd(zoomto,15,15;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(x,-5;zoomto,8,2;diffuse,color("#a8c3e4"));
		};
		MenuSelectionChangedMessageCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 3 then
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end;
	};
end

local function chara(axe,why)
	return Def.ActorFrame {
		InitCommand=cmd(x,axe;y,why;diffusealpha,0);
		Def.Quad{
			InitCommand=cmd(zoomto,18,18;diffuse,color("#a8c3e4"));
		};
		Def.Quad{
			InitCommand=cmd(y,20;zoomto,33,33;diffuse,color("#a8c3e4"));
		};
		Def.Quad{
			InitCommand=cmd(y,40;zoomto,18,33;diffuse,color("#a8c3e4"));
		};
		Def.Quad{
			InitCommand=cmd(zoomto,15,15;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(y,20;zoomto,30,30;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(y,40;zoomto,15,30;diffuse,color("#5d7998"));
		};
		MenuSelectionChangedMessageCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 4 then
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end;
	};
end

local function door(why)
	return Def.ActorFrame {
		InitCommand=cmd(y,why;diffusealpha,0);
		Def.Quad{
			InitCommand=cmd(x,-15;zoomto,33,63;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(x,-15;zoomto,30,60;diffuse,color("#a8c3e4"));
		};
		Def.Quad{
			InitCommand=cmd(x,15;zoomto,30,60;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(x,20;zoomto,8,3;diffuse,color("#a8c3e4"));
		};
		MenuSelectionChangedMessageCommand=function(self)
			if SCREENMAN:GetTopScreen():GetSelectionIndex(PLAYER_1)+1 == 6 then
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end;
	};
end

local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#000042"));
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#9e9e9e");fadetop,0.8;diffusealpha,0.8);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#8baed5");fadetop,0.8;fadebottom,0.8;);
	};
	Def.Quad{
		InitCommand=cmd(y,-30;zoomto,790,280;diffuse,color("#000000"));
	};
	Def.Quad{
		InitCommand=cmd(y,-20;zoomto,780,250;diffuse,color("#a8c3e4"));
	};
	Def.ActorFrame {
		InitCommand=cmd(zoom,1.5;y,-40;x,300;);
		Def.Quad{
			InitCommand=cmd(zoomto,100,100;diffuse,color("#5d7998"));
		};
		Def.Quad{
			InitCommand=cmd(zoomto,85,85;diffuse,color("#a8c3e4"));
		};
	};
};
	
	
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(zoom,1.5;x,SCREEN_CENTER_X+300;y,SCREEN_CENTER_Y-160);
	knob(-20,50,-25);
	knob(20,50,140);
	knob(-20,80,80);
	knob(20,80,70);
	knob(-20,110,180);
	knob(20,110,100);
	chara(20,50);
	chara(0,55);
	chara(-20,60);
	key3(0,70);
	key4(-15,70);
	key4(15,70);
	key4(7.5,95);
	key3(-7.5,95);
	key4(22.5,95);
	key4(-22.5,95);
	door(80);
	key2(0,70);
	key2(-15,70);
	key2(15,70);
	key1(7.5,95);
	key1(-7.5,95);
	key1(22.5,95);
	key1(-22.5,95);
};

return t;