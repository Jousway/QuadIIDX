return Def.ActorFrame {	
	Def.Quad{
		InitCommand=cmd(zoomto,310,70;diffuse,color("0.5,0.5,0.5,0.5"));
	};
	Def.ActorFrame {
		InitCommand=cmd(diffusealpha,0.5);
		Def.Quad{
			InitCommand=cmd(zoomto,305,65;rainbow);
		};
	};
};