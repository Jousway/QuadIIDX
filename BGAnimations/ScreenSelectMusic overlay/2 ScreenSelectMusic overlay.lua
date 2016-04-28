local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,80;diffuse,color("#000000");x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-40;fadetop,1;diffusealpha,0.8);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,80;diffuse,color("#000000");x,SCREEN_CENTER_X;y,SCREEN_TOP+40;fadebottom,1;diffusealpha,0.8);
	};
	LoadActor( THEME:GetPathG("ScreenSelectMusic","DifficultyDisplay") )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+20;y,SCREEN_CENTER_Y+20);
	};
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X+250;y,SCREEN_CENTER_Y-10);
		Def.Quad {
			ShowPressStartForOptionsCommand=cmd(stoptweening);
			InitCommand=cmd(scaletoclipped,376,34;diffuse,color("#dd8637");diffusealpha,0.5);
			OnCommand=cmd(linear,1;diffusealpha,0.2;linear,1;diffusealpha,0.5;queuecommand,"On");
		};
	};
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-300;y,SCREEN_CENTER_Y-145);
		Def.Quad {
			InitCommand=cmd(scaletoclipped,350,15;diffuse,color("#000000"));
		};
		Def.Quad {
			InitCommand=cmd(x,185;scaletoclipped,10,15;diffuse,color("#000000"));
		};
	};
	
	Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-305;y,SCREEN_CENTER_Y-190);
		Def.Quad {
			InitCommand=cmd(scaletoclipped,195,30;diffuse,color("#000000"));
		};
		Def.Quad {
			InitCommand=cmd(scaletoclipped,190,25;diffuse,color("#ff8d01"));
		};
		LoadFont("Common Normal") .. {
			Text="INFORMATION";
			InitCommand=cmd(diffuse,color("#000000");zoomy,0.6);
		};
		Def.Quad {
			InitCommand=cmd(x,110;scaletoclipped,15,15;diffuse,color("#000000"));
		};
		Def.Quad {
			InitCommand=cmd(x,110;scaletoclipped,13,13;diffuse,color("#727272"));
		};
		Def.Quad {
			InitCommand=cmd(x,110;scaletoclipped,9,9;diffuse,color("#000000"));
		};
		Def.Quad {
			InitCommand=cmd(x,110;scaletoclipped,7,7;diffuse,color("#d8d8d8"));
		};
		LoadFont("Common Normal") .. {
			Text="PICK A SONG";
			InitCommand=cmd(x,120;strokecolor,color("#000000");halign,0);
		};
	};
	Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+60;y,SCREEN_CENTER_Y-140);
		Def.ActorFrame {
			ShowPressStartForOptionsCommand=cmd(stoptweening);
			OnCommand=cmd(linear,0.5;y,-20;diffusealpha,0;linear,0.001;y,0;diffusealpha,1;queuecommand,"On");
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,0);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,5);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,-5;y,5);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,5;y,5);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,10);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,-10;y,10);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,10;y,10);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,15);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,20);};
		};
	};
	Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+60;y,SCREEN_CENTER_Y+140;rotationz,180);
		Def.ActorFrame {
			ShowPressStartForOptionsCommand=cmd(stoptweening);
			OnCommand=cmd(linear,0.5;y,-20;diffusealpha,0;linear,0.001;y,0;diffusealpha,1;queuecommand,"On");
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,0);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,5);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,-5;y,5);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,5;y,5);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,10);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,-10;y,10);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,10;y,10);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,15);};
			Def.Quad {InitCommand=cmd(scaletoclipped,4,4;diffuse,color("#ffffff");x,0;y,20);};
		};
	};
	
	Def.Quad {
		InitCommand=cmd(scaletoclipped,378,5;diffuse,color("#000000");x,SCREEN_CENTER_X+250;y,SCREEN_CENTER_Y+5);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,5,52;diffuse,color("#000000");x,SCREEN_CENTER_X+63;y,SCREEN_CENTER_Y-19);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,444,5;diffuse,color("#000000");x,SCREEN_CENTER_X-157;y,SCREEN_CENTER_Y-43);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,376,3;diffuse,color("#ffffff");x,SCREEN_CENTER_X+250;y,SCREEN_CENTER_Y+5);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,3,50;diffuse,color("#ffffff");x,SCREEN_CENTER_X+63;y,SCREEN_CENTER_Y-19);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,442,3;diffuse,color("#ffffff");x,SCREEN_CENTER_X-157;y,SCREEN_CENTER_Y-43);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-70;x,SCREEN_CENTER_X-40;diffuse,color("#fedc01");strokecolor,color("#000000");zoom,2;halign,1;maxwidth,170);
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
		InitCommand=cmd(y,SCREEN_CENTER_Y-30;x,SCREEN_CENTER_X-40;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,.8;halign,1;maxwidth,400);
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
		InitCommand=cmd(y,SCREEN_CENTER_Y-100;x,SCREEN_CENTER_X-40;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,.8;halign,1;maxwidth,400);
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
		Text="BPM";
		InitCommand=cmd(y,SCREEN_CENTER_Y-80;x,SCREEN_CENTER_X+30;diffuse,color("#08ddcf");strokecolor,color("#000000");zoomx,1.3;zoomy,0.8;halign,1);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-60;x,SCREEN_CENTER_X+50;diffuse,color("#08ddcf");strokecolor,color("#000000");halign,1;zoomx,1.3;zoomy,0.8;maxwidth,400);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:settext(string.format("%.0f", song:GetDisplayBpms()[1]))
			else
				self:settext("")
			end
		end;
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-30;x,SCREEN_CENTER_X+50;diffuse,color("#08ddcf");strokecolor,color("#000000");halign,1;zoomx,1.3;zoomy,0.8;maxwidth,400);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:GetDisplayBpms()[2] == song:GetDisplayBpms()[1] then
					self:settext("")
				else
					self:settext(string.format("%.0f", song:GetDisplayBpms()[2]))
				end
			else
				self:settext("")
			end
		end;
	};
	LoadFont("Common Normal") .. {
		Text="    USIC SELECT";
		InitCommand=cmd(y,SCREEN_TOP+15;x,SCREEN_LEFT+20;diffuse,color("#ffffff");zoomx,1.5;zoomy,0.8;halign,0);
	};
	LoadFont("Common Normal") .. {
		Text="M";
		InitCommand=cmd(y,SCREEN_TOP+15;x,SCREEN_LEFT+20;diffuse,color("#ff8d01");zoomx,1.5;zoomy,0.8;halign,0);
	};
};

local border = {
	{{20, 70, 0}, color("1,1,1,0.8")},
	{{20, 30, 0}, color("1,1,1,0.8")},
	{{SCREEN_CENTER_X-80, 30, 0}, color("1,1,1,0.8")},
	{{SCREEN_CENTER_X-50, 10, 0}, color("1,1,1,0.8")},
	{{SCREEN_RIGHT-20, 10, 0}, color("1,1,1,0.8")},
	{{SCREEN_RIGHT-20, 70, 0}, color("1,1,1,0.8")},
	{{20, 70, 0}, color("1,1,1,0.8")},
	{{20, SCREEN_BOTTOM-20, 0}, color("1,1,1,0.8")},
	{{SCREEN_CENTER_X-120, SCREEN_BOTTOM-20, 0}, color("1,1,1,0.8")},
	{{SCREEN_CENTER_X-90, SCREEN_BOTTOM-40, 0}, color("1,1,1,0.8")},
	{{SCREEN_CENTER_X+90, SCREEN_BOTTOM-40, 0}, color("1,1,1,0.8")},
	{{SCREEN_CENTER_X+120, SCREEN_BOTTOM-20, 0}, color("1,1,1,0.8")},
	{{SCREEN_RIGHT-20, SCREEN_BOTTOM-20, 0}, color("1,1,1,0.8")},
	{{SCREEN_RIGHT-20, 70, 0}, color("1,1,1,0.8")},
}

t[#t+1] = Def.ActorFrame {
	Def.ActorMultiVertex{
	OnCommand=function(self)
			self:SetDrawState{Mode="DrawMode_LineStrip"};
			self:SetLineWidth(2)
			self:SetVertices(border)
			self:SetDrawState{First= 1, Num= #border}
		end,
	};
};

return t;
