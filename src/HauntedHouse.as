package
{
	import org.flixel.*;
	
	[SWF(width="192", height="304", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class HauntedHouse extends FlxGame
	{
		public function HauntedHouse()
		{
			super(96,152,TitleState,2,60,60);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}