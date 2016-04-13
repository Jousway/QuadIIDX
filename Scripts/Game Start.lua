local curgame = GAMESTATE:GetCurrentGame():GetName();

sets2 = {
	dance = 5, -- solo
	pump = 4, -- double
	kb7 = 2, -- versus
	beat = 4, -- 7 key
	popn = 2, -- 9 key
}

SelectStyle = function()
	local style = GAMEMAN:GetStylesForGame(curgame)[1]:GetName()
	return style
end

SelectStyle2 = function()
	local style2 = GAMEMAN:GetStylesForGame(curgame)[sets2[curgame]]:GetName()
	--local style2 = GAMEMAN:GetStylesForGame(curgame)[2]:GetName()
	return style2
end