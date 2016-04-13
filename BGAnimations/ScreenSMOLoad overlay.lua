local curgame = GAMESTATE:GetCurrentGame():GetName();

return Def.ActorFrame {
	OnCommand=function(self)
		ConnectToServer("67.205.57.190");
		--GAMESTATE:SetCurrentStyle(GAMEMAN:GetStylesForGame(curgame)[1]:GetName());
		--SCREENMAN:GetTopScreen():SetNextScreenName(SMOnlineScreen()):StartTransitioningScreen("SM_GoToNextScreen"); --5.1.0 code, broken for now
		SCREENMAN:GetTopScreen():SetNextScreenName("ScreenSelectStyle"):StartTransitioningScreen("SM_GoToNextScreen");
	end;
};

