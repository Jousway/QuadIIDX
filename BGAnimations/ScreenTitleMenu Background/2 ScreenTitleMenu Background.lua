return Def.ActorFrame {
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
};