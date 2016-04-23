local skin_name= Var("skin_name")

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

local iidxcolour = {
	["scratch"] = {
		"0.6,0,0,1",
		"0.2,0,0,1",
		"0.4,0,0,1",
	},
	["Key1"] = {
		"0.6,0.6,0.6,1",
		"0.2,0.2,0.2,1",
		"0.4,0.4,0.4,1",
	},
	["Key2"] = {
		"0,0,0.6,1",
		"0,0,0.2,1",
		"0,0,0.4,1",
	},
}

local iidxwidth = {
	["scratch"] = 79,
	["Key1"] = 48,
	["Key2"] = 38,
}

return function(button_list, stepstype)
	local rots= {}
	local hold_flips= {
		Left= "TexCoordFlipMode_None", Right= "TexCoordFlipMode_None",
		Down= "TexCoordFlipMode_None", Up= "TexCoordFlipMode_None",
	}
	local roll_flips= {
		Left= "TexCoordFlipMode_None", Right= "TexCoordFlipMode_None",
		Down= "TexCoordFlipMode_None", Up= "TexCoordFlipMode_None",
	}
	local rev_hold_flips= {
		Left= "TexCoordFlipMode_None", Right= "TexCoordFlipMode_None",
		Down= "TexCoordFlipMode_None", Up= "TexCoordFlipMode_None",
	}
	local rev_roll_flips= {
		Left= "TexCoordFlipMode_None", Right= "TexCoordFlipMode_None",
		Down= "TexCoordFlipMode_None", Up= "TexCoordFlipMode_None",
	}
	local parts_per_beat= 48
	local empty_state_map= NewSkin.generic_state_map(1, {1})
	local lift_state_map= {
		parts_per_beat= parts_per_beat, quanta= {
			{per_beat= 1, states= {5, 6, 7, 8}}, -- 4th
			{per_beat= 2, states= {13, 14, 15, 16}}, -- 8th
			{per_beat= 3, states= {21, 22, 23, 24}}, -- 12th
			{per_beat= 4, states= {29, 30, 31, 32}}, -- 16th
			{per_beat= 6, states= {37, 38, 39, 40}}, -- 24th
			{per_beat= 8, states= {45, 46, 47, 48}}, -- 32nd
			{per_beat= 12, states= {53, 54, 55, 56}}, -- 48th
			{per_beat= 16, states= {61, 62, 63, 64}}, -- 64th
		},
	}
	local hold_length= {
		start_note_offset= -.5,
		end_note_offset= .5,
		head_pixs= 32,
		body_pixs= 1,
		tail_pixs= 32
	}
	local mine_state_map= NewSkin.generic_state_map(8, {1})
	local active_state_map= {
		parts_per_beat= parts_per_beat, quanta= {
			{per_beat= 1, states= {1}},
		},
	}
	local inactive_state_map= {
		parts_per_beat= parts_per_beat, quanta= {
			{per_beat= 1, states= {2}},
		},
	}
	local columns= {}
	for i, button in ipairs(button_list) do
		if iidxbutton[button] == nil then iidxbutton[button] = "Key1" end
		local hold_tex= "hold 2x1.png"
		local roll_tex= "roll 2x1.png"
		columns[i]= {
			width= iidxwidth[iidxbutton[button]] ,
			anim_time= 1,
			anim_uses_beats= true,
			padding= 0,
			taps= {
				NewSkinTapPart_Tap= {
					state_map= empty_state_map,
					actor= Def.ActorFrame {
						Def.ActorFrame {
							InitCommand=function(self)
								self:diffuse(color(iidxcolour[iidxbutton[button]][1]));
							end;
							Def.Quad {
								InitCommand=cmd(;scaletoclipped,iidxwidth[iidxbutton[button]],16;cropbottom,0.5);
							};
						};
						Def.ActorFrame {
							InitCommand=function(self)
								self:diffuse(color(iidxcolour[iidxbutton[button]][2]));
							end;
							Def.Quad {
								InitCommand=cmd(;scaletoclipped,iidxwidth[iidxbutton[button]],16;croptop,0.5);
							};
						};
						Def.ActorFrame {
							InitCommand=function(self)
								self:diffuse(color(iidxcolour[iidxbutton[button]][3]));
							end;
							Def.Quad {
								InitCommand=cmd(;scaletoclipped,iidxwidth[iidxbutton[button]],16;fadetop,0.3;fadebottom,0.3);
							};
						};
						Def.ActorFrame {
							InitCommand=function(self)
								self:diffuse(color("1,1,1,0.8"));
							end;
							Def.Quad {
								InitCommand=cmd(;scaletoclipped,iidxwidth[iidxbutton[button]],16;fadeleft,0.5;faderight,1;blend,"add");
							};
						};
					};--]]
					},
				NewSkinTapPart_Mine= {
					state_map= mine_state_map,
					actor= Def.Sprite{Texture= "mine 8x1.png"}},
				NewSkinTapPart_Lift= { -- fuck lifts
					state_map= mine_state_map,
					actor= Def.Sprite{Texture= "mine 8x1.png"}},
			},
			holds= {
				TapNoteSubType_Hold= {
					{
						state_map= inactive_state_map,
						textures= {hold_tex},
						flip= hold_flips[button],
						length_data= hold_length,
					},
					{
						state_map= active_state_map,
						textures= {hold_tex},
						flip= hold_flips[button],
						length_data= hold_length,
					},
				},
				TapNoteSubType_Roll= {
					{
						state_map= inactive_state_map,
						textures= {roll_tex},
						flip= roll_flips[button],
						length_data= hold_length,
					},
					{
						state_map= active_state_map,
						textures= {roll_tex},
						flip= roll_flips[button],
						length_data= hold_length,
					},
				},
			},
			reverse_holds= {
				TapNoteSubType_Hold= {
					{
						state_map= inactive_state_map,
						textures= {hold_tex},
						flip= rev_hold_flips[button],
						length_data= hold_length,
					},
					{
						state_map= active_state_map,
						textures= {hold_tex},
						flip= rev_hold_flips[button],
						length_data= hold_length,
					},
				},
				TapNoteSubType_Roll= {
					{
						state_map= inactive_state_map,
						textures= {roll_tex},
						flip= rev_roll_flips[button],
						length_data= hold_length,
					},
					{
						state_map= active_state_map,
						textures= {roll_tex},
						flip= rev_roll_flips[button],
						length_data= hold_length,
					},
				},
			},
		}
	end
	return {
		columns= columns,
		vivid_operation= true, -- output 200%
	}
end
