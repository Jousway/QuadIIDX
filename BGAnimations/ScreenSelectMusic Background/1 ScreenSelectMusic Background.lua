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
	InitCommand=cmd(rotationx,10;rotationy,0);
	LoadFont("Common Normal") .. {
		Text="IIDXQUAD IIDXQUAD\nIIDXQUAD IIDXQUAD\nIIDXQUAD IIDXQUAD";
		InitCommand=cmd(diffuse,color("#000000");zoom,4;spin;effectmagnitude,0,15,0;diffusealpha,0.5);
	};
	};
	Def.ActorFrame {
	InitCommand=cmd(rotationx,10;rotationy,90);
	LoadFont("Common Normal") .. {
		Text="IIDXQUAD IIDXQUAD\nIIDXQUAD IIDXQUAD\nIIDXQUAD IIDXQUAD";
		InitCommand=cmd(diffuse,color("#000000");zoom,4;spin;effectmagnitude,0,15,0;diffusealpha,0.5);
	};
	};
};