local t = Def.ActorFrame {};

local iidxgrade = {
	["Grade_Tier01"] = "AAA",
	["Grade_Tier02"] = "AA",
	["Grade_Tier03"] = "A",
	["Grade_Tier04"] = "B",
	["Grade_Tier05"] = "C",
	["Grade_Tier06"] = "D",
	["Grade_Tier07"] = "E",
	["Grade_Failed"] = "F",
}

t[#t+1] = Def.ActorFrame {	
	InitCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y-200);
	LoadFont("Common Normal") .. {
		Text=tonumber(string.format("%.0f", totaliidxscore));
		InitCommand=cmd(x,0;y,160);
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
		InitCommand=cmd(zoomto,280,90*1.6;diffuse,color("0,0.5,0,0.5");valign,0);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,280,20*1.6;diffuse,color("0.5,0,0,0.5");valign,1);
	};
};
local lifetable = {};
for i = 1,#iidxlifetable do
local iidxlinecolour = color("0,1,0,1")
if iidxlifetable[i] > 79 then
	iidxlinecolour = color("1,0,0,1")
end		
lifetable[i] = {{i/(#iidxlifetable/280), -iidxlifetable[i]*1.6, 0}, iidxlinecolour}
--[[t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-90;y,SCREEN_CENTER_Y+80);
	Def.Quad {
		InitCommand=cmd(zoomto,1,1;diffuse,color("0,0,0,1");y,-iidxlifetable[i];x,i/(#iidxlifetable/150));
	};
};--]]
end

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-140-240;y,SCREEN_CENTER_Y+80*1.6-200);
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
	InitCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y-200);
	LoadFont("Common Normal") .. {
		Text="DJ LEVEL";
		InitCommand=cmd(x,-115;y,80*1.6;zoomy,0.5;halign,0);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(x,107.5;y,40*1.6;halign,1;diffuse,color("#a2f1f3");strokecolor,color("#000000");zoom,4.5);
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