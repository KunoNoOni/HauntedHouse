package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxVelocity;
		
	public class Ghost extends FlxSprite
	{
		//Variables got here
		public var floor:int = 0;
		private var rnd:int=0;
		private var thePath:FlxPath;
		private var startOfPath:FlxPoint;
		private var endOfPath:FlxPoint;
		private var tmpRnd:int;
		
		public function Ghost(X:Number, Y:Number)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.Ghost,true,false,16,16);
			addAnimation("float",[0,1],5,true);
			
			rnd = Math.floor(Math.random()*4)+1;
			floor = rnd;
			//trace("Ghost is starting on floor "+this.floor);
		}
		
		//For testing purposes
		/*override public function draw():void
		{
			super.draw();
			
			//To draw path
			if(this.thePath.nodes != null)
			{
				this.thePath.drawDebug();
			}
		}*/
		
		override public function update():void
		{	
			play("float");
			
			if(this.floor == Registry.levelIndex)
			{
				this.visible = true;
			}
			else
			{
				this.visible = false;
			}

			checkDistance();
			
			super.update();
		}

		public function checkStairs():void
		{
			if(FlxU.floor(this.x)/16 < 4 && FlxU.floor(this.y)/16 < 3)
			{
				//this.y = 3*16;
				if(this.floor == 1 || this.floor == 3)
					this.floor += 1;
				else if(this.floor == 2 || this.floor == 4)
					this.floor -= 1;
			}
			
			if(FlxU.floor(this.x)/16 > 7 && FlxU.floor(this.y)/16 < 3)
			{
				//this.y = 3*16;
				if(this.floor == 2)
					this.floor += 1;
				else if(this.floor == 3)
					this.floor -= 1;
			}
			
			if(FlxU.floor(this.x)/16 < 2 && FlxU.floor(this.y)/16 < 10)
			{
				//this.x = 2*16;
				if(this.floor == 2)
					this.floor += 1;
				else if(this.floor == 3)
					this.floor -= 1;
			}
			
			if(FlxU.floor(this.x)/16 > 9 && FlxU.floor(this.y)/16 < 10)
			{
				//this.x = 9*16;
				if(this.floor == 3)
					this.floor += 1;
				else if(this.floor == 4)
					this.floor -= 1;
			}
			
			if(FlxU.floor(this.x)/16 < 4 && FlxU.floor(this.y)/16 > 15)
			{
				//this.y = 15*16;
				if(this.floor == 2)
					this.floor += 1;
				else if(this.floor == 3)
					this.floor -= 1;
			}
			
			if(FlxU.floor(this.x)/16 > 7 && FlxU.floor(this.y)/16 > 15)
			{
				//this.y = 15*16;
				if(this.floor == 1 || this.floor == 3)
					this.floor += 1;
				else if(this.floor == 2 || this.floor == 4)
					this.floor -= 1;
			}
			
			//trace("Bat is now on floor "+this.floor);
			
			this.velocity.x = this.velocity.y = 0;
			this.stopFollowingPath(true);
			setPath();
		}
		
		public function callCheckStairs(p:FlxSprite, e:FlxSprite):void
		{
			checkStairs();
		}

		private function checkDistance():void
		{
			var getDist:int = 0;
			if(this.floor == Registry.levelIndex && !PlayState.haveScepter)
			{
				getDist = FlxVelocity.distanceBetween(PlayState.player,this);
				if(!Registry.scared)
				{
					if(getDist <= 48)
					{
						if(thePath.nodes != null)
						{
							this.stopFollowingPath(true);
							FlxG.play(Registry.windSound2,.8);
						}
						FlxVelocity.moveTowardsObject(this,PlayState.player,25);
						Registry.wind = true;
						
					}
					else if(thePath.nodes == null)
					{
						Registry.wind = false;
						this.velocity.x = this.velocity.y = 0;
						startOfPath = new FlxPoint(this.x+this.width/2,this.y+this.height/2);
						backToPath();
					}
				}
				else if(Registry.scared)
				{
					if(Registry.wind)
					{
						Registry.wind = false;
						this.velocity.x = this.velocity.y = 0;
						startOfPath = new FlxPoint(this.x+this.width/2,this.y+this.height/2);
						backToPath();
					}
				}
			}
		}
		
		private function backToPath():void
		{
			switch(this.floor)
			{
				case 1:
				{
					thePath = PlayState.floorW1.findPath(startOfPath,endOfPath);
					break
				}
				case 2:
				{
					thePath = PlayState.floorW2.findPath(startOfPath,endOfPath);
					break
				}
				case 3:
				{
					thePath = PlayState.floorW3.findPath(startOfPath,endOfPath);
					break
				}
				case 4:
				{
					thePath = PlayState.floorW4.findPath(startOfPath,endOfPath);
					break
				}
			}
			
			this.followPath(thePath,25);
		}
		
		public function setPath():void
		{
			tmpRnd = Math.floor(Math.random()*100)+1;
			//trace("tmpRnd is "+tmpRnd);

			startOfPath = new FlxPoint(this.x+this.width/2,this.y+this.height/2);
			
			//trace("Start of path = "+Math.floor(startOfPath.x)+","+Math.floor(startOfPath.y)+" or "+Math.floor(startOfPath.x)/16+","+Math.floor(startOfPath.y)/16);
			
			switch(this.floor)
			{
				case 1:
				{
					//trace("Case 1 fired!");
					if(tmpRnd <= 50)
					{	
						if(Math.floor(this.x)/16 == 3 && Math.floor(this.y)/16 < 3)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp6.x + this.width/2 ,PlayState.stairsUp6.y - 8);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp1.x + this.width/2,PlayState.stairsUp1.y+this.height);
					}
					else
						if(Math.floor(this.x)/16 == 8 && Math.floor(this.y)/16 < 17)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp1.x + this.width/2,PlayState.stairsUp1.y+this.height);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp6.x + this.width/2 ,PlayState.stairsUp6.y - 8 );
						
					//trace("End of path = "+Math.floor(endOfPath.x)+","+Math.floor(endOfPath.y)+" or "+Math.floor(endOfPath.x)/16+","+Math.floor(endOfPath.y)/16);
					
					thePath = PlayState.floorW1.findPath(startOfPath,endOfPath);
					break;
				}
				case 2:
				{
					//trace("Case 2 fired!");
					if(tmpRnd <= 20)
					{
						if(Math.floor(this.x)/16 == 3 && Math.floor(this.y)/16 < 3)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp2.x + this.width/2,PlayState.stairsUp2.y + this.height);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn1.x + this.width/2,PlayState.stairsDn1.y + this.height);
					}
					else if(tmpRnd > 20 && tmpRnd <= 40)
					{
						if(Math.floor(this.x)/16 == 8 && Math.floor(this.y)/16 < 3)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp3.x + this.width,PlayState.stairsUp3.y + this.height/2);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp2.x + this.width/2,PlayState.stairsUp2.y + this.height);
					}
					else if(tmpRnd > 40 && tmpRnd <= 60)
					{
						if(Math.floor(this.x)/16 < 2 && Math.floor(this.y)/16 == 9)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp5.x + this.width/2,PlayState.stairsUp5.y);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp3.x + this.width,PlayState.stairsUp3.y + this.height/2);
					}
					else if(tmpRnd > 60 && tmpRnd <= 80)
					{
						if(Math.floor(this.x)/16 == 3 && Math.floor(this.y)/16 < 17)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn6.x + this.width/2,PlayState.stairsDn6.y - 8);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp5.x + this.width/2,PlayState.stairsUp5.y);
					}
					else if(tmpRnd > 80 && tmpRnd <= 100)
					{
						if(Math.floor(this.x)/16 == 8 && Math.floor(this.y)/16 < 17)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn1.x + this.width/2,PlayState.stairsDn1.y + this.height);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn6.x + this.width/2,PlayState.stairsDn6.y - 8);
					}
					
					//trace("End of path = "+Math.floor(endOfPath.x)+","+Math.floor(endOfPath.y)+" or "+Math.floor(endOfPath.x)/16+","+Math.floor(endOfPath.y)/16);
					
					thePath = PlayState.floorW2.findPath(startOfPath,endOfPath);
					
					break;
				}
				case 3:
				{
					//trace("Case 3 fired!");
					if(tmpRnd <= 16)
					{
						if(Math.floor(this.x)/16 == 3 && Math.floor(this.y)/16 < 3)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn2.x + this.width/2,PlayState.stairsDn2.y + this.height);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp1.x + this.width/2,PlayState.stairsUp1.y + this.height);
					}
					else if(tmpRnd > 16 && tmpRnd <= 32)
					{
						if(Math.floor(this.x)/16 == 8 && Math.floor(this.y)/16 < 3)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn3.x + this.width,PlayState.stairsDn3.y + this.height/2);	
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn2.x + this.width/2,PlayState.stairsDn2.y + this.height);
					}
					else if(tmpRnd > 32 && tmpRnd <= 48)
					{
						if(Math.floor(this.x)/16 < 2 && Math.floor(this.y)/16 == 9)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp4.x - 8,PlayState.stairsUp4.y + this.height/2);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn3.x + this.width,PlayState.stairsDn3.y + this.height/2);
					}
					else if(tmpRnd > 48 && tmpRnd <= 64)
					{
						if(Math.floor(this.x)/16 < 11 && Math.floor(this.y)/16 == 9)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn5.x + this.width/2,PlayState.stairsDn5.y);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp4.x - 8,PlayState.stairsUp4.y + this.height/2);
					}
					else if(tmpRnd > 64 && tmpRnd <= 80)
					{
						if(Math.floor(this.x)/16 == 3 && Math.floor(this.y)/16 < 17)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp6.x + this.width/2,PlayState.stairsUp6.y - 8);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn5.x + this.width/2,PlayState.stairsDn5.y);
					}
					else if(tmpRnd > 80 && tmpRnd <= 100)
					{
						if(Math.floor(this.x)/16 == 8 && Math.floor(this.y)/16 < 17)
						{
							endOfPath = new FlxPoint(PlayState.stairsUp1.x + this.width/2,PlayState.stairsUp1.y + this.height);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsUp6.x + this.width/2,PlayState.stairsUp6.y - 8);
					}
					
					//trace("End of path = "+Math.floor(endOfPath.x)+","+Math.floor(endOfPath.y)+" or "+Math.floor(endOfPath.x)/16+","+Math.floor(endOfPath.y)/16);
					
					thePath = PlayState.floorW3.findPath(startOfPath,endOfPath);
					
					break;
				}
				case 4:
				{
					//trace("Case 4 fired!");
					if(tmpRnd <= 33)
					{
						if(Math.floor(this.x)/16 == 3 && Math.floor(this.y)/16 < 3)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn4.x - 8,PlayState.stairsDn4.y + this.height/2);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn1.x + this.width/2,PlayState.stairsDn1.y + this.height);
					}
					else if(tmpRnd > 33 && tmpRnd <= 66)
					{
						if(Math.floor(this.x)/16 < 11 && Math.floor(this.y)/16 == 9)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn6.x + this.width/2,PlayState.stairsDn6.y);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn4.x - 8,PlayState.stairsDn4.y + this.height/2);
					}
					else if(tmpRnd > 66 && tmpRnd <= 100)
					{
						if(Math.floor(this.x)/16 == 8 && Math.floor(this.y)/16 < 17)
						{
							endOfPath = new FlxPoint(PlayState.stairsDn1.x + this.width/2,PlayState.stairsDn1.y + this.height);
						}
						else
							endOfPath = new FlxPoint(PlayState.stairsDn6.x + this.width/2,PlayState.stairsDn6.y);
					}
					
					//trace("End of path = "+Math.floor(endOfPath.x)+","+Math.floor(endOfPath.y)+" or "+Math.floor(endOfPath.x)/16+","+Math.floor(endOfPath.y)/16);
					
					thePath = PlayState.floorW4.findPath(startOfPath,endOfPath);
					
					break;
				}
			}
			
			//trace("The Ghost is at "+Math.floor(this.x)/16+","+Math.floor(this.y)/16);
			if(this.thePath != null)
			{
				this.followPath(thePath,25);
			}
			else
			{
				setPath();
			}
		}
	}
}