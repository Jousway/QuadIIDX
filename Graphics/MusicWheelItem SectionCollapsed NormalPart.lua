return Def.ActorFrame {	
	Def.Quad{
		InitCommand=cmd(zoomto,400,30;diffuse,color("0.3,0.3,0.3,1");halign,0;x,-35);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,400,28;diffuse,color("#2198cb");halign,0;x,-28);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,5,28;diffuse,color("0.2,0.2,0.2,1");halign,0;x,-35);
	};
	LoadFont("Common Normal") .. {
		Text="VERSION";
		InitCommand=cmd(diffuse,color("#03dafa");strokecolor,color("#000000");halign,0;uppercase,true;x,200;zoom,0.8);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(diffuse,color("#ffffff");strokecolor,color("#000000");halign,0;uppercase,true);
		CurrentSongChangedMessageCommand=function(self) 
			local Title = self:GetParent():GetParent()
			self:settext(Title:GetText()):maxwidth(200):x(-20)
		end;
		SetCommand=function(self) 
			local Title = self:GetParent():GetParent()
			self:settext(Title:GetText()):maxwidth(200):x(-20)
		end;
	};
};