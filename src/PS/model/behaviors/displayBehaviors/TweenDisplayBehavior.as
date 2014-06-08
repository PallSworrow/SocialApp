package PS.model.behaviors.displayBehaviors 
{
	import com.greensock.TweenMax;
	import flash.display.DisplayObject;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import PS.Interfaces.Itransformable;
	import flash.display.DisplayObjectContainer;
	import PS.Interfaces.behaviors.IdisplayBehavior;
	import PS.Interfaces.IdisplayObject;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class TweenDisplayBehavior implements IdisplayBehavior 
	{
		private var tg:IdisplayObject;
		public var tweenDir:int = 0;
		public var openTime:Number = 0.5;
		public var closeTime:Number = 0.5;
		public var startX:Number = 0;
		public var startY:Number = 0;
		public var leftBorder:int = 0;
		public var rightBorder:int = 0;
		public var upperBorder:int = 0;
		public var lowwerBorder:int = 0;
		
		private var blurf:BlurFilter;
		
		private var _x:int;
		private var _y:int;
		private var _alpha:int;
		
		public function TweenDisplayBehavior() 
		{
			
		}
		
		/* INTERFACE PS.Interfaces.behaviors.IdisplayBehavior */
		
		public function init(target:IdisplayObject):void 
		{
			
			tg = target;
			trace('INIT');
			
		}
		
		public function kill():void 
		{
			tg = null;
		}
		private var currTween:TweenMax;
		public function addTo(container:DisplayObjectContainer):void 
		{
			trace('ADD TO');
			tg.addTo(container);
			TweenMax.killTweensOf(transform);
			currTween = TweenMax.to(transform, openTime, { x:startX, y:startY, alpha:1 } );
		}
		
		
		public function removeFrom(container:DisplayObjectContainer):void 
		{
			trace('REMOVE');
			trace(tweenDir);
			TweenMax.killTweensOf(transform);
			if (tweenDir > 0) currTween = TweenMax.to(transform, closeTime, { x:rightBorder, y:upperBorder, alpha:0, onComplete:removeComplete,onCompleteParams:[container]  } );
			if (tweenDir == 0)currTween =  TweenMax.to(transform, closeTime, { x:startX, y:startY, alpha:0, onComplete:removeComplete ,onCompleteParams:[container] } );
			if (tweenDir < 0) currTween = TweenMax.to(transform, closeTime, { x:leftBorder, y:lowwerBorder, alpha:0, onComplete:removeComplete ,onCompleteParams:[container] } );
		}
		
		private function removeComplete(container:DisplayObjectContainer):void 
		{
			trace('REMOVE COMPLETE');
			tg.removeFrom(container);
		}
		
		public function isChildOf(container:DisplayObjectContainer):Boolean 
		{
			return tg.isChildOf(container);
		}
		
		public function get transform():Itransformable 
		{
			return tg.transform;
		}
		
		
		
		
	}

}