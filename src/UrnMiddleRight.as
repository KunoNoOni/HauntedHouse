package
{
	import org.flixel.*;
		
	public class UrnMiddleRight extends FlxSprite
	{
		//Variables got here
		public var floor:int;
		
		public function UrnMiddleRight(X:Number, Y:Number)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.mrU,false,false,6,8);
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