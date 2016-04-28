return Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=function(self)
			if iidxlifetable[#iidxlifetable] > 79 then
				self:diffuse(color("#376eac"))
			else
				self:diffuse(color("#8c5044"))
			end
		end
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#000000");fadetop,0.8;diffusealpha,0.8);
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT;fadebottom,0.8;diffusealpha,0.8);
		OnCommand=function(self)
			if iidxlifetable[#iidxlifetable] > 79 then
				self:diffuse(color("#93f2f8"))
			else
				self:diffuse(color("#f7a4ab"))
			end
		end
	};
};