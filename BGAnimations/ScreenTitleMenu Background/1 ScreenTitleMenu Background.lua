return Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#da934f"));
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#000000");fadebottom,0.8;diffusealpha,0.8);
	};
	Def.ActorFrame {
	InitCommand=cmd(rotationx,70;rotationy,-10);
	LoadFont("Common Normal") .. {
		Text="IIDXQUAD\nIIDXQUAD\nIIDXQUAD";
		InitCommand=cmd(diffuse,color("#000000");zoom,10;spin;effectmagnitude,0,0,10;diffusealpha,0.5);
	};
	};
};