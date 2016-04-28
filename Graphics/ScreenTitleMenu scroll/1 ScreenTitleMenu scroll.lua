local gc = Var("GameCommand");
return Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(y,0;x,-74;zoomto,16,16;rotationz,45);
		GainFocusCommand=cmd(x,-94;diffuse,color("#f8c430"));
		LoseFocusCommand=cmd(x,-74;diffuse,color("#919191"));
	};
	Def.Quad{
		InitCommand=cmd(y,0;x,74;zoomto,16,16;rotationz,45);
		GainFocusCommand=cmd(x,54;diffuse,color("#cd7b0d"));
		LoseFocusCommand=cmd(x,74;diffuse,color("#919191"));
	};
	Def.Quad{
		InitCommand=cmd(y,6;x,-6;zoomto,160,12);
		GainFocusCommand=cmd(x,-26;diffuse,color("#cd7b0d"));
		LoseFocusCommand=cmd(x,-6;diffuse,color("#919191"));
	};
	Def.Quad{
		InitCommand=cmd(y,-6;x,6;zoomto,160,12);
		GainFocusCommand=cmd(x,-14;diffuse,color("#f8c430"));
		LoseFocusCommand=cmd(x,6;diffuse,color("#919191"));
	};
	LoadFont("Common Normal") .. {
		Text=string.upper(THEME:GetString("ScreenTitleMenu",gc:GetText()));
		InitCommand=cmd(strokecolor,color("#000000"));
		GainFocusCommand=cmd(x,-20);
		LoseFocusCommand=cmd(x,0);
	};
};