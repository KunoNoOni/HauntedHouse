package org.flixel {


	import org.flixel.*;


	public class FlxDialog extends FlxGroup{

	/**
	* Use this to tell if dialog is showing on the screen or not.
	*/
	public var showing:Boolean;

	/**
	* The text field used to display the text
	*/
	private var _field:FlxText;

	/**
	* Called when dialog is finished (optional)
	*/
	private var _finishCallback:Function;

	/**
	* Stores all of the text to be displayed. Each "page" is a string in the array
	*/
	private var _dialogArray:Array;

	/**
	* Background rect for the text
	*/
	private var _bg:FlxSprite;


	internal var _pageIndex:int;
	internal var _charIndex:int;
	internal var _displaying:Boolean;
	internal var _displaySpeed:int
	internal var _elapsed:Number;
	internal var _endPage:Boolean;

	public function FlxDialog()
	{

		_bg = new FlxSprite(0, 0).createGraphic(310, 72, 0xffFF8000);
		_bg.scrollFactor.x = _bg.scrollFactor.y = 0;
		add(_bg);

		_field = new FlxText(0, 0, 310, " ");
		_field.scrollFactor.x = _field.scrollFactor.y = 0;
		add(_field);

		_elapsed = 0;

		_displaySpeed = .45;
		_bg.alpha = 0;
	}

	/**
	* Call this from your code to display some dialog
	*/
	public function showDialog(pages:Array):void
	{
		_pageIndex = 0;
		_charIndex = 0;
		_field.text = pages[0].charAt(0);
		_dialogArray = pages;
		_displaying = true;
		_bg.alpha = 1;
		showing = true;
	}

	/**
	* The meat of the class. Used to display text over time as well
	* as control which page is 'active'
	*/
	override public function update():void
	{
			
		if(_displaying)
		{
			_elapsed += FlxG.elapsed;
			if(_elapsed > _displaySpeed)
			{
				_elapsed = 0;
				_charIndex++;
				if(_charIndex > _dialogArray[_pageIndex].length)
				{
					_endPage = true;
					_displaying = false;
				}
				_field.text = _dialogArray[_pageIndex].substr(0, _charIndex);
			}
		}

		if(FlxG.keys.justPressed("X"))
		{
			if(_displaying)
			{
				_displaying = false;
				_endPage = true;
				_field.text = _dialogArray[_pageIndex];
				_elapsed = 0;
				_charIndex = 0;
			}
			else if(_endPage)
			{
				if(_pageIndex == _dialogArray.length - 1)
				{
					//we're at the end of the pages
					_pageIndex = 0;
					_field.text = " "; 
					_bg.alpha = 0;
					if(_finishCallback != null)
						_finishCallback();
					showing = false;
				}
				else
				{
					_pageIndex++;
					_displaying = true;
					_charIndex = 0;
				}
			}
		}
		
	
		super.update();
		
		
		}

		/**
		* Called when the dialog is completely finished
		*/
		public function set finishCallback(val:Function):void
		{
			_finishCallback = val;
		}

	}
}