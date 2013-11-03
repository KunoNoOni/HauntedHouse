package
{
	import org.flixel.*;
		
	public class Light extends FlxSprite
	{
		//Variables got here

		public function Light(X:Number, Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry.light,true,false,24,24);
			addAnimation("flicker",[0,1],5,true);
		}
		
		override public function update():void
		{
			//this.velocity.x = 0;
			//this.velocity.y = 0;
			this.play("flicker");
		
			super.update();
		}
	}
}