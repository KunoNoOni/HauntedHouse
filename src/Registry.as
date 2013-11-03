package
{
	import org.flixel.*;

	public class Registry
	{
		public static var levelIndex:int;
		public static var lightOn:Boolean;
		public static var timerSet:Boolean;
		public static var timerSet2:Boolean;
		public static var moving:Boolean;
		public static var dropItem:Boolean;
		public static var wind:Boolean;
		public static var scared:Boolean;
		public static var matches:int;
		public static var lives:int;
		public static var Game1:Boolean;
		public static var Game2:Boolean;
		public static var Game3:Boolean;
		public static var Game4:Boolean;
		public static var Game5:Boolean;
		public static var Game6:Boolean;
		public static var Game7:Boolean;
		public static var Game8:Boolean;
		public static var Game9:Boolean;
		
		[Embed(source = 'Sprites/buildTiles.png')] static public var buildTile:Class;
		[Embed(source = 'Sprites/Player.png')] static public var player:Class;
		[Embed(source = 'Sprites/light.png')] static public var light:Class;
		[Embed(source = 'Sprites/blackSquare.png')] static public var bs:Class;
		[Embed(source = 'Sprites/urnLeft.png')] static public var uLeft:Class;
		[Embed(source = 'Sprites/urnRight.png')] static public var uRight:Class;
		[Embed(source = 'Sprites/urnMiddle.png')] static public var uMiddle:Class;
		[Embed(source = 'Sprites/scepter.png')] static public var Scepter:Class;
		[Embed(source = 'Sprites/key.png')] static public var mKey:Class;
		[Embed(source = 'Sprites/fullUrn.png')] static public var fullUrn:Class;
		[Embed(source = 'Sprites/midRightUrn.png')] static public var mrU:Class;
		[Embed(source = 'Sprites/midLeftUrn.png')] static public var mlU:Class;
		[Embed(source = 'Sprites/urnHandles.png')] static public var uHandles:Class;
		[Embed(source = 'Sprites/bat.png')] static public var Bat:Class;
		[Embed(source = 'Sprites/ghost.png')] static public var Ghost:Class;
		[Embed(source = 'Sprites/spider.png')] static public var Spider:Class;
		[Embed(source = 'Sprites/tombstone.png')] static public var Tombstone:Class;
		[Embed(source = 'Sprites/largeUrn.png')] static public var LargeUrn:Class;
		[Embed(source = 'Sprites/title.png')] static public var Title:Class;
		[Embed(source = 'Sprites/mainMenu.png')] static public var MainMenu:Class;
		[Embed(source = 'Sprites/1.png')] static public var OneRed:Class;
		[Embed(source = 'Sprites/1 gray.png')] static public var OneGray:Class;
		[Embed(source = 'Sprites/2.png')] static public var TwoRed:Class;
		[Embed(source = 'Sprites/2 gray.png')] static public var TwoGray:Class;
		[Embed(source = 'Sprites/3 gray.png')] static public var ThreeGray:Class;
		[Embed(source = 'Sprites/4 gray.png')] static public var FourGray:Class;
		[Embed(source = 'Sprites/5 gray.png')] static public var FiveGray:Class;
		[Embed(source = 'Sprites/6 gray.png')] static public var SixGray:Class;
		[Embed(source = 'Sprites/7 gray.png')] static public var SevenGray:Class;
		[Embed(source = 'Sprites/8 gray.png')] static public var EightGray:Class;
		[Embed(source = 'Sprites/9 gray.png')] static public var NineGray:Class;
		

		[Embed(source = 'Maps/mapCSV_Group1_Floor_1.csv', mimeType = 'application/octet-stream')] static public var f1:Class;
		
		[Embed(source = 'Maps/mapCSV_Group2_Floor_1_Walls.csv', mimeType = 'application/octet-stream')] static public var fw1:Class;
		[Embed(source = 'Maps/mapCSV_Group2_Floor_2_Walls.csv', mimeType = 'application/octet-stream')] static public var fw2:Class;
		[Embed(source = 'Maps/mapCSV_Group2_Floor_3_Walls.csv', mimeType = 'application/octet-stream')] static public var fw3:Class;
		[Embed(source = 'Maps/mapCSV_Group2_Floor_4_Walls.csv', mimeType = 'application/octet-stream')] static public var fw4:Class;
		[Embed(source = 'Maps/mapCSV_Group2_Floor_Walls_Black.csv', mimeType = 'application/octet-stream')] static public var fwb:Class;
		
		[Embed(source = 'sounds/bumping.mp3')] static public var bumping:Class;
		[Embed(source = 'sounds/dropItem.mp3')] static public var dItem:Class;
		[Embed(source = 'sounds/movement.mp3')] static public var movement:Class;
		[Embed(source = 'sounds/walking-sound-2.mp3')] static public var movement2:Class;
		[Embed(source = 'sounds/pickupItem1.mp3')] static public var pickupItem1:Class;
		[Embed(source = 'sounds/pickupItem2.mp3')] static public var pickupItem2:Class;
		[Embed(source = 'sounds/pickupItem3.mp3')] static public var pickupItem3:Class;
		[Embed(source = 'sounds/scared2.mp3')] static public var scared2:Class;
		[Embed(source = 'sounds/stairsUp.mp3')] static public var stairsUp:Class;
		[Embed(source = 'sounds/stairsDn.mp3')] static public var stairsDn:Class;
		[Embed(source = 'sounds/wind2.mp3')] static public var windSound2:Class;
		[Embed(source = 'sounds/winMusic2.mp3')] static public var winMusic:Class;
		
		
		//[Embed(source="../assets/celtic-bitty.ttf", fontFamily="Celtic", embedAsCFF="false")] static public var fntCeltic:String;
		
		
		public function Registry()
		{
		}
	}
}