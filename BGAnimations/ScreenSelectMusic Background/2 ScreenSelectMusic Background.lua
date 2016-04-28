return Def.ActorFrame {
	InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("#85bec7"));
	};
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+200,100;rotationz,8);
		OnCommand=cmd(fadetop,0.5;fadebottom,0.5);
	};
	Def.ActorFrame {
		OnCommand=cmd(queuecommand,"Move");
		MoveCommand=cmd(zoom,1;x,-400;y,-50;accelerate,10;x,0;y,0;zoom,50;queuecommand,"Move");
		Def.Quad {	
			InitCommand=cmd(diffuse,1,1,1,0.2;scaletoclipped,20,20;rotationz,8);		
		};
	};
	Def.ActorFrame {
		OnCommand=cmd(sleep,2.5;queuecommand,"Move");
		MoveCommand=cmd(zoom,1;x,-400;y,-50;accelerate,10;x,0;y,0;zoom,50;queuecommand,"Move");
		Def.Quad {	
			InitCommand=cmd(diffuse,1,1,1,0.2;scaletoclipped,20,20;rotationz,8);		
		}
	};
	Def.ActorFrame {
		OnCommand=cmd(sleep,5;queuecommand,"Move");
		MoveCommand=cmd(zoom,1;x,-400;y,-50;accelerate,10;x,0;y,0;zoom,50;queuecommand,"Move");
		Def.Quad {	
			InitCommand=cmd(diffuse,1,1,1,0.2;scaletoclipped,20,20;rotationz,8);		
		}
	};
	Def.ActorFrame {
		OnCommand=cmd(sleep,7.5;queuecommand,"Move");
		MoveCommand=cmd(zoom,1;x,-400;y,-50;accelerate,10;x,0;y,0;zoom,50;queuecommand,"Move");
		Def.Quad {	
			InitCommand=cmd(diffuse,1,1,1,0.2;scaletoclipped,20,20;rotationz,8);		
		}
	};
};
