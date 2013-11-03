package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxDelay;
		
	public class Player extends FlxSprite
	{
		//Variables got here
		private var timer:FlxDelay;


		public function Player(X:Number, Y:Number)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.player,true,false,12,5);
			addAnimation("standing",[0],1);
			addAnimation("up",[1],1);
			addAnimation("upleft",[2],1);
			addAnimation("left",[3],1);
			addAnimation("downleft",[4],1);
			addAnimation("down",[5],1);
			addAnimation("downright",[6],1);
			addAnimation("right",[7],1);
			addAnimation("upright",[8],1);
			addAnimation("scared",[1,2,3,4,5,6,7,8],30,true);
			
			timer = new FlxDelay(1);
			timer.start();
		}
		
		override public function update():void
		{
			this.velocity.x = 0;
			this.velocity.y = 0;
			
			if(!Registry.scared)
				this.play("standing");
			
			Registry.moving = false;	
			
			if(!Registry.scared)
			{
				if(FlxG.keys.LEFT)
				{
					this.play("left");
					this.velocity.x = -50;
					Registry.moving = true;
					playWalkingSound();
				}
				
				if(FlxG.keys.RIGHT)
				{
					this.play("right");
					this.velocity.x = 50;
					Registry.moving = true;
					playWalkingSound();
				}
	
				if(FlxG.keys.UP)
				{
					this.play("up");
					this.velocity.y = -50;
					Registry.moving = true;
					playWalkingSound();
				}
				
				if(FlxG.keys.DOWN)
				{
					this.play("down");
					this.velocity.y = 50;
					Registry.moving = true;
					playWalkingSound();
				}
				
				if(this.velocity.x == -50 && this.velocity.y == -50)
				{
					this.play("upleft");
					Registry.moving = true;
					playWalkingSound();
				}
				
				if(this.velocity.x == -50 && this.velocity.y == 50)
				{
					this.play("downleft");
					Registry.moving = true;
					playWalkingSound();
				}
				
				if(this.velocity.x == 50 && this.velocity.y == -50)
				{
					this.play("upright");
					Registry.moving = true;
					playWalkingSound();
				}
				
				if(this.velocity.x == 50 && this.velocity.y == 50)
				{
					this.play("downright");
					Registry.moving = true;
					playWalkingSound();
				}
				
				
			}
				
			if(FlxG.keys.justPressed('SPACE'))
			{
				//saved for lighting match
				if(Registry.lightOn)
				{
					Registry.dropItem = true;
					//trace("dropItem is now set to TRUE");
				}
				else if(!Registry.lightOn && !Registry.wind)
				{
					Registry.lightOn = true;
					Registry.matches += 1;
					if(Registry.matches < 10)
					{
						PlayState.hudMatches.text = "0"+Registry.matches;
					}
					else
					{
						PlayState.hudMatches.text = ""+Registry.matches;
					}
				}
			}
			
			super.update();
			
			if(Registry.scared)
			{
				FlxG.flash(0xFFFFFFFF,.3);
				this.play("scared");
			}
		}
		
		private function playWalkingSound():void
		{
			if(!timer.isRunning)
			{
				if(timer.hasExpired)
				{
					trace("playing sound");
					FlxG.play(Registry.movement2,.8);
				}
				trace("Timer Reset");
				timer.reset(500);
				
			}
			
		}
		
		public function playerX():int
		{
			return Math.floor(this.x)/16;
		}
		
		public function playerY():int
		{
			return Math.floor(this.y)/16;
		}
	}
}