package PS 
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import PS.Globals;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class Engine 
	{
		private static var shape:Shape;
		public static function init(mainClip:Sprite,w:int,h:int):void
		{
		
			//check clip type
			trace(Globals);
			Globals._mainStage = mainClip;
			Globals._stageWidth = w;
			Globals._stageHeight = h;
			
		}
		public static function addEnterFrameListener(listener:Function):void
		{
			if (!shape) shape = new Shape();
			shape.addEventListener(Event.ENTER_FRAME, listener);
		}
		public static function removeEnterFrameListener(listener:Function):void
		{
			if (shape)
			{
				if (shape.hasEventListener(Event.ENTER_FRAME));
				shape.removeEventListener(Event.ENTER_FRAME, listener);
			}
		}
	}

}