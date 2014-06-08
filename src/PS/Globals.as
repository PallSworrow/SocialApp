package PS 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class Globals 
	{
		internal static var _mainStage:Sprite;
		internal static var _stageWidth:int;
		internal static var _stageHeight:int;
		
		
		
		static public function get mainClip():DisplayObject {return _mainStage;}
		static public function get stageWidth():int {return _stageWidth;}
		static public function get stageHeight():int {return _stageHeight;}
	
	}

}