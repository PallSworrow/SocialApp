package PSgame.character 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class viewPart  
	{
		private var item:MovieClip;
		public function viewPart(Item:MovieClip,val:int) 
		{
			item = Item;
			currentVal = val;
			super();
			
		}
		public function update():void//every frame! need? test
		{
			if (item.currentFrame != currentVal) item.gotoAndStop(currentVal);
		}
		public function get currentVal():int 
		{
			return _currentVal;
		}
		
		public function set currentVal(value:int):void 
		{
			_currentVal = value;
			update();
		}
		
		
	}

}