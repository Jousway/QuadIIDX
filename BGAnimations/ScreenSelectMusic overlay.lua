local t = Def.ActorFrame {};

--Header
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


--Footer
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
	MoveCommand=cmd(x,SCREEN_CENTER_X+18;y,SCREEN_BOTTOM-60;linear,1;x,SCREEN_LEFT-18;sleep,1;queuecommand,"Move");
		Def.Quad {
			InitCommand=cmd(scaletoclipped,18,6);
			OnCommand=cmd(diffuse,color("#000000");diffusealpha,.5);
		};
	};
	Def.ActorFrame {
	OnCommand=cmd(stoptweening;queuecommand,"Move");
	MoveCommand=cmd(x,SCREEN_CENTER_X-18;y,SCREEN_BOTTOM-60;linear,1;x,SCREEN_RIGHT+18;sleep,1;queuecommand,"Move");
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
		InitCommand=cmd(y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X+50;diffuse,color("#c3a545");strokecolor,color("#000000");zoom,2;halign,1;uppercase,true;maxwidth,200);
		CurrentSongChangedMessageCommand=function(self)
			self:settext(GAMESTATE:GetCurrentSong():GetDisplayMainTitle());
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_BOTTOM-30;x,SCREEN_CENTER_X;diffuse,color("#FFFFFF");uppercase,true;strokecolor,color("#000000"));
		Text="PICK A SONG";
	};
	LoadFont("Common Normal") .. {
		Text="MENU SELECT";
		InitCommand=cmd(y,SCREEN_TOP+30;x,SCREEN_LEFT+200;diffuse,color("#ffffff");zoomx,1.5);
	};
	LoadFont("Common Normal") .. {
		Text="INFORMATION";
		InitCommand=cmd(y,SCREEN_BOTTOM-60;x,SCREEN_CENTER_X;diffuse,color("#ffffff"));
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,60,60);
		OnCommand=cmd(y,SCREEN_LEFT+40;x,SCREEN_TOP+40;diffuse,color("#c3a545");spin);
	};
	LoadFont("Common Normal") .. {
		Text="QUAD\nIIDX";
		InitCommand=cmd(y,SCREEN_LEFT+40;x,SCREEN_TOP+40;diffuse,color("#000000");spin;zoom,.8);
	};
};



return t;