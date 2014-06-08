package view.elements 
{
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import PS.elements.cloud.Icloud;
	import PS.elements.cloud.UnderMouseCloud;
	import PS.lib.SystemEmbeds;
	import PS.model.bases.SpriteBase;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class VipItem extends UserPreview 
	{
		private var handler:Function;
		private var W:int;
		private var H:int;
		public function VipItem(clickHandler:Function) 
		{
			super();
			handler = clickHandler;
			//trace('VIP ITEM');
			var img:DisplayObject = new SystemEmbeds.error_noImage;
			addChild(img);
			img.width = W=120;
			img.height =H= 100;
			img.x = -img.width / 2;
			img.y = -img.height / 2;
			addEventListener(MouseEvent.ROLL_OVER, rollOver);
			addEventListener(MouseEvent.ROLL_OUT, rollOut);
			//trace('=====');
		}
		
		
		override public function get width():Number 
		{
			return W;
		}
		
		override public function set width(value:Number):void 
		{
			W = value;
		}
		override public function get height():Number 
		{
			return H;
		}
		
		override public function set height(value:Number):void 
		{
			H = value;
		}
		private function rollOut(e:MouseEvent):void 
		{
			TweenLite.to(transform, 0.5, { scaleX:1, scaleY:1 } );
		
			
		}
		
		private function rollOver(e:MouseEvent):void 
		{
			handler(this);
			TweenLite.to(transform, 0.5, { scaleX:1.2, scaleY:1.2 } );
		}
		
	}

}