package PS.elements 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import PS.Interfaces.Itransformable;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class ProgressBar extends Sprite implements Itransformable
	{
		private var bg:DisplayObject;
		private var fill0:DisplayObject;
		private var fill1:DisplayObject;
		private var _progress:Number;
		private var _load:Number;
		public function ProgressBar(bgTex:DisplayObject, progressTex:DisplayObject, loadTex:DisplayObject = null ) 
		{
			super();
			bg = bgTex; 
			fill0 = progressTex;
			fill1 = loadTex;
			addChild(bg);
			if (fill1) 
			{
				trace('add load fill');
				addChild(fill1);
				fill1.width = 0;
			}
			addChild(fill0);
			fill0.width = 0;
			
			
		}
	
		public function get load():Number 
		{
			return _load;
		}
		
		public function set load(value:Number):void 
		{
			if(!fill1) return
			if (value > 1) value = 1;
			if (value < 0) value = 0;
			
			fill1.width = bg.width * value;
			_load = value;
		}
		
		public function get progress():Number 
		{
			return _progress;
		}
		
		public function set progress(value:Number):void 
		{
			if (value > 1) value = 1;
			if (value < 0) value = 0;
			fill0.width = bg.width * value;
			_progress = value;
		}
		
	
	}

}