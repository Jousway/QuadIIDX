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

local iidxwidth = {
	["scratch"] = 79,
	["Key1"] = 48,
	["Key2"] = 38,
}

return function(button_list, stepstype, skin_params)
	local ret= {}
	local rots= {}
	for i, button in ipairs(button_list) do
		if iidxbutton[button] == nil then iidxbutton[button] = "Key1" end
		local column_frame= Def.ActorFrame{
			InitCommand= function(self)
				self:rotationz(rots[button] or 0)
					:draworder(newfield_draw_order.explosion)
			end,
			Def.ActorFrame{
				Def.Quad {InitCommand=cmd(scaletoclipped,iidxwidth[iidxbutton[button]],16)},
				InitCommand= function(self)
					self:visible(false)
				end,
				ColumnJudgmentCommand= function(self, param)
					local diffuse= {
						TapNoteScore_W1= {1, 1, 1, 1},
						TapNoteScore_W2= {1, 1, 1, 1},
						TapNoteScore_W3= {1, 1, 1, 1},
					}
					local exp_color= diffuse[param.tap_note_score or param.hold_note_score]
					if exp_color then
						self:stoptweening()
							:diffuse(exp_color):zoom(1):diffusealpha(0.9):visible(true)
							:linear(0.1):zoom(2):diffusealpha(0.3):linear(0.06):diffusealpha(0)
							:sleep(0):queuecommand("hide")
					end
				end,
				hideCommand= function(self)
					self:visible(false)
				end,
			},
			Def.Quad {
					InitCommand=function(self)
					self:scaletoclipped(iidxwidth[iidxbutton[button]],16)
					self:visible(false)
				end,
				HoldCommand= function(self, param)
					if param.start then
						self:finishtweening()
							:zoom(1):diffusealpha(1):visible(true)
					elseif param.finished then
						self:stopeffect():linear(0.06):diffusealpha(0)
							:sleep(0):queuecommand("hide")
					else
						self:zoom(1)
					end
				end,
				hideCommand= function(self)
					self:visible(false)
				end,
			},
		}
		ret[i]= column_frame
	end
	return ret
end
