package view.elements 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.geom.Rectangle;
	import PS.lib.SystemEmbeds;
	import PS.model.text.TextBox;
	import flash.text.TextField
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class CloudBg extends Sprite 
	{
	
		private var  cr:Rectangle
		private var minBgOffset:int = 8;
		private var _randomOffset:int = 10;
		//private var tf:DisplayObject;
		public function CloudBg() 
		{
			super();
			cr = new Rectangle(40, 60, 250, 1);
			//tf = new SystemEmbeds.error_noImage;
			
			//tf.x = 40;
			//tf.y = 60;
			//addChild(tf);
			setContentSize(150, 1);
			
		}
		public function setContentSize(w:int, h:int):void
		{
			cr.width = w;
			cr.height = h;
			/*tf.width = w;
			tf.height = h;
			*/
			graphics.clear();
			graphics.beginFill(0xffffff);
			
			//graphics.lineStyle(1, 0x000000);
			graphics.lineTo(cr.x + 20, cr.y - minBgOffset);
			graphics.lineTo(cr.x + cr.width + minBgOffset+randomOffset, cr.y - minBgOffset-randomOffset);
			graphics.lineTo(cr.x + cr.width + minBgOffset+randomOffset, cr.y +cr.height+ minBgOffset+randomOffset);
			graphics.lineTo(cr.x - minBgOffset, cr.y +cr.height+ minBgOffset);
			graphics.lineTo(0,0);
			graphics.endFill();
			filters = [new DropShadowFilter(5,50,0x000000,0.4)];
			
			
		}
		
		public function get randomOffset():int 
		{
			return _randomOffset*Math.random()+3;
		}
		
		public function get contentBounds():Rectangle 
		{
			return cr;
		}
		
	}

}