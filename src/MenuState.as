package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		//Variables got here
		private var mainMenu:FlxSprite;
		private var oneRed:FlxSprite;
		private var oneGray:FlxSprite;
		private var twoRed:FlxSprite;
		private var twoGray:FlxSprite;
		private var threeGray:FlxSprite;
		private var fourGray:FlxSprite;
		private var fiveGray:FlxSprite;
		private var sixGray:FlxSprite;
		private var sevenGray:FlxSprite;
		private var eightGray:FlxSprite;
		private var nineGray:FlxSprite;
		private var mouseX:int;
		private var mouseY:int;
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			Registry.Game1 = Registry.Game2 = Registry.Game3 = Registry.Game4 = Registry.Game5 = 
				Registry.Game6 = Registry.Game7 = Registry.Game8 = Registry.Game9 = false;
			mainMenu = new FlxSprite(0,0,Registry.MainMenu);
			add(mainMenu);
			oneGray = new FlxSprite(5,137,Registry.OneGray);
			add(oneGray);
			oneRed = new FlxSprite(5,137,Registry.OneRed);
			add(oneRed);
			twoGray = new FlxSprite(15,137,Registry.TwoGray);
			add(twoGray);
			twoRed = new FlxSprite(15,137,Registry.TwoRed);
			add(twoRed);
			threeGray = new FlxSprite(25,137,Registry.ThreeGray);
			add(threeGray);
			fourGray = new FlxSprite(35,137,Registry.FourGray);
			add(fourGray);
			fiveGray = new FlxSprite(45,137,Registry.FiveGray);
			add(fiveGray);
			sixGray = new FlxSprite(55,137,Registry.SixGray);
			add(sixGray);
			sevenGray = new FlxSprite(65,137,Registry.SevenGray);
			add(sevenGray);
			eightGray = new FlxSprite(75,137,Registry.EightGray);
			add(eightGray);
			nineGray = new FlxSprite(85,137,Registry.NineGray);
			add(nineGray);
			
			FlxG.mouse.show();

		}
		
		override public function update():void
		{
			mouseX = FlxG.mouse.screenX;
			mouseY = FlxG.mouse.screenY;
			
			oneRed.visible = false;
			twoRed.visible = false;
			
			if(FlxG.keys.justPressed("Q"))
			{
				trace("mouseX = "+mouseX);
				trace("mouseY = "+mouseY);
			}
			
			if(mouseX >= 5 && mouseX <= 10 && mouseY >=137 && mouseY <= 147)
			{
				oneRed.visible = true;
				if(FlxG.mouse.justPressed())
				{
					Registry.Game1 = true;
					switchToPlayState();
				}
			}
			
			if(FlxG.mouse.screenX >= 15 && FlxG.mouse.screenX <= 20 && mouseY >=137 && mouseY <= 147)
			{
				twoRed.visible = true;
				if(FlxG.mouse.justPressed())
				{
					Registry.Game2 = true;
					switchToPlayState();
				}
			}
			
			super.update();
		}
		
		private function switchToPlayState():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState());
		}
	}
}