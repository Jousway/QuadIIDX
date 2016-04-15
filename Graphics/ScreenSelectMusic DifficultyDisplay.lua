local t = Def.ActorFrame {};

for idx,diff in pairs(Difficulty) do
	local sDifficulty = ToEnumShortString( diff );
	local tLocation = {
		Beginner	= 18*0.40,
		Easy 		= 18*1.46,
		Medium		= 18*2.52,
		Hard		= 18*3.58,
		Challenge	= 18*4.64,
		Edit 		= 18*5.70,
	};
	local tColour = {
		Beginner	= "#01c6f8",
		Easy 		= "#01c6f8",
		Medium		= "#f1a201",
		Hard		= "#f1a201",
		Challenge	= "#f00200",
		Edit 		= "#f00200",
	};
	t[#t+1] = Def.ActorFrame {
		SetCommand=function(self)
			local c = self:GetChildren();
			local song = GAMESTATE:GetCurrentSong()
			local bHasStepsTypeAndDifficulty = false;
			local meter = "";
			if song then
				local st = GAMESTATE:GetCurrentStyle():GetStepsType()
				bHasStepsTypeAndDifficulty = song:HasStepsTypeAndDifficulty( st, diff );
				local steps = song:GetOneSteps( st, diff );
				if steps then
					meter = steps:GetMeter();
					append = ""
				end
			end
			c.Meter:settext( meter );
			self:playcommand( bHasStepsTypeAndDifficulty and "Show" or "Hide" );
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		--
		Def.Quad{
		InitCommand=cmd(zoomto,30,15;y,tLocation[sDifficulty];diffuse,color("0,0,0,0.5"));
		};
		Def.Quad{
		InitCommand=cmd(zoomto,260,15;y,tLocation[sDifficulty];diffuse,color("0,0,0,0.5");x,-150);
		};
		LoadFont("StepsDisplay","Meter") .. {
			Name="Meter";
			ShowCommand=cmd(stoptweening;linear,0.1;diffuse,color( tColour[sDifficulty] ));
			HideCommand=cmd(stoptweening;decelerate,0.05;diffuse,color( tColour[sDifficulty] ));
			InitCommand=cmd(y,tLocation[sDifficulty];shadowlength,1;zoomy,0.5;diffuse,color( tColour[sDifficulty] ));
		};
	};
end
return t