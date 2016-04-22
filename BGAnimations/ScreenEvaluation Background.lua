return Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=function(self)
			if iidxlifetable[#iidxlifetable] > 79 then
				self:diffuse(color("#90eff6"))
			else
				self:diffuse(color("#ff0000"))
			end
		end
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#000000");fadetop,0.8;diffusealpha,0.8);
	};
};