package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var title:FlxSprite
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			title = new FlxSprite(0,0,Registry.Title);
			add(title);
		}
		
		override public function update():void
		{
		
			if(FlxG.keys.X)
				FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}