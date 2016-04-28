if GAMESTATE:IsHumanPlayer(PLAYER_1) then
		songinfo = GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptionsString("ModsLevel_Preferred");
else
	songinfo = GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptionsString("ModsLevel_Preferred");
end

if string.find(songinfo, "Reverse") then
	revbut = (64+16)/2;
	fbot = 0;
	ftop = 1;
	bf = -((32+16)/2);
	pf = -((320+16)/2);
else
	revbut = -(64+16)/2;
	fbot = 1;
	ftop = 0;
	bf = ((32+16)/2);
	pf = ((320+16)/2);
end;

local iidxbutton = {
	--iidx
	["scratch"] = "scratch",
	["Key2"] = "Key2",
	["Key4"] = "Key2",
	["Key6"] = "Key2",
	--popn
	["Left Yellow"] = "Key2",
	["Left Blue"] = "Key2",
	["Right Blue"] = "Key2",
	["Right Yellow"] = "Key2",
}

local iidxbutt = {
	["Key1"] = {
		"1,1,1,1",
		10,
		"0.2,0.2,0.2,0.7",
	}, 
	["Key2"] = {
		"0.6,0.6,0.6,1",
		0,
		"0,0,0,0.7",
	},
	["scratch"] = {
		"0,0,0,0",
		0,
		"0,0,0,0.7",
	},
}

local iidxwidth = {
	["scratch"] = 79,
	["Key1"] = 48,
	["Key2"] = 38,
}

return function(button_list, stepstype, skin_parameters)
	local ret= {}
	local rots= {}
	for i, button in ipairs(button_list) do
		if iidxbutton[button] == nil then iidxbutton[button] = "Key1" end
		ret[i]= Def.ActorFrame {
			--back plate
			Def.ActorFrame {
				InitCommand=cmd(diffuse,color(iidxbutt[iidxbutton[button]][3]));
				Def.Quad {
					InitCommand=cmd(scaletoclipped,iidxwidth[iidxbutton[button]],99*999;valign,ftop);
					OnCommand=cmd();
				};
			};
			Def.ActorFrame {
				InitCommand=cmd(x,-iidxwidth[iidxbutton[button]]/2;diffuse,color("1,1,1,1.7"));
				Def.Quad {
					InitCommand=cmd(scaletoclipped,4,99*999;faderight,0.5;cropleft,0.5;valign,ftop);
					OnCommand=cmd();
				};
			};
			Def.ActorFrame {
				InitCommand=cmd(x,iidxwidth[iidxbutton[button]]/2;diffuse,color("1,1,1,1.7"));
				Def.Quad {
					InitCommand=cmd(scaletoclipped,4,99*999;fadeleft,0.5;cropright,0.5;valign,ftop);
					OnCommand=cmd();
				};
			};
			
			--red bar
			Def.ActorFrame {
				InitCommand=cmd(diffuse,color("1,0,0,1"));
				Def.Quad {
					InitCommand=cmd(scaletoclipped,iidxwidth[iidxbutton[button]],16);
					OnCommand=cmd();
				};
			};
			Def.ActorFrame {
				InitCommand=cmd(diffuse,color("0.8,0,0,1"));
				Def.Quad {
					InitCommand=cmd(fadetop,1;scaletoclipped,iidxwidth[iidxbutton[button]],16);
					OnCommand=cmd();
				};
			};
			
			--button
			Def.ActorFrame {
				InitCommand=cmd(y,revbut);
			Def.ActorFrame {
				InitCommand=cmd(diffuse,color("0,0,0,1"));
				Def.Quad {
					InitCommand=cmd(scaletoclipped,iidxwidth[iidxbutton[button]],64);
					OnCommand=cmd();
				};
			};
			Def.ActorFrame {
				InitCommand=cmd(y,-5+iidxbutt[iidxbutton[button]][2];diffuse,color(iidxbutt[iidxbutton[button]][1]));
				Def.Quad {
					InitCommand=cmd(scaletoclipped,32,42);
					OnCommand=cmd();
				};
			};
			};
			
			--Flash AAAAAAAHHHHHHHHHAAAAAAAAAAAAAAHHHHHHHHHAAAAAAAA --flash gordon was here
			Def.ActorFrame {
				InitCommand=cmd(y,bf;diffuseshift;effectcolor1,color("0.4,1,0.4,1");effectcolor2,color("0.4,1,0.4,0");effectclock,'beat';effecttiming,0.7,0,0.3,0);
				Def.Quad {
					InitCommand=cmd(scaletoclipped,iidxwidth[iidxbutton[button]],32;fadebottom,fbot;fadetop,ftop);
					OnCommand=cmd();
				};
			};
			Def.ActorFrame {
				InitCommand=cmd(diffuse,color("0.4,0.4,1,0"));
				BeatUpdateCommand= function(self, param)
					if param.pressed then
						self:queuecommand("Press")
					elseif param.lifted then
						self:queuecommand("Lift")
					end
				end,
				PressCommand=cmd(diffuse,color("0.4,0.4,1,0.7"));
				LiftCommand=cmd(diffuse,color("0.4,0.4,1,0"));
				Def.Quad {
					InitCommand=cmd(y,pf;scaletoclipped,iidxwidth[iidxbutton[button]],320;fadebottom,fbot;fadetop,ftop);
					OnCommand=cmd();
				};
			};
			InitCommand= function(self)
				self:draworder(newfield_draw_order.receptor)
			end,
			WidthSetCommand= function(self, param)
				param.column:set_layer_fade_type(self, "FieldLayerFadeType_Receptor")
			end,
		}
	end
	return ret
end
