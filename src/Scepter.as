package
{
	import org.flixel.*;
		
	public class Scepter extends FlxSprite
	{
		//Variables got here
		public var floor:int;

		public function Scepter(X:Number, Y:Number)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.Scepter,false,false,8,8);
		}
		
		override public function update():void
		{
			this.velocity.x = 0;
			this.velocity.y = 0;
					
			super.update();
		}
		
		public function get Floor():int
		{
			return floor;
		}
		
		public function set Floor(where:int):void 
		{
			floor = where;
		}
	}
}