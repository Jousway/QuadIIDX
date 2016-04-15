local tLocation = {
	Beginner	= 18*0.40,
	Easy 		= 18*1.46,
	Medium		= 18*2.52,
	Hard		= 18*3.58,
	Challenge	= 18*4.64,
	Edit 		= 18*5.70,
};


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
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_TOP+36);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
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
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_BOTTOM-36);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,-10+i*19;y,SCREEN_BOTTOM-59);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,16,20);
		OnCommand=cmd(diffuse,color("#7f7f7f");diffusealpha,.5);
	};
};
end;

t[#t+1] = Def.ActorFrame {
	LoadActor( THEME:GetPathG("ScreenSelectMusic","DifficultyDisplay") )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+60;y,SCREEN_CENTER_Y+50);
	};
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X+280;y,SCREEN_CENTER_Y);
		Def.Quad {
			ShowPressStartForOptionsCommand=cmd(stoptweening);
			InitCommand=cmd(scaletoclipped,356,34;diffuse,color("#dd8637");diffusealpha,0.5);
			OnCommand=cmd(linear,1;diffusealpha,0.2;linear,1;diffusealpha,0.5;queuecommand,"On");
		};
	};
	Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y-140);
		Def.ActorFrame {
			OnCommand=cmd(linear,0.5;y,-20;diffusealpha,0;linear,0.001;y,0;diffusealpha,1;queuecommand,"On");
			Def.Quad {
				ShowPressStartForOptionsCommand=cmd(stoptweening);
				InitCommand=cmd(scaletoclipped,14,5;diffuse,color("#dd8637");diffusealpha,1;rotationz,45;x,7.7;y,1.7);
			};
			Def.Quad {
				ShowPressStartForOptionsCommand=cmd(stoptweening);
				InitCommand=cmd(scaletoclipped,20,5;diffuse,color("#dd8637");diffusealpha,1;rotationz,-45;x,-4);
			};
		};
	};
	Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y+140;rotationz,180);
		Def.ActorFrame {
			OnCommand=cmd(linear,0.5;y,-20;diffusealpha,0;linear,0.001;y,0;diffusealpha,1;queuecommand,"On");
			Def.Quad {
				ShowPressStartForOptionsCommand=cmd(stoptweening);
				InitCommand=cmd(scaletoclipped,14,5;diffuse,color("#dd8637");diffusealpha,1;rotationz,45;x,7.7;y,1.7);
			};
			Def.Quad {
				ShowPressStartForOptionsCommand=cmd(stoptweening);
				InitCommand=cmd(scaletoclipped,20,5;diffuse,color("#dd8637");diffusealpha,1;rotationz,-45;x,-4);
			};
		};
	};
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+50);
		Def.Quad {
			InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,6);
			OnCommand=cmd(diffuse,color("#d8a97f"));
		};	
	};
	Def.ActorFrame {
	ShowPressStartForOptionsCommand=cmd(stoptweening);
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
	ShowPressStartForOptionsCommand=cmd(stoptweening);
	OnCommand=cmd(stoptweening;queuecommand,"Move");
	MoveCommand=cmd(x,SCREEN_CENTER_X+18;y,SCREEN_BOTTOM-60;linear,1;x,SCREEN_LEFT-18;sleep,1;queuecommand,"Move");
		Def.Quad {
			InitCommand=cmd(scaletoclipped,18,6);
			OnCommand=cmd(diffuse,color("#000000");diffusealpha,.5);
		};
	};
	Def.ActorFrame {
	ShowPressStartForOptionsCommand=cmd(stoptweening);
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
		InitCommand=cmd(y,SCREEN_CENTER_Y-50;x,SCREEN_CENTER_X+50;diffuse,color("#c3a545");strokecolor,color("#000000");zoom,2;zoomx,1;halign,1;uppercase,true;maxwidth,400);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:settext(song:GetDisplayMainTitle());
			else
				self:settext("");
			end
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-10;x,SCREEN_CENTER_X+50;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,.8;halign,1;uppercase,true;maxwidth,400);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:settext(song:GetDisplayArtist());
			else
				self:settext("");
			end
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-80;x,SCREEN_CENTER_X+50;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,.8;halign,1;uppercase,true;maxwidth,400);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:settext(song:GetDisplaySubTitle());
			else
				self:settext("");
			end
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y+10;x,SCREEN_CENTER_X+50;diffuse,color("#08ddcf");strokecolor,color("#000000");halign,1;uppercase,true;maxwidth,400);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				local bpm = {
					string.format("%.0f", song:GetDisplayBpms()[1]),
					string.format("%.0f", song:GetDisplayBpms()[2]),
				};
				if bpm[1] == bpm[2] then
					self:settext("BPM "..bpm[1])
				else
					self:settext("BPM "..bpm[1].."~"..bpm[2]);
				end
			else
				self:settext("");
			end
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_BOTTOM-30;x,SCREEN_CENTER_X;diffuse,color("#FFFFFF");uppercase,true;strokecolor,color("#000000"));
		Text="PICK A SONG";
	};
	LoadFont("Common Normal") .. {
		Text="MUSIC SELECT";
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