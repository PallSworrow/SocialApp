package model 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class Values
	{
		public static const ON_CHANGE:String = 'onchange';
		
		private static var disp:EventDispatcher;
		
		
		private static var _coins:int;
		private static var _points:int;
		private static var _stars:int;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//GETTERS
		static public function get coins():int 
		{
			return _coins;
		}
		static public function get stars():int 
		{
			return _stars;
		}
		static public function get points():int 
		{
			return _points;
		}
		//SETTERS
		static internal function set coins(value:int):void 
		{
			_coins = value;
			dispatchEvent(ON_CHANGE);
		}
		static internal function set points(value:int):void 
		{
			_points = value;
			dispatchEvent(ON_CHANGE);
		}
		static internal function set stars(value:int):void 
		{
			_stars = value;
			dispatchEvent(ON_CHANGE);
		}
		
		//EVENT
		public static function addEventListener(type:String, listener:Function):void 
		{
			if (!disp) disp = new EventDispatcher();
			disp.addEventListener(type, listener);
		}
		
		public static function removeEventListener(type:String, listener:Function):void 
		{
			disp.removeEventListener(type, listener);
		}
		
		private static function dispatchEvent(type:String):void
		{
			if (!disp) disp = new EventDispatcher();
			disp.dispatchEvent(new Event(type));
		}
		
		
		
		//private static var 
		
		
	}

}