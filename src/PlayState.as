package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		public static var floor1:FlxTilemap;
		public static var floorW1:FlxTilemap;
		public static var floorW2:FlxTilemap;
		public static var floorW3:FlxTilemap;
		public static var floorW4:FlxTilemap;
		private var floorWB:FlxTilemap;
		public static var stairsUp1:FlxSprite;
		public static var stairsUp2:FlxSprite;
		public static var stairsUp3:FlxSprite;
		public static var stairsUp4:FlxSprite;
		public static var stairsUp5:FlxSprite;
		public static var stairsUp6:FlxSprite;
		public static var stairsDn1:FlxSprite;
		public static var stairsDn2:FlxSprite;
		public static var stairsDn3:FlxSprite;
		public static var stairsDn4:FlxSprite;
		public static var stairsDn5:FlxSprite;
		public static var stairsDn6:FlxSprite;
		public static var player:Player;
		private var light:Light;
		private var t:FlxTimer = new FlxTimer();
		private var t2:FlxTimer = new FlxTimer();
		private var hudPanel:FlxSprite;
		public static var hudMatches:FlxText;
		private var hudFloor:FlxText;
		private var hudLives:FlxText;
		private var hudFullUrn:FlxSprite;
		private var hudUrnRightSide:FlxSprite;
		private var hudUrnLeftSide:FlxSprite;
		private var hudUrnLeftHandle:FlxSprite;
		private var hudUrnRightHandle:FlxSprite;
		private var hudUrnHandles:FlxSprite;
		private var hudMiddleOfUrn:FlxSprite;
		private var hudScepter:FlxSprite;
		private var hudKey:FlxSprite;
		private var onStairs:Boolean = false;
		private var scepter:Scepter;
		private var urnLeft:UrnLeft;
		private var urnRight:UrnRight;
		private var urnHandles:UrnHandles;
		private var urnMiddle:UrnMiddle;
		private var urnMiddleLeft:UrnMiddleLeft;
		private var urnMiddleRight:UrnMiddleRight;
		private var urnFull:FullUrn;
		private var masterKey:MasterKey;
		private var choices:Array = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
		private var tempX:int;
		private var tempY:int;
		private	var tempFloor:int;
		private var tmpRnd:int;
		private var haveLeftUrnHandle:Boolean = false;
		private var haveRightUrnHandle:Boolean = false;
		private var haveBothUrnHandles:Boolean = false;
		private var haveMiddleOfUrn:Boolean = false;
		private var haveMiddleAndLeft:Boolean = false;
		private var haveMiddleAndRight:Boolean = false;
		private var haveFullUrn:Boolean = false;
		public static var haveScepter:Boolean = false;
		private var haveKey:Boolean = false;
		private var hudItemNum:int = 0;
		private var gameOver:Boolean = false;
		private var invEmpty:Boolean = true;
		private var bat:Bat;
		private var ghost:Ghost;
		private var spider1:Spider;
		
		override public function create():void
		{	
			initGame();
			
			floor1 = new FlxTilemap;
			floor1.loadMap( new Registry.f1,Registry.buildTile,16,16,0,0,1,6);
			add(floor1);

			stairsUp1 = new FlxSprite(3*16,1*16,Registry.bs); 
			add(stairsUp1);
			stairsUp1.immovable = true;
			stairsUp1.kill();
			
			stairsUp2 = new FlxSprite(8*16,1*16,Registry.bs);
			add(stairsUp2);
			stairsUp2.immovable = true;
			stairsUp2.kill();
			
			stairsUp3 = new FlxSprite(0*16,9*16,Registry.bs);
			add(stairsUp3);
			stairsUp3.immovable = true;
			stairsUp3.kill();
			
			stairsUp4 = new FlxSprite(11*16,9*16,Registry.bs);
			add(stairsUp4);
			stairsUp4.immovable = true;
			stairsUp4.kill();
			
			stairsUp5 = new FlxSprite(3*16,17*16,Registry.bs);
			add(stairsUp5);
			stairsUp5.immovable = true;
			stairsUp5.kill();
			
			stairsUp6 = new FlxSprite(8*16,17*16,Registry.bs);
			add(stairsUp6);
			stairsUp6.immovable = true;
			stairsUp6.kill();
			
			stairsDn1 = new FlxSprite(3*16,1*16,Registry.bs);
			add(stairsDn1);
			stairsDn1.immovable = true;
			stairsDn1.kill();
			
			stairsDn2 = new FlxSprite(8*16,1*16,Registry.bs);
			add(stairsDn2);
			stairsDn2.immovable = true;
			stairsDn2.kill();
			
			stairsDn3 = new FlxSprite(0*16,9*16,Registry.bs);
			add(stairsDn3);
			stairsDn3.immovable = true;
			stairsDn3.kill();
			
			stairsDn4 = new FlxSprite(11*16,9*16,Registry.bs);
			add(stairsDn4);
			stairsDn4.immovable = true;
			stairsDn4.kill();
			
			stairsDn5 = new FlxSprite(3*16,17*16,Registry.bs);
			add(stairsDn5);
			stairsDn5.immovable = true;
			stairsDn5.kill();
			
			stairsDn6 = new FlxSprite(8*16,17*16,Registry.bs);
			add(stairsDn6);
			stairsDn6.immovable = true;
			stairsDn6.kill();
			
			light = new Light(0,0);
			add(light);
			light.kill();
			
			tmpRnd = Math.floor(Math.random()*100)+1;
			if(tmpRnd <= 50)
				tmpRnd = 3; 
			else
				tmpRnd = 8
			
			bat = new Bat(tmpRnd,15);
			add(bat);
			
			tmpRnd = Math.floor(Math.random()*100)+1;
			if(tmpRnd <= 50)
				tmpRnd = 3; 
			else
				tmpRnd = 8
			
			ghost = new Ghost(tmpRnd,2);
			add(ghost);
					
			spider1 = new Spider(3,9);
			add(spider1);
			
			floorW1 = new FlxTilemap;
			floorW1.loadMap( new Registry.fw1,Registry.buildTile,16,16,0,0,1,6);
			add(floorW1);
			
			floorW2 = new FlxTilemap;
			floorW2.loadMap( new Registry.fw2,Registry.buildTile,16,16,0,0,1,6);
			add(floorW2);
			
			floorW3 = new FlxTilemap;
			floorW3.loadMap( new Registry.fw3,Registry.buildTile,16,16,0,0,1,6);
			add(floorW3);
			
			floorW4 = new FlxTilemap;
			floorW4.loadMap( new Registry.fw4,Registry.buildTile,16,16,0,0,1,6);
			add(floorW4);
		
			floorWB = new FlxTilemap;
			floorWB.loadMap( new Registry.fwb,Registry.buildTile,16,16,0,0,1,6);
			add(floorWB);
			floorWB.visible = false;
			
			hud();
			
			placeItems();
			
			player = new Player(9,9);
			add(player);
			
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = floor1.width;
			FlxG.worldBounds.height = floor1.height;
			
			FlxG.camera.setBounds(0, 0, floor1.width, floor1.height);
			FlxG.worldBounds = new FlxRect(0, 0, floor1.width, floor1.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
			
			bat.setPath();
			ghost.setPath();
			spider1.setPath();
			
			loadLevel();			
		}	
		
		override public function update():void
		{
		
			//for testing purposes
			/*if(FlxG.keys.justPressed("Q"))
			{
				//trace("haveFullUrn = "+haveFullUrn);
				trace(FlxU.floor(player.x)+","+FlxU.floor(player.y)+" | "+FlxU.floor(player.x/16)+","+FlxU.floor(player.y/16));
				trace(floorW1.getTile(player.x/16-1,player.y/16));
				trace("Registry.wind is "+Registry.wind);
				trace("Registry.lightOn is "+Registry.lightOn);
				
			}*/

			if(Registry.scared)
			{
				Registry.lightOn = false;
				light.kill();
				Registry.timerSet = false;
				scareDelay();
			}
			
			if(Registry.lightOn)
			{
				if(!light.exists)
				{
					//trace("light exisits");
					light.reset(FlxU.floor(player.x)-5,FlxU.floor(player.y)-9);
				}
				
				lightDelay();
				light.x = FlxU.floor(player.x)-5;
				light.y = FlxU.floor(player.y)-9;
				
				if(Registry.dropItem)
				{
					dropItem();
				}
			}
			
			if(Registry.lives == 0)
				FlxG.switchState(new GameOver);
			
			if(Registry.wind)
			{
				Registry.lightOn = false;
				Registry.timerSet = false;
				light.kill();
				
			}
			
			if(onStairs && !Registry.moving)
			{
				onStairs = false;
				//trace("onStairs is false");
			}
			
			if(haveFullUrn && player.playerX() == 10 && player.playerY() == 9 && Registry.levelIndex == 1)
			{
				if(!gameOver)
				{
					gameOver = true;
					FlxG.switchState(new WinState);
				}
			}
			
			scepter.visible = false;
			urnLeft.visible = false;
			urnRight.visible = false;
			urnHandles.visible = false;
			urnMiddle.visible = false;
			urnMiddleLeft.visible = false;
			urnMiddleRight.visible = false;
			urnFull.visible = false;
			masterKey.visible = false;
			
			FlxG.overlap(light,scepter,showScepter);
			FlxG.overlap(light,urnLeft,showUrnLeft);
			FlxG.overlap(light,urnRight,showUrnRight);
			FlxG.overlap(light,urnHandles,showUrnHandles);
			FlxG.overlap(light,urnMiddle,showUrnMiddle);
			FlxG.overlap(light,urnMiddleLeft,showMiddleLeft);
			FlxG.overlap(light,urnMiddleRight,showMiddleRight);
			FlxG.overlap(light,urnFull,showFullUrn);
			FlxG.overlap(light,masterKey,showMasterKey);
			
			FlxG.overlap(player,scepter,pickUpScepter);
			FlxG.overlap(player,urnLeft,pickUpUrnLeft);
			FlxG.overlap(player,urnRight,pickUpUrnRight);
			FlxG.overlap(player,urnHandles,pickUpUrnHandles);
			FlxG.overlap(player,urnMiddle,pickUpUrnMiddle);
			FlxG.overlap(player,urnMiddleLeft,pickUpUrnMiddleLeft);
			FlxG.overlap(player,urnMiddleRight,pickUpUrnMiddleRight);
			FlxG.overlap(player,urnFull,pickUpFullUrn);
			FlxG.overlap(player,masterKey,pickUpMasterKey);
			
			if(bat.floor == Registry.levelIndex)
			{
				FlxG.overlap(player,bat,gotScared);
			}
			
			if(ghost.floor == Registry.levelIndex)
			{
				FlxG.overlap(player,ghost,gotScared);
			}
			
			if(spider1.floor == Registry.levelIndex)
			{
				FlxG.overlap(player,spider1,gotScared);
			}

			super.update();
			
			FlxG.collide(player,floorW1,bump);
			FlxG.collide(player,floorW2,bump);
			FlxG.collide(player,floorW3,bump);
			FlxG.collide(player,floorW4,bump);
			
			FlxG.collide(bat,floorW1);
			FlxG.collide(bat,floorW2);
			FlxG.collide(bat,floorW3);
			FlxG.collide(bat,floorW4);
			
			FlxG.collide(ghost,floorW1);
			FlxG.collide(ghost,floorW2);
			FlxG.collide(ghost,floorW3);
			FlxG.collide(ghost,floorW4);
			
			FlxG.collide(spider1,floorW1);
			FlxG.collide(spider1,floorW2);
			FlxG.collide(spider1,floorW3);
			FlxG.collide(spider1,floorW4);			
			
			FlxG.collide(player,stairsUp1,Stairs);
			FlxG.collide(player,stairsUp2,Stairs);
			FlxG.collide(player,stairsUp3,Stairs);
			FlxG.collide(player,stairsUp4,Stairs);
			FlxG.collide(player,stairsUp5,Stairs);
			FlxG.collide(player,stairsUp6,Stairs);
			FlxG.collide(player,stairsDn1,Stairs);
			FlxG.collide(player,stairsDn2,Stairs);
			FlxG.collide(player,stairsDn3,Stairs);
			FlxG.collide(player,stairsDn4,Stairs);
			FlxG.collide(player,stairsDn5,Stairs);
			FlxG.collide(player,stairsDn6,Stairs);
			
			FlxG.collide(bat,PlayState.stairsUp1,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsUp2,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsUp3,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsUp4,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsUp5,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsUp6,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsDn1,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsDn2,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsDn3,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsDn4,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsDn5,bat.callCheckStairs);
			FlxG.collide(bat,PlayState.stairsDn6,bat.callCheckStairs);
			
			FlxG.collide(ghost,PlayState.stairsUp1,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsUp2,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsUp3,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsUp4,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsUp5,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsUp6,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsDn1,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsDn2,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsDn3,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsDn4,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsDn5,ghost.callCheckStairs);
			FlxG.collide(ghost,PlayState.stairsDn6,ghost.callCheckStairs);
			
			FlxG.collide(spider1,PlayState.stairsUp1,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsUp2,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsUp3,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsUp4,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsUp5,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsUp6,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsDn1,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsDn2,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsDn3,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsDn4,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsDn5,spider1.callCheckStairs);
			FlxG.collide(spider1,PlayState.stairsDn6,spider1.callCheckStairs);
			
		}
		
		private function initGame():void
		{
			Registry.levelIndex = 1;
			Registry.lightOn = false;
			Registry.timerSet = false;
			Registry.timerSet2 = false;
			Registry.moving = false;
			Registry.dropItem = false;
			Registry.wind = false;
			Registry.scared = false;
			Registry.matches = 0;
			Registry.lives = 9;
		}
		
		private function bump(p:FlxSprite,e:FlxTilemap):void
		{
			FlxG.play(Registry.bumping,.8);
		}
		
		private function gotScared(p:FlxSprite,e:FlxSprite):void
		{
			Registry.scared = true;
		}
		
		private function lightDelay():void
		{	
			if(!Registry.timerSet)
				t.start(23);
			Registry.timerSet = true;
			//trace("Timer has "+FlxU.floor(t.timeLeft)+" seconds left");
			if(t.finished)
			{
				t.stop();
				Registry.timerSet = false;
				if(Registry.lightOn)
				{
					light.kill();
				}
				Registry.lightOn = false;
			}			
		}
		
		private function scareDelay():void
		{	
			if(!Registry.timerSet2)
			{
				t2.start(3);
				FlxG.play(Registry.scared2,.8);
				
			}
			Registry.timerSet2 = true;
			//trace("Timer2 has "+FlxU.floor(t2.timeLeft)+" seconds left");
			if(t2.finished)
			{
				t2.stop();
				Registry.timerSet2 = false;
				Registry.scared = false;
				Registry.lives -= 1;
				hudLives.text = ""+Registry.lives;
				resetEnemies();
			}			
		}
		
		private function resetEnemies():void
		{
			bat.stopFollowingPath(true);
			bat.velocity.x = bat.velocity.y = 0;
			tmpRnd = Math.floor(Math.random()*100)+1;
			if(tmpRnd <= 50)
			{
				bat.x = 48;
				bat.y = 224; 
			}
			else
			{
				bat.x = 128;
				bat.y = 224;
			}
			
			if(bat.floor == 1)
			{
				bat.floor = 3;
			}
			else if(bat.floor == 2)
			{
				bat.floor = 4;
			}
			else if(bat.floor == 3)
			{
				bat.floor = 1;
			}
			else
			{
				bat.floor = 2;
			}
			//trace("Bat was relocated to floor "+bat.floor);
			bat.setPath();
			
			ghost.stopFollowingPath(true);
			ghost.velocity.x = ghost.velocity.y = 0;
			tmpRnd = Math.floor(Math.random()*100)+1;
			if(tmpRnd <= 50)
			{
				ghost.x = 48;
				ghost.y = 64; 
			}
			else
			{
				ghost.x = 128;
				ghost.y = 64;
			}
			
			if(ghost.floor == 1)
			{
				ghost.floor = 3;
			}
			else if(ghost.floor == 2)
			{
				ghost.floor = 4;
			}
			else if(ghost.floor == 3)
			{
				ghost.floor = 1;
			}
			else
			{
				ghost.floor = 2;
			}
			//trace("ghost was relocated to floor "+ghost.floor);
			ghost.setPath();
			
			spider1.stopFollowingPath(true);
			spider1.velocity.x = spider1.velocity.y = 0;
			tmpRnd = Math.floor(Math.random()*100)+1;
			if(tmpRnd <= 50)
			{
				spider1.x = 48;
				spider1.y = 144; 
			}
			else
			{
				spider1.x = 128;
				spider1.y = 144;
			}
			
			if(spider1.floor == 1)
			{
				spider1.floor = 3;
			}
			else if(spider1.floor == 2)
			{
				spider1.floor = 4;
			}
			else if(spider1.floor == 3)
			{
				spider1.floor = 1;
			}
			else
			{
				spider1.floor = 2;
			}
			//trace("spider1 was relocated to floor "+spider1.floor);
			spider1.setPath();
		}
		
		private function hud():void
		{
			hudPanel = new FlxSprite;
			hudPanel.makeGraphic(192,25,0xFFC87F00);
			hudPanel.x = 0;
			hudPanel.y = 127;
			hudPanel.scrollFactor.x = hudPanel.scrollFactor.y = 0;
			add(hudPanel);
			
			if(Registry.matches < 10)
			{
				hudMatches = new FlxText(5,135,30,"0"+Registry.matches);
			}
			else
			{
				hudMatches = new FlxText(5,135,30,""+Registry.matches);
			}
			hudMatches.setFormat(null,8,0xFFFFFF, "left");
			hudMatches.scrollFactor.x = hudMatches.scrollFactor.y = 0;
			add(hudMatches);
			
			hudFloor = new FlxText(30,130,30,""+Registry.levelIndex);
			hudFloor.setFormat(null,8,0xFFFFFF, "left");
			hudFloor.scrollFactor.x = hudFloor.scrollFactor.y = 0;
			add(hudFloor);
			
			hudFullUrn = new FlxSprite(60,132,Registry.fullUrn);
			hudFullUrn.scrollFactor.x = hudFullUrn.scrollFactor.y = 0;
			add(hudFullUrn);
			hudFullUrn.visible = false;
			
			hudUrnRightSide = new FlxSprite(60,132,Registry.mrU);
			hudUrnRightSide.scrollFactor.x = hudUrnRightSide.scrollFactor.y = 0;
			add(hudUrnRightSide);
			hudUrnRightSide.visible = false;
			
			hudUrnLeftSide = new FlxSprite(60,132,Registry.mlU);
			hudUrnLeftSide.scrollFactor.x = hudUrnLeftSide.scrollFactor.y = 0;
			add(hudUrnLeftSide);
			hudUrnLeftSide.visible = false;
			
			hudUrnHandles = new FlxSprite(60,132,Registry.uHandles);
			hudUrnHandles.scrollFactor.x = hudUrnHandles.scrollFactor.y = 0;
			add(hudUrnHandles);
			hudUrnHandles.visible = false;
			
			hudUrnLeftHandle = new FlxSprite(60,132,Registry.uLeft);
			hudUrnLeftHandle.scrollFactor.x = hudUrnLeftHandle.scrollFactor.y = 0;
			add(hudUrnLeftHandle);
			hudUrnLeftHandle.visible = false;
			
			hudUrnRightHandle = new FlxSprite(60,132,Registry.uRight);
			hudUrnRightHandle.scrollFactor.x = hudUrnRightHandle.scrollFactor.y = 0;
			add(hudUrnRightHandle);
			hudUrnRightHandle.visible = false;
			
			hudMiddleOfUrn = new FlxSprite(60,132,Registry.uMiddle);
			hudMiddleOfUrn.scrollFactor.x = hudMiddleOfUrn.scrollFactor.y = 0;
			add(hudMiddleOfUrn);
			hudMiddleOfUrn.visible = false;
			
			hudScepter = new FlxSprite(60,132,Registry.Scepter);
			hudScepter.scrollFactor.x = hudScepter.scrollFactor.y = 0;
			add(hudScepter);
			hudScepter.visible = false;
			
			hudKey = new FlxSprite(60,132,Registry.mKey);
			hudKey.scrollFactor.x = hudKey.scrollFactor.y = 0;
			add(hudKey);
			hudKey.visible = false;
			
			hudLives = new FlxText(80,135,30,""+Registry.lives);
			hudLives.setFormat(null,8,0xFFFFFF, "left");
			hudLives.scrollFactor.x = hudLives.scrollFactor.y = 0;
			add(hudLives);
		}
		
		private function placeItems():void
		{
			var whatSpot:int;
			var done:Boolean = false;
			var count:int = 1;
			var index:int;
			
			urnHandles = new UrnHandles(0,0);
			urnHandles.Floor = 1;
			add(urnHandles);
			urnHandles.visible = false;
			
			urnMiddleLeft = new UrnMiddleLeft(0,0);
			urnMiddleLeft.Floor = 1;
			add(urnMiddleLeft);
			urnMiddleLeft.visible = false;
			
			urnMiddleRight = new UrnMiddleRight(0,0);
			urnMiddleRight.Floor = 1;
			add(urnMiddleRight);
			urnMiddleRight.visible = false;
			
			urnFull = new FullUrn(0,0);
			urnFull.Floor = 1;
			add(urnFull);
			urnFull.visible = false;
			
			//placing the key here for now. it is only used in games 3-9.
			masterKey = new MasterKey(0,0);
			masterKey.Floor = 1;
			add(masterKey);
			masterKey.visible = false;
			
			while(!done)
			{
				//trace("Before slice: "+choices);
				index = Math.floor(Math.random()*choices.length)
				whatSpot = choices[index];
				choices.splice(index,1);
				//trace("After  slice: "+choices);
				switch(count)
				{
					case 1:
					{
						getSpot(whatSpot);
						scepter = new Scepter(tempX,tempY);
						add(scepter);
						scepter.Floor = tempFloor;
						count++;
						break;
					}
						
					case 2:
					{			
						getSpot(whatSpot);
						urnLeft = new UrnLeft(tempX,tempY);
						add(urnLeft);
						urnLeft.Floor = tempFloor;
						count++;
						break;
					}
						
					case 3:
					{
						getSpot(whatSpot);
						urnRight = new UrnRight(tempX,tempY);
						add(urnRight);
						urnRight.Floor = tempFloor;
						count++;
						break;
					}
						
					case 4:
					{
						getSpot(whatSpot);
						urnMiddle = new UrnMiddle(tempX,tempY);
						add(urnMiddle);
						urnMiddle.Floor = tempFloor;
						count++;
						done = true;
						break;
					}
				}
			}
			/*trace("The scepter is at "+scepter.x/16+","+scepter.y/16+" on floor "+scepter.Floor);
			trace("The urnLeft is at "+urnLeft.x/16+","+urnLeft.y/16+" on floor "+urnLeft.Floor);
			trace("The urnRight is at "+urnRight.x/16+","+urnRight.y/16+" on floor "+urnRight.Floor);
			trace("The urnMiddle is at "+urnMiddle.x/16+","+urnMiddle.y/16+" on floor "+urnMiddle.Floor);*/
		}
		
		private function getSpot(num:int):void
		{
			tempFloor = Math.ceil(num/6);
			if(tempFloor < 1)
				tempFloor = 1;
			switch(num)
			{
				case 0:
				case 6:
				case 12:
				case 18:
				{
					tempX = 3;
					tempY = 4;
					break;
				}
				case 1:
				case 7:
				case 13:
				case 19:
				{
					tempX = 8;
					tempY = 4;
					break;
				}
				case 2:
				case 8:
				case 14:
				case 20:
				{
					tempX = 3;
					tempY = 9; 
					break;
				}
				case 3:
				case 9:
				case 15:
				case 21:
				{
					tempX = 8;
					tempY = 9;
					break;
				}
				case 4:
				case 10:
				case 16:
				case 22:
				{
					tempX = 3;
					tempY = 14;
					break;
				}
				case 5:
				case 11:
				case 17:
				case 23:
				{
					tempX = 8;
					tempY = 14;
					break;
				}
			}
		}
		
		private function showScepter(theLight:FlxSprite,item:FlxSprite):void
		{
			if(scepter.Floor == Registry.levelIndex)
			{
				scepter.visible = true;
			}
		}
		
		private function showUrnLeft(theLight:FlxSprite,item:FlxSprite):void
		{
			if(urnLeft.Floor == Registry.levelIndex)
			{
				urnLeft.visible = true;
			}
		}
		
		private function showUrnRight(theLight:FlxSprite,item:FlxSprite):void
		{
			if(urnRight.Floor == Registry.levelIndex)
			{
				urnRight.visible = true;
			}
		}
		
		private function showUrnHandles(theLight:FlxSprite,item:FlxSprite):void
		{
			if(urnHandles.Floor == Registry.levelIndex)
			{
				urnHandles.visible = true;
			}
		}
		
		private function showUrnMiddle(theLight:FlxSprite,item:FlxSprite):void
		{
			if(urnMiddle.Floor == Registry.levelIndex)
			{
				urnMiddle.visible = true;
			}
		}
		
		private function showMiddleLeft(theLight:FlxSprite,item:FlxSprite):void
		{
			if(urnMiddleLeft.Floor == Registry.levelIndex)
			{
				urnMiddleLeft.visible = true;
			}
		}

		private function showMiddleRight(theLight:FlxSprite,item:FlxSprite):void
		{
			if(urnMiddleRight.Floor == Registry.levelIndex)
			{
				urnMiddleRight.visible = true;
			}
		}
		
		private function showFullUrn(theLight:FlxSprite,item:FlxSprite):void
		{
			if(urnFull.Floor == Registry.levelIndex)
			{
				urnFull.visible = true;
			}
		}
		
		private function showMasterKey(theLight:FlxSprite,item:FlxSprite):void
		{
			if(masterKey.Floor == Registry.levelIndex)
			{
				masterKey.visible = true;
			}
		}
		
		private function pickUpScepter(player:FlxSprite,item:FlxSprite):void
		{	
			if(scepter.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveScepter = true;
				invEmpty = false;
				trace("<--Inside pickUpScepter -->");
				trace("haveScepter = "+haveScepter);
				trace("invEmpty = "+invEmpty);
				
				if(scepter.x/16 == 3 || scepter.x/16 == 8)
				{
					tempX = scepter.x - 16;
					tempY = scepter.y + 16;
					tempFloor = scepter.Floor;
				}
				else
				{
					tempX = scepter.x + 16;
					tempY = scepter.y - 16;
					tempFloor = scepter.Floor;
				}
				
				FlxG.play(Registry.pickupItem1,.8);
				
				checkHUD();
				
				scepter.x = 0;
				scepter.y = 0;
				
				hudScepter.visible = true;
				
				hudItemNum = 1;	
			}
		}
		
		private function pickUpUrnLeft(player:FlxSprite,item:FlxSprite):void
		{
			if(urnLeft.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveLeftUrnHandle = true;
				invEmpty = false;
				
				if(urnLeft.x/16 == 3 || urnLeft.x/16 == 8)
				{
					tempX = urnLeft.x - 16;
					tempY = urnLeft.y + 16;
					tempFloor = urnLeft.Floor;
				}
				else
				{
					tempX = urnLeft.x + 16;
					tempY = urnLeft.y - 16;
					tempFloor = urnLeft.Floor;
				}
				
				checkHUD();
				urnLeft.x = 0;
				urnLeft.y = 0;
				
				if(haveRightUrnHandle)
				{
					FlxG.play(Registry.pickupItem2,.8);
					hudUrnRightHandle.visible = false;
					hudUrnHandles.visible = true;
					haveBothUrnHandles = true;
					haveLeftUrnHandle = false;
					haveRightUrnHandle = false;
					hudItemNum = 4;
				}
				else if(haveMiddleOfUrn)
				{
					FlxG.play(Registry.pickupItem2,.8);
					hudMiddleOfUrn.visible = false;
					hudUrnLeftSide.visible = true;
					haveMiddleAndLeft = true;
					haveLeftUrnHandle = false;
					haveMiddleOfUrn = false;
					hudItemNum = 6;
				}
				else if(haveMiddleAndRight)
				{
					FlxG.play(Registry.pickupItem3,.8);
					hudUrnRightSide.visible = false;
					hudFullUrn.visible = true;
					haveFullUrn = true;
					haveMiddleAndRight = false;
					hudItemNum = 8;
				}
				else	
				{
					FlxG.play(Registry.pickupItem1,.8);
					hudUrnLeftHandle.visible = true;
					hudItemNum = 2;
				}
			}
		}
		
		private function pickUpUrnRight(player:FlxSprite,item:FlxSprite):void
		{
			
			if(urnRight.Floor == Registry.levelIndex && Registry.lightOn)
			{
				trace("----------------------------");
				trace("Got the Urn's Right Handle");
				haveRightUrnHandle = true;
				trace("setting invEmpty to false");
				invEmpty = false;
				trace("invEmpty should be false");
				trace("and its "+invEmpty);
				if(urnRight.x/16 == 3 || urnRight.x/16 == 8)
				{
					tempX = urnRight.x - 16;
					tempY = urnRight.y + 16;
					tempFloor = urnRight.Floor;
				}
				else
				{
					tempX = urnRight.x + 16;
					tempY = urnRight.y - 16;
					tempFloor = urnRight.Floor;
				}
				trace("To checkHUD!");
				checkHUD();

				urnRight.x = 0;
				urnRight.y = 0;
				
				if(haveLeftUrnHandle)
				{
					FlxG.play(Registry.pickupItem2,.8);
					hudUrnLeftHandle.visible = false;
					hudUrnHandles.visible = true;
					haveBothUrnHandles = true;
					haveLeftUrnHandle = false;
					haveRightUrnHandle = false;
					hudItemNum = 4;
				}
				else if(haveMiddleOfUrn)
				{
					FlxG.play(Registry.pickupItem2,.8);
					hudMiddleOfUrn.visible = false;
					hudUrnRightSide.visible = true;
					haveMiddleAndRight = true;
					haveRightUrnHandle = false;
					haveMiddleOfUrn = false;
					hudItemNum = 7;
				}
				else if(haveMiddleAndLeft)
				{
					FlxG.play(Registry.pickupItem3,.8);
					hudUrnLeftSide.visible = false;
					hudFullUrn.visible = true;
					haveFullUrn = true;
					haveMiddleAndLeft = false;
					hudItemNum = 8;
				}
				else
				{
					FlxG.play(Registry.pickupItem1,.8);
					hudUrnRightHandle.visible = true;
					hudItemNum = 3;
				}
				trace("Leaving pickUpUrnRight, hudItemNum is "+hudItemNum)
				trace("and invEmpty is "+invEmpty);
			}
		}
		
		private function pickUpUrnHandles(player:FlxSprite,item:FlxSprite):void
		{
			if(urnHandles.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveBothUrnHandles = true;
				invEmpty = false;
				
				if(urnHandles.x/16 == 3 || urnHandles.x/16 == 8)
				{
					tempX = urnHandles.x - 16;
					tempY = urnHandles.y + 16;
					tempFloor = urnHandles.Floor;
				}
				else
				{
					tempX = urnHandles.x + 16;
					tempY = urnHandles.y - 16;
					tempFloor = urnHandles.Floor;
				}
				
				checkHUD();
				
				urnHandles.x = 0;
				urnHandles.y = 0;
				
				if(haveMiddleOfUrn)
				{
					FlxG.play(Registry.pickupItem3,.8);
					hudFullUrn.visible = true;
					hudUrnHandles.visible = false;
					haveFullUrn = true;
					haveBothUrnHandles = false;
					hudItemNum = 8;
				}
				else
				{
					FlxG.play(Registry.pickupItem1,.8);
					hudUrnHandles.visible = true;
					hudItemNum = 4;
				}
			}
		}
		
		private function pickUpUrnMiddle(player:FlxSprite,item:FlxSprite):void
		{
			if(urnMiddle.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveMiddleOfUrn = true;
				invEmpty = false;
				
				if(urnMiddle.x/16 == 3 || urnMiddle.x/16 == 8)
				{
					tempX = urnMiddle.x - 16;
					tempY = urnMiddle.y + 16;
					tempFloor = urnMiddle.Floor;
				}
				else
				{
					tempX = urnMiddle.x + 16;
					tempY = urnMiddle.y - 16;
					tempFloor = urnMiddle.Floor;
				}
				
				checkHUD();
				
				urnMiddle.x = 0;
				urnMiddle.y = 0;
				
				if(haveLeftUrnHandle)
				{
					FlxG.play(Registry.pickupItem2,.8);
					hudUrnLeftSide.visible = true;
					hudUrnLeftHandle.visible = false;
					haveLeftUrnHandle = false;
					haveMiddleOfUrn = false;
					haveMiddleAndLeft = true;
					hudItemNum = 6;
				}
				else if(haveRightUrnHandle)
				{
					FlxG.play(Registry.pickupItem2,.8);
					hudUrnRightSide.visible = true;
					hudUrnRightHandle.visible = false;
					haveRightUrnHandle = false;
					haveMiddleOfUrn = false;
					haveMiddleAndRight = true;
					hudItemNum = 7;
				}
				else if(haveBothUrnHandles)
				{
					FlxG.play(Registry.pickupItem3,.8);
					hudFullUrn.visible = true;
					hudUrnHandles.visible = false;
					haveFullUrn = true;
					haveBothUrnHandles = false;
					hudItemNum = 8;
				}
				else
				{
					FlxG.play(Registry.pickupItem1,.8);
					hudMiddleOfUrn.visible = true;
					hudItemNum = 5;
				}
			}
		}
		
		private function pickUpUrnMiddleLeft(player:FlxSprite,item:FlxSprite):void
		{	
			if(urnMiddleLeft.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveMiddleAndLeft = true;
				invEmpty = false;
				
				if(urnMiddleLeft.x/16 == 3 || urnMiddleLeft.x/16 == 8)
				{
					tempX = urnMiddleLeft.x - 16;
					tempY = urnMiddleLeft.y + 16;
					tempFloor = urnMiddleLeft.Floor;	
				}
				else
				{
					tempX = urnMiddleLeft.x + 16;
					tempY = urnMiddleLeft.y - 16;
					tempFloor = urnMiddleLeft.Floor;
				}
				
				checkHUD();
				
				urnMiddleLeft.x = 0;
				urnMiddleLeft.y = 0;
				
				if(haveRightUrnHandle)
				{
					FlxG.play(Registry.pickupItem3,.8);
					hudFullUrn.visible = true;
					hudUrnLeftSide.visible = false;
					haveFullUrn = true;
					haveMiddleAndLeft = false;
					haveRightUrnHandle = false;
					hudItemNum = 8;
				}
				else
				{
					FlxG.play(Registry.pickupItem1,.8);
					hudUrnLeftSide.visible = true;
					hudItemNum = 6;
				}
			}
		}
		
		private function pickUpUrnMiddleRight(player:FlxSprite,item:FlxSprite):void
		{
			if(urnMiddleRight.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveMiddleAndRight = true;
				invEmpty = false;
				
				if(urnMiddleRight.x/16 == 3 || urnMiddleRight.x/16 == 8)
				{
					tempX = urnMiddleRight.x - 16;
					tempY = urnMiddleRight.y + 16;
					tempFloor = urnMiddleRight.Floor;
				}
				else
				{
					tempX = urnMiddleRight.x + 16;
					tempY = urnMiddleRight.y - 16;
					tempFloor = urnMiddleRight.Floor;
				}
				
				checkHUD();
				
				urnMiddleRight.x = 0;
				urnMiddleRight.y = 0;
				
				if(haveLeftUrnHandle)
				{
					FlxG.play(Registry.pickupItem3,.8);
					hudFullUrn.visible = true;
					hudUrnRightSide.visible = false;
					haveFullUrn = true;
					haveMiddleAndRight = false;
					haveLeftUrnHandle = false;
					hudItemNum = 8;
				}
				else
				{
					FlxG.play(Registry.pickupItem1,.8);
					hudUrnRightSide.visible = true;
					hudItemNum = 7;
				}
			}
		}
		
		private function pickUpFullUrn(player:FlxSprite,item:FlxSprite):void
		{
			if(urnFull.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveFullUrn = true;
				invEmpty = false;
				
				if(urnFull.x/16 == 3 || urnFull.x/16 == 8)
				{
					tempX = urnFull.x - 16;
					tempY = urnFull.y + 16;
					tempFloor = urnFull.Floor;
				}
				else
				{
					tempX = urnFull.x + 16;
					tempY = urnFull.y - 16;
					tempFloor = urnFull.Floor;
				}
				
				FlxG.play(Registry.pickupItem3,.8);
				
				checkHUD();
				
				urnFull.x = 0;
				urnFull.y = 0;
				
				hudFullUrn.visible = true;
				
				hudItemNum = 8;
			}
		}
		
		private function pickUpMasterKey(player:FlxSprite,item:FlxSprite):void
		{
			if(urnRight.Floor == Registry.levelIndex && Registry.lightOn)
			{
				haveKey = true;
				invEmpty = false;
				
				if(masterKey.x == 3 || masterKey.x == 8)
				{
					tempX = masterKey.x - 1;
					tempY = masterKey.y + 1;
					tempFloor = masterKey.Floor;
				}
				else
				{
					tempX = masterKey.x + 1;
					tempY = masterKey.y - 1;
					tempFloor = masterKey.Floor;
				}
				
				FlxG.play(Registry.pickupItem1,.8);
				
				checkHUD();
				
				masterKey.x = 0;
				masterKey.y = 0;
				
				hudKey.visible = true;
				
				hudItemNum = 9;
			}
		}
		
		public function dropItem():void
		{
			trace("----------------------------");
			trace("<-- inside dropItem -->");
			trace("invEmpty is "+invEmpty);
			if(!invEmpty && Registry.dropItem)
			{
				if(floorW1.getTile(player.playerX()-1,player.playerY()) == 6 || 
					floorW2.getTile(player.playerX()-1,player.playerY()) == 7 || 
					floorW3.getTile(player.playerX()-1,player.playerY()) == 8 ||
					floorW4.getTile(player.playerX()-1,player.playerY()) == 9)
				{
					trace("near a wall");
					if(floorW1.getTile(player.playerX(),player.playerY()+1) == 6 ||
						floorW2.getTile(player.playerX(),player.playerY()+1) == 7 || 
						floorW3.getTile(player.playerX(),player.playerY()+1) == 8 ||
						floorW4.getTile(player.playerX(),player.playerY()+1) == 9 ||
						player.y/16 == 16)
					{
						if(floorW1.getTile(player.playerX(),player.playerY()-1) == 6 ||
							floorW2.getTile(player.playerX(),player.playerY()-1) == 7 || 
							floorW3.getTile(player.playerX(),player.playerY()-1) == 8 ||
							floorW4.getTile(player.playerX(),player.playerY()-1) == 9)
						{
							trace("in the left stairwell");
							trace("putting it to the right of me")
							tempX = Math.floor(player.x)+32;
							tempY = Math.floor(player.y);
							tempFloor = Registry.levelIndex;
						}
						else
						{
							trace("putting it above me")
							tempX = Math.floor(player.x);
							tempY = Math.floor(player.y)-16;
							tempFloor = Registry.levelIndex;
						}
					}
					else
					{
						trace("dropping it below me");
						tempX = Math.floor(player.x);
						tempY = Math.floor(player.y)+20;
						tempFloor = Registry.levelIndex;
					}
				}
				else
				{
					trace("putting it to the left");
					tempX = Math.floor(player.x)-16;
					tempY = Math.floor(player.y);
					tempFloor = Registry.levelIndex;
				}
				
				trace("tempX = "+tempX);
				trace("tempY = "+tempY);
				trace("tempFloor = "+tempFloor);
				FlxG.play(Registry.dItem,.8);
				checkHUD();
				hudItemNum = 0;
				Registry.dropItem = false;
			}
		}
		
		private function checkHUD():void
		{
			switch(hudItemNum)
			{
				//Scepter
				case 1:
				{
					scepter.x = tempX;
					scepter.y = tempY;
					scepter.Floor = tempFloor;
					//trace("The scepter is at "+scepter.x/16+","+scepter.y/16+" on floor "+scepter.Floor);
					haveScepter = false;
					hudScepter.visible = false;
					invEmpty = true;
					break;
				}
				//Left Urn Handle	
				case 2:
				{
					if(!haveRightUrnHandle)
					{
						if(!haveMiddleOfUrn)
						{
							urnLeft.x = tempX;
							urnLeft.y = tempY;
							urnLeft.Floor = tempFloor;
							haveLeftUrnHandle = false;
							hudUrnLeftHandle.visible = false;
							invEmpty = true;
						}
					}
					break;
				}
				//Right Urn Handle	
				case 3:
				{
					if(!haveLeftUrnHandle)
					{
						if(!haveMiddleOfUrn)
						{
							urnRight.x = tempX;
							urnRight.y = tempY;
							urnRight.Floor = tempFloor;
							haveRightUrnHandle = false;
							hudUrnRightHandle.visible = false;
							invEmpty = true;
						}
					}
					trace("Finished checkHUD, invEmpty is "+invEmpty);
					break;
				}
				//Both Urn Handles	
				case 4:
				{
					if(!haveMiddleOfUrn)
					{
						urnHandles.x = tempX;
						urnHandles.y = tempY;
						urnHandles.Floor = tempFloor;
						haveBothUrnHandles = false;
						hudUrnHandles.visible = false;
						invEmpty = true;
					}
					break;
				}
				//Middle of Urn
				case 5:
				{
					if(!haveLeftUrnHandle)
					{
						if(!haveRightUrnHandle)
						{
							urnMiddle.x = tempX;
							urnMiddle.y = tempY;
							urnMiddle.Floor = tempFloor;
							haveMiddleOfUrn = false;
							hudMiddleOfUrn.visible = false;
							invEmpty = true;
						}
					}
					break;
				}
				// Middle of Urn with Left Urn Handle
				case 6:
				{
					if(!haveRightUrnHandle)
					{
						urnMiddleLeft.x = tempX;
						urnMiddleLeft.y = tempY;
						urnMiddleLeft.Floor = tempFloor;
						haveMiddleAndLeft = false;
						hudUrnLeftSide.visible = false;
						invEmpty = true;
					}
					break;
				}
				// Middle of Urn with Right Urn Handle
				case 7:
				{
					if(!haveLeftUrnHandle)
					{
						urnMiddleRight.x = tempX;
						urnMiddleRight.y = tempY;
						urnMiddleRight.Floor = tempFloor;
						haveMiddleAndRight = false;
						hudUrnRightSide.visible = false;
						invEmpty = true;
					}
					break;
				}
				//Full Urn
				case 8:
				{
					urnFull.x = tempX;
					urnFull.y = tempY;
					urnFull.Floor = tempFloor;
					haveFullUrn = false;
					hudFullUrn.visible = false;
					invEmpty = true;
					break;
				}
				//Master Key
				case 9:
				{
					masterKey.x = tempX;
					masterKey.y = tempY;
					masterKey.Floor = tempFloor;
					haveKey = false;
					hudKey.visible = false;
					invEmpty = true;
					break;
				}
			}
		}
		
		private function Stairs(p:FlxSprite,e:FlxSprite):void
		{	
			if(!onStairs)
			{
				//trace("onStairs is true");
				onStairs = true;
				useStairs();
			}
		}

		private function useStairs():void
		{
			switch(Registry.levelIndex)
			{
				case 1:
				{
					//floor1.kill();
					//floorW1.kill();
					stairsUp1.kill();
					stairsUp6.kill();
					checkStairs();
					break;
				}
				case 2:
				{

					//floor2.kill();
					//floorW2.kill();
					stairsDn1.kill();
					stairsUp2.kill();
					stairsUp3.kill();
					stairsUp5.kill();
					stairsDn6.kill();
					checkStairs();
					break;
				}
				case 3:
				{
					//floor3.kill();
					//floorW3.kill();
					stairsUp1.kill();
					stairsDn2.kill();
					stairsDn3.kill();
					stairsUp4.kill();
					stairsDn5.kill();
					stairsUp6.kill();
					checkStairs();
					break;
				}
				case 4:
				{
					//floor4.kill();
					//floorW4.kill();
					stairsDn1.kill();
					stairsDn4.kill();
					stairsDn6.kill();
					checkStairs();
					break;
				}	
			}
		}
		
		private function checkStairs():void
		{
			if(FlxU.floor(player.x)/16 < 4 && FlxU.floor(player.y)/16 < 3)
			{
				//player.y = 3*16;
				if(Registry.levelIndex == 1 || Registry.levelIndex == 3)
				{
					Registry.levelIndex += 1;
					FlxG.play(Registry.stairsUp,.8);
				}
				else
				{
					Registry.levelIndex -= 1;
					FlxG.play(Registry.stairsDn,.8);
				}
			}
			
			if(FlxU.floor(player.x)/16 > 7 && FlxU.floor(player.y)/16 < 3)
			{
				//player.y = 3*16;
				if(Registry.levelIndex == 2)
				{
					Registry.levelIndex += 1;
					FlxG.play(Registry.stairsUp,.8);
				}
				else
				{
					Registry.levelIndex -= 1;
					FlxG.play(Registry.stairsDn,.8);
				}
			}
			
			if(FlxU.floor(player.x)/16 < 2 && FlxU.floor(player.y)/16 < 10)
			{
				//player.x = 2*16;
				if(Registry.levelIndex == 2)
				{
					Registry.levelIndex += 1;
					FlxG.play(Registry.stairsUp,.8);
				}
				else
				{
					Registry.levelIndex -= 1;
					FlxG.play(Registry.stairsDn,.8);
				}
			}
			
			if(FlxU.floor(player.x)/16 > 9 && FlxU.floor(player.y)/16 < 10)
			{
				//player.x = 9*16;
				if(Registry.levelIndex == 3)
				{
					Registry.levelIndex += 1;
					FlxG.play(Registry.stairsUp,.8);
				}
				else
				{
					Registry.levelIndex -= 1;
					FlxG.play(Registry.stairsDn,.8);
				}
			}
			
			if(FlxU.floor(player.x)/16 < 4 && FlxU.floor(player.y)/16 > 15)
			{
				//player.y = 15*16;
				if(Registry.levelIndex == 2)
				{
					Registry.levelIndex += 1;
					FlxG.play(Registry.stairsUp,.8);
				}
				else
				{
					Registry.levelIndex -= 1;
					FlxG.play(Registry.stairsDn,.8);
				}
			}
			
			if(FlxU.floor(player.x)/16 > 7 && FlxU.floor(player.y)/16 > 15)
			{
				//player.y = 15*16;
				if(Registry.levelIndex == 1 || Registry.levelIndex == 3)
				{
					Registry.levelIndex += 1;
					FlxG.play(Registry.stairsUp,.8);
				}
				else
				{
					Registry.levelIndex -= 1;
					FlxG.play(Registry.stairsDn,.8);
				}
			}
			
			hudFloor.text = ""+Registry.levelIndex;
			loadLevel();
		}
		
		private function loadLevel():void
		{
			//trace("Level = "+Registry.levelIndex);
		
			switch(Registry.levelIndex)
			{
				case 1:
				{
					if(Registry.Game2)
					{
						floorWB.visible = true;
					}
					floorW1.visible = true;
					floorW2.visible = false;
					floorW3.visible = false;
					floorW4.visible = false;
					stairsUp1.reset(3*16,1*16+1);
					stairsUp6.reset(8*16,17*16-1);
					break;
				}
				case 2:
				{
					if(Registry.Game2)
					{
						floorWB.visible = true;
					}
					floorW1.visible = false;
					floorW2.visible = true;
					floorW3.visible = false;
					floorW4.visible = false;
					stairsDn1.reset(3*16,1*16+1);
					stairsUp2.reset(8*16,1*16+1);
					stairsUp3.reset(0*16+1,9*16);
					stairsUp5.reset(3*16,17*16-1);
					stairsDn6.reset(8*16,17*16-1);
					break;
				}
				case 3:
				{
					if(Registry.Game2)
					{
						floorWB.visible = true;
					}
					floorW1.visible = false;
					floorW2.visible = false;
					floorW3.visible = true;
					floorW4.visible = false;
					stairsUp1.reset(3*16,1*16+1);
					stairsDn2.reset(8*16,1*16+1);
					stairsDn3.reset(0*16+1,9*16);
					stairsUp4.reset(11*16-1,9*16);
					stairsDn5.reset(3*16,17*16-1);
					stairsUp6.reset(8*16,17*16-1);
					break;
				}
				case 4:
				{
					if(Registry.Game2)
					{
						floorWB.visible = true;
					}
					floorW1.visible = false;
					floorW2.visible = false;
					floorW3.visible = false;
					floorW4.visible = true;
					stairsDn1.reset(3*16,1*16+1);
					stairsDn4.reset(11*16-1,9*16);
					stairsDn6.reset(8*16,17*16-1);
					break;
				}
			}
		}
	}
}
