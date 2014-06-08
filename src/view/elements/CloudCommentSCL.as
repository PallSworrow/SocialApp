package view.elements 
{
	import flash.geom.Point;
	import PS.elements.cloud.UnderMouseCloud;
	import flash.display.Sprite;
	import PS.Globals;
	import PS.model.text.TextBox;
	import PS.model.text.TLFtextBox;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class CloudCommentSCL extends UnderMouseCloud 
	{
		private var bg:CloudBg;
		private var tf:TLFtextBox;
		public function CloudCommentSCL() 
		{
			super();
			bg = new CloudBg();
			tf = new TLFtextBox(150);
			addChild(bg);
			addChild(tf);
		
		}
		public function set text(value:String):void
		{
			tf.text = value;
		}
		public function get text():String
		{
			return tf.text;
		}
		override protected function initGraphics():void 
		{
			//trace('Cloud width: ' + bg.width);
			tf.y = bg.contentBounds.y;
			bg.setContentSize(tf.width, tf.height);
			
			
			if (globalCoordinates.x +bg.width > Globals.stageWidth)
			{
				tf.x = -(bg.contentBounds.x + bg.contentBounds.width);
				bg.scaleX = -1;
			}
			else 
			{
				tf.x = bg.contentBounds.x;
				bg.scaleX = 1;
			}
		}
	}

}