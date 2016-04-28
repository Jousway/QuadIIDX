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

THEME:GetThemeDisplayName()

function VersionSelect()
	local t = {
		Name = "Version";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = { 'Gold','HappySky' };		
		LoadSelections = function(self, list)
			local Load = RageFileUtil.CreateRageFile()
			Load:Open("Save/"..THEME:GetThemeDisplayName().."/version", 1)
			list[tonumber(Load:Read())] = true
			Load:Close()
		end;
		SaveSelections = function(self, list)
			for i in pairs(list) do
				if list[i] == true then
					Val = i
				end
			end
			local Save = RageFileUtil.CreateRageFile()
			Save:Open("Save/"..THEME:GetThemeDisplayName().."/version", 2)
			Save:Write(Val)
			Save:Close()
			THEME:ReloadMetrics()
		end;
	};
	return t;
end;

function LoadVersion()
	local Load = RageFileUtil.CreateRageFile()
	if FILEMAN:DoesFileExist("Save/"..THEME:GetThemeDisplayName().."/version") then
		Load:Open("Save/"..THEME:GetThemeDisplayName().."/version", 1)
		Read = Load:Read()
		Load:Close()
	else
		Read = "1"
	end
	return Read
end;

function TitleMenuScroll(self,offset,itemIndex,numItems)
	--GOLD
	if LoadVersion() == "1" then
		self:y((SCREEN_CENTER_Y)+32*(itemIndex-(numItems-1)/2))
		self:x(SCREEN_RIGHT-100)
	--HappySky
	elseif LoadVersion() == "2" then
		self:y(SCREEN_CENTER_Y+20)
		self:x((SCREEN_CENTER_X)+140*(itemIndex-(numItems-1)/2))
	else 
		self:y(32*(itemIndex-(numItems-1)/2))
	end
end