local t = Def.ActorFrame {};

local iidxgrade = {
	["Grade_Tier01"] = "AAAA",
	["Grade_Tier02"] = "AAA",
	["Grade_Tier03"] = "AA",
	["Grade_Tier04"] = "A",
	["Grade_Tier05"] = "B",
	["Grade_Tier06"] = "C",
	["Grade_Tier07"] = "D",
	["Grade_Tier08"] = "E",
	["Grade_Failed"] = "F",
}

t[#t+1] = Def.ActorFrame {	
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	LoadFont("Common Normal") .. {
		Text=tonumber(string.format("%.0f", totaliidxscore));
		InitCommand=cmd(x,0;y,-30);
		OnCommand=function(self)
			local stageaward = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetStageAward()
			if stageaward == "StageAward_FullComboW1" then
				self:settext("204620")
			elseif stageaward == "StageAward_FullComboW1" then
				self:settext(tonumber(string.format("%.0f", totaliidxscore))+3111)
			end
		end
	};
	Def.Quad {
		InitCommand=cmd(zoomto,150,90;diffuse,color("0,0.5,0,1");valign,0);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,150,20;diffuse,color("0.5,0,0,1");valign,1);
	};
};
local lifetable = {};
for i = 1,#iidxlifetable do
local iidxlinecolour = color("0,1,0,1")
if iidxlifetable[i] > 79 then
	iidxlinecolour = color("1,0,0,1")
end		
lifetable[i] = {{i/(#iidxlifetable/150), -iidxlifetable[i], 0}, iidxlinecolour}
--[[t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-75;y,SCREEN_CENTER_Y+80);
	Def.Quad {
		InitCommand=cmd(zoomto,1,1;diffuse,color("0,0,0,1");y,-iidxlifetable[i];x,i/(#iidxlifetable/150));
	};
};--]]
end

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-75;y,SCREEN_CENTER_Y+80);
	Def.ActorMultiVertex{
	OnCommand=function(self)
			self:SetDrawState{Mode="DrawMode_LineStrip"};
			self:SetLineWidth(1)
			self:SetVertices(lifetable)
			self:SetDrawState{First= 1, Num= #iidxlifetable}
		end,
	};
};

t[#t+1] = Def.ActorFrame {	
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	LoadFont("Common Normal") .. {
		Text="DJ LEVEL";
		InitCommand=cmd(x,-70;y,80;zoom,0.5;halign,0);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(x,60;y,60;halign,1;diffuse,0,0,1,1;strokecolor,color("#000000");zoom,2);
		OnCommand=function(self)
			if iidxlifetable[#iidxlifetable] > 79 then
				self:settext(iidxgrade[STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetGrade()])
			else
				self:settext("F")
			end
		end
	};
};

return t;