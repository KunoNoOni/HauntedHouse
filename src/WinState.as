package
{
	import org.flixel.*;
		
	public class WinState extends FlxState
	{
		//Variables got here
		private var largeUrn:FlxSprite;
		
		public function WinState()
		{
			super();
		}
		
		override public function create():void
		{
			var win1:FlxText = new FlxText(FlxG.width*0.5-50,FlxG.height*.5-70, 100, "You got the urn");
			win1.setFormat(null,8,0xFFFFFF, "center");
			add(win1);
			
			var win2:FlxText = new FlxText(FlxG.width*0.5-50,FlxG.height*.5-60, 100, "and escaped the");
			win2.setFormat(null,8,0xFFFFFF, "center");
			add(win2);
			
			var win3:FlxText = new FlxText(FlxG.width*0.5-50,FlxG.height*.5-50, 100, "Haunted House!");
			win3.setFormat(null,8,0xFFFFFF, "center");
			add(win3);
			
			largeUrn = new FlxSprite(18,48,Registry.LargeUrn);
			add(largeUrn);
			
			var playAgain:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height-30, 200, "PRESS [X]\nTO PLAY AGAIN");
			playAgain.setFormat(null,8,0xFFFFFF, "center");
			add(playAgain);
			
			FlxG.play(Registry.winMusic,.8);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
			
			super.update();
		}
	}
}