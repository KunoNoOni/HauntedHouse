package
{
	import org.flixel.*;
		
	public class GameOver extends FlxState
	{
		//Variables got here
		private var tombstone:FlxSprite;
		
		public function GameOver()
		{
			super();
		}
		
		override public function create():void
		{
			
			tombstone = new FlxSprite(18,48,Registry.Tombstone);
			add(tombstone);
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height*0.5-50, 200, "PRESS [X]\nTO PLAY AGAIN");
			logo.setFormat(null,10,0xFFFFFF, "center");
			add(logo);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
			
			super.update();
		}
	}
}