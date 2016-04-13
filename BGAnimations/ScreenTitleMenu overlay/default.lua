local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+36);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,70);
		OnCommand=cmd(diffuse,color("#000000");diffusealpha,.5);
	};
};

for i=1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_TOP+13);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
end;

for i=1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_TOP+36);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
end;

for i=1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_TOP+59);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
end;



t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-36);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,70);
		OnCommand=cmd(diffuse,color("#000000");diffusealpha,.5);
	};
};

for i=1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_BOTTOM-13);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
end;

for i=1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_BOTTOM-36);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
end;

for i=1,50 do
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_BOTTOM-59);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
end;

t[#t+1] = Def.ActorFrame {
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+50);
		Def.Quad {
			InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,6);
			OnCommand=cmd(diffuse,color("#d8a97f"));
		};
		
	};
	Def.ActorFrame {
	OnCommand=cmd(stoptweening;queuecommand,"Move");
	MoveCommand=cmd(x,SCREEN_RIGHT+18;y,SCREEN_TOP+50;linear,2;x,SCREEN_LEFT-18;queuecommand,"Move");
		Def.Quad {
			InitCommand=cmd(scaletoclipped,18,6);
			OnCommand=cmd(diffuse,color("#000000");diffusealpha,.5);
		};
	};
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-60);
		Def.Quad {
			InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,18);
			OnCommand=cmd(diffuse,color("#000000"));
		};
		
	};
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-60);
		Def.Quad {
			InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,6);
			OnCommand=cmd(diffuse,color("#d8a97f"));
		};
		
	};
	Def.ActorFrame {
	OnCommand=cmd(stoptweening;queuecommand,"Move");
	MoveCommand=cmd(x,SCREEN_CENTER_X+18;y,SCREEN_BOTTOM-60;linear,1;x,SCREEN_LEFT-18;queuecommand,"Move");
		Def.Quad {
			InitCommand=cmd(scaletoclipped,18,6);
			OnCommand=cmd(diffuse,color("#000000");diffusealpha,.5);
		};
	};
	Def.ActorFrame {
	OnCommand=cmd(stoptweening;queuecommand,"Move");
	MoveCommand=cmd(x,SCREEN_CENTER_X-18;y,SCREEN_BOTTOM-60;linear,1;x,SCREEN_RIGHT+18;queuecommand,"Move");
		Def.Quad {
			InitCommand=cmd(scaletoclipped,18,6);
			OnCommand=cmd(diffuse,color("#000000");diffusealpha,.5);
		};
	};
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-60);
		Def.Quad {
			InitCommand=cmd(scaletoclipped,180,18);
			OnCommand=cmd(diffuse,color("#000000"));
		};
		
	};
	LoadFont("Common Normal") .. {
		Text="STANDARD";
		InitCommand=cmd(y,SCREEN_CENTER_Y;x,SCREEN_LEFT+200;diffuse,color("#c3a545");strokecolor,color("#000000");zoom,3);
	};
	LoadFont("Common Normal") .. {
		Text="STANDARD";
		InitCommand=cmd(y,SCREEN_CENTER_Y;x,SCREEN_LEFT+200;diffuse,color("#c3a545");strokecolor,color("#000000");zoom,3);
	};
	LoadFont("Common Normal") .. {
		Text="MENU SELECT";
		InitCommand=cmd(y,SCREEN_TOP+30;x,SCREEN_LEFT+200;diffuse,color("#ffffff");zoomx,1.5);
	};
	LoadFont("Common Normal") .. {
		Text="INFORMATION";
		InitCommand=cmd(y,SCREEN_BOTTOM-60;x,SCREEN_CENTER_X;diffuse,color("#ffffff");cropbottom,0.8);
	};
};

return t;