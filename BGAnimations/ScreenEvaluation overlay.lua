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

local st = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
local scorename = {
	["GREAT2"] = st:GetTapNoteScores("TapNoteScore_W1"),
	["GREAT"] = st:GetTapNoteScores("TapNoteScore_W2"),
	["GOOD"] = st:GetTapNoteScores("TapNoteScore_W3"),
	["BAD"] = st:GetTapNoteScores("TapNoteScore_W4"),
	["POOR"] = st:GetTapNoteScores("TapNoteScore_W5")+st:GetTapNoteScores("TapNoteScore_Miss"),
	["TOTAL SCORE"] = totaliidxscore,
	["TOTAL NOTES"] = radarvalue("RadarCategory_Notes"),
	["MAXCOMBO"] = st:MaxCombo(),
}

local scorehighest = {
	st:GetTapNoteScores("TapNoteScore_W1"),
	st:GetTapNoteScores("TapNoteScore_W2"),
	st:GetTapNoteScores("TapNoteScore_W3"),
	st:GetTapNoteScores("TapNoteScore_W4"),
	st:GetTapNoteScores("TapNoteScore_W5")+st:GetTapNoteScores("TapNoteScore_Miss"),
}

local gethighestscore = math.max(unpack(scorehighest))

local function iidxline(pos1,pos2,width,text,scoremode,flash)
	local text2
	if flash then
		text2 = "GREAT2"
	else
		text2 = text
	end
	return Def.ActorFrame {	
		Def.Quad {
			InitCommand=cmd(halign,0;y,pos1;x,-(pos2+1.25);zoomto,width+2.5,25;diffuse,color("#000000"));
		};
		Def.Quad {
			InitCommand=cmd(halign,0;y,pos1;x,-pos2;zoomto,width,22.5;diffuse,color("#4a575d"));
		};
		Def.Quad {
			InitCommand=cmd(halign,0;y,pos1;x,-pos2;zoomto,5,15;diffuse,color("0,0,0,0"));
			OnCommand=function(self)
				if scoremode then
					self:diffuse(color("0,0,0,1"))
					if scorename[text2] == gethighestscore then
						self:diffuseblink():effectperiod(0.1):effectcolor1(color("0,0,0,1")):effectcolor2(color("#ffd73c"))
					end
				end
			end;
		};
		LoadFont("Common Normal") .. {
			Text="0000";
			InitCommand=cmd(halign,1;y,pos1;x,(width-pos2-10);zoomx,1.6;diffuse,color("#05c5db");strokecolor,color("#000000");diffusealpha,0.5);
			OnCommand=function(self)
				if string.find(text, "SCORE") then
					self:settext("000000")
				end
			end
		};
		Def.Quad {
			InitCommand=cmd(halign,1;y,pos1;x,(width-pos2);zoomto,33,22.5;diffuse,color("#4a575d"));
			OnCommand=function(self)
			if scorename[text2] > 99999 then
				self:zoomto(145,22.5)
			elseif scorename[text2] > 9999 then
				self:zoomto(122.5,22.5)
			elseif scorename[text2] > 999 then
				self:zoomto(100,22.5)
			elseif scorename[text2] > 99 then
				self:zoomto(77.5,22.5)
			elseif scorename[text2] > 9 then
				self:zoomto(55,22.5)
			else
				self:zoomto(32.5,22.5)
			end
			self:sleep(0.01)
			self:queuecommand("On")
		end;
		};
		LoadFont("Common Normal") .. {
			Text=text;
			InitCommand=cmd(halign,0;y,pos1;x,-(pos2-10);zoomx,0.7;zoomy,0.6);
			OnCommand=function(self)
				if scoremode then
					self:x(-(pos2-20))
					self:zoomx(1)
				end
				if flash then
					self:diffuseblink():effectperiod(0.1):effectcolor1(color("#f85890")):effectcolor2(color("#5888f8"))
				end
			end;
		};
		LoadFont("Common Normal") .. {
			InitCommand=cmd(halign,1;y,pos1;x,(width-pos2-10);zoomx,1.6;diffuse,color("#05c5db");strokecolor,color("#000000"));
			OnCommand=function(self)
				if string.find(text, "TOTAL SCORE") then
					local stageaward = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetStageAward()
					if stageaward == "StageAward_FullComboW1" then
						self:settext("204620")
					elseif iidxlifetable[#iidxlifetable] == 80 and stageaward == "StageAward_FullComboW2" then
						self:settext(tonumber(string.format("%.0f", totaliidxscore))+11900)
					elseif stageaward == "StageAward_FullComboW2" then
						self:settext(tonumber(string.format("%.0f", totaliidxscore))+3111)
					elseif iidxlifetable[#iidxlifetable] == 80 then
						self:settext(tonumber(string.format("%.0f", totaliidxscore))+5730)
					else
						self:settext(tonumber(string.format("%.0f", totaliidxscore)))
					end
				elseif string.find(text, "TOTAL NOTES") then
					self:settext(radarvalue("RadarCategory_Notes"))
				elseif string.find(text, "MAXCOMBO") then
					self:settext(st:MaxCombo())
				elseif string.find(text, "GREAT") then
					if flash then 
						self:settext(st:GetTapNoteScores("TapNoteScore_W1"))
					else
						self:settext(st:GetTapNoteScores("TapNoteScore_W2"))
					end
				elseif string.find(text, "GOOD") then
					self:settext(st:GetTapNoteScores("TapNoteScore_W3"))
				elseif string.find(text, "BAD") then
					self:settext(st:GetTapNoteScores("TapNoteScore_W4"))
				elseif string.find(text, "POOR") then
					self:settext(st:GetTapNoteScores("TapNoteScore_W5")+st:GetTapNoteScores("TapNoteScore_Miss"))
				else
					self:settext("0")
				end
			end
		};
	};
	
end

t[#t+1] = Def.ActorFrame {	
	InitCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y-190);
	Def.Quad {
		InitCommand=cmd(y,60;x,-5;zoomto,310,207.5;diffuse,color("0,0,0,1"));
	};
	Def.Quad {
		InitCommand=cmd(y,60;x,-152.5;zoomto,2.5,195;diffuse,color("#ffd73c"));
	};
	Def.Quad {
		InitCommand=cmd(zoomto,290,80*1.85;diffuse,color("0,0.5,0,0.5");valign,0);
	};
	Def.Quad {
		InitCommand=cmd(zoomto,290,20*1.85;diffuse,color("0.5,0,0,0.5");valign,1);
	};	
		
	iidxline(180,150,270,"STAGE SCORE");
	iidxline(205,150,230,"TOTAL NOTES");
	iidxline(230,150,230,"MAXCOMBO");
	
	iidxline(265,150,210,"GREAT",true,true);
	iidxline(290,150,210,"GREAT",true);
	iidxline(315,150,210,"GOOD",true);
	iidxline(340,150,210,"BAD",true);
	iidxline(365,150,210,"POOR",true);
	
	iidxline(395,170,270,"TOTAL SCORE");
};
local lifetable = {};
for i = 1,#iidxlifetable do
	local iidxlinecolour = color("0,1,0,1")
	if iidxlifetable[i] > 79 then
		iidxlinecolour = color("1,0,0,1")
	end		
	lifetable[i] = {{i/(#iidxlifetable/290), -iidxlifetable[i]*1.85, 0}, iidxlinecolour}
end

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-145-240;y,SCREEN_CENTER_Y+80*1.85-190);
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
	InitCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y-190);
	LoadFont("Common Normal") .. {
		Text="DJ LEVEL";
		InitCommand=cmd(x,-132.5;y,132.5;zoomx,1.25;zoomy,0.5;halign,0);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(x,132.5;y,75;halign,1;diffuse,color("#a2f1f3");strokecolor,color("#000000");zoom,4.5;zoomx,5.5);
		OnCommand=function(self)
			if iidxlifetable[#iidxlifetable] > 79 then
				self:settext(iidxgrade[STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetGrade()])
			else
				self:settext("F")
			end
		end
	};
	LoadFont("Common Normal") .. {
		Text="PLAYER01 SCORE REPORT";
		InitCommand=cmd(x,-140;y,155;zoomx,0.6;zoomy,0.4;halign,0);
	};
};

return t;