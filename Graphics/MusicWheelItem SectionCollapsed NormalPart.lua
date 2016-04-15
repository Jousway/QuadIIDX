return Def.ActorFrame {	
	Def.Quad{
		InitCommand=cmd(zoomto,400,30;diffuse,color("0.5,0.5,0.5,0.5");halign,0;x,-35);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,400,28;diffuse,color("#2198cb");diffusealpha,0.5;halign,0;x,-28);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,5,28;diffuse,color("0,0,0,0.5");halign,0;x,-35);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(diffuse,color("#c3a545");strokecolor,color("#000000");halign,0;uppercase,true);
		CurrentSongChangedMessageCommand=function(self) 
			local Title = self:GetParent():GetParent()
			self:settext(Title:GetText()):maxwidth(200):x(-20)
		end;
	};
};