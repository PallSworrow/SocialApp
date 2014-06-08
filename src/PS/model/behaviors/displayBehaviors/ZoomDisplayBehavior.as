package PS.model.behaviors.displayBehaviors 
{
	import com.greensock.easing.Elastic;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import flash.display.DisplayObjectContainer;
	import PS.Interfaces.behaviors.IdisplayBehavior;
	import PS.Interfaces.IdisplayObject;
	import PS.Interfaces.Itransformable;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class ZoomDisplayBehavior implements IdisplayBehavior 
	{
		private var tg:IdisplayObject;
		
		public var openTime:int = 500;
		public var closeTime:int = 500;
		public function ZoomDisplayBehavior() 
		{
			
		}
		
		/* INTERFACE PS.Interfaces.behaviors.IdisplayBehavior */
		
		public function init(target:IdisplayObject):void 
		{
			//trace('init behavior');
			tg = target;
		}
		
		public function kill():void
		{
			tg = null;
		}
		private var shown:Boolean = false
		private var added:Boolean = false;
		public function addTo(container:DisplayObjectContainer):void 
		{
			//trace('ADD');
			if(!shown)
			{
				tg.transform.scaleX = 0;
				tg.transform.scaleY = 0;
				shown = true;
			}
			tg.addTo(container);
			added = true;
			shown = true;
			TweenLite.to(tg, openTime/1000, { scaleX:1, scaleY:1, ease: Elastic.easeOut } );
		}
		
		public function removeFrom(container:DisplayObjectContainer):void 
		{
			//trace('REMOVE');
			added = false;
			TweenMax.to(tg, closeTime/1000, { scaleX:0, scaleY:0,onComplete:onRemoved,onCompleteParams:[container] } );
		}
		private function onRemoved(cnt:DisplayObjectContainer):void
		{
			//trace('remove complete');
			//trace('added: ' + shown);
			if (!added && shown)
			{
				
				shown = false;
				tg.removeFrom(cnt);
			}
		}
		public function isChildOf(container:DisplayObjectContainer):Boolean 
		{
			if (tg.isChildOf(container) != -1) return true;
			else return false;
		}
		
		/* INTERFACE PS.Interfaces.behaviors.IdisplayBehavior */
		
		public function get transform():Itransformable 
		{
			return tg.transform;
		}
		
	}

}