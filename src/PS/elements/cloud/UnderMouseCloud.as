package PS.elements.cloud
{
	import air.update.core.UpdaterConfiguration;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	import PS.Interfaces.behaviors.ItransformBehavior;
	import PS.Interfaces.Icontainer;
	import flash.display.InteractiveObject;
	import PS.Interfaces.Itransformable;
	import PS.lib.SystemEmbeds;
	import PS.model.bases.AnimatedSprite;
	import PS.model.bases.SpriteBase;
	import PS.model.behaviors.displayBehaviors.ZoomDisplayBehavior;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class UnderMouseCloud extends AnimatedSprite implements Icloud
	{
		private var tg:InteractiveObject;
		private var cnt:DisplayObjectContainer;
		public var openDelay:int = 500;
		public var closeDelay:int = 50;
		private var _openTime:int;
		private var _closeTime:int;
		private var openDelayTimer:uint;
		
		private var closeDelayTimer:uint;
		private var behav:ZoomDisplayBehavior;
		
		
		public function UnderMouseCloud()
		{
			super();
			behav = new ZoomDisplayBehavior();
			addDisplayBehavior(behav);
			//addChild(new SystemEmbeds.error_noImage);
		}
		private var followTrig:DisplayObject;
		private var globalTrigPos:Point;
		private var localTrigPos:Point;
		private var relativeItemPos:Point;
		public function follow(trigger:DisplayObject):void
		{
			followTrig = trigger;
			globalTrigPos = trigger.parent.localToGlobal(new Point(trigger.x, trigger.y));
			localTrigPos = cnt.globalToLocal(globalTrigPos);
			relativeItemPos = new Point(x - localTrigPos.x, y - localTrigPos.y);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void 
		{
			globalTrigPos = followTrig.parent.localToGlobal(new Point(followTrig.x, followTrig.y));
			localTrigPos = cnt.globalToLocal(globalTrigPos);
			x = localTrigPos.x + relativeItemPos.x;
			y = localTrigPos.y + relativeItemPos.y;
			
		}
	
		public function stopFollowing():void
		{
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		/* INTERFACE PS.elements.cloud.Icloud */
		
		public function init(trigger:InteractiveObject, container:DisplayObjectContainer):void
		{
			tg = trigger;
			cnt = container;
			tg.addEventListener(MouseEvent.ROLL_OVER, tg_rollOver);
			tg.addEventListener(MouseEvent.ROLL_OUT, tg_rollOut);
			source.addEventListener(MouseEvent.ROLL_OVER, source_rollOver);
			source.addEventListener(MouseEvent.ROLL_OUT, source_rollOut);
		}
		
		private function source_rollOut(e:MouseEvent):void
		{
			//trace('src: --');
			isOver --;
		}
		
		
		private function source_rollOver(e:MouseEvent):void
		{
			//trace('src: ++');
			isOver ++;
		}
		private var isShown:Boolean = false;
		private var _isOver:int = 0;
		
		private function tg_rollOut(e:MouseEvent):void
		{
		//	trace('trig: --');
			isOver --;
		}
		
		private function tg_rollOver(e:MouseEvent):void
		{
		//	trace('trig: ++');
			
			if (!isShown)
			{
				openDelayTimer = setTimeout(show, openDelay);
			}
			isOver++;
		}
		private function show():void
		{
			
		//	trace('show');
			disp.addTo(cnt);
			isShown = true
			initGraphics();
			
		}
		protected function initGraphics():void
		{
			
		}
		protected function disposeGraphics():void
		{
			
		}
		private function hide():void
		{
			disposeGraphics();
			//trace('hide');
			disp.removeFrom(cnt);
			
			isShown = false;
			clearTimeout(closeDelayTimer);
		}
		public function forceShow():void
		{
		}
		
		
		
		/* INTERFACE PS.elements.cloud.Icloud */
		
		public function setContent(content:Object):void 
		{
			
		}
		
		/* INTERFACE PS.elements.cloud.Icloud */
		
		public function forceHide():void 
		{
			
		}
		
		public function get isOver():int
		{
			return _isOver;
		}
		
		public function set isOver(value:int):void
		{
			//trace('over=' + value);
			_isOver = value;
			if (_isOver >0)
			{
				clearTimeout(closeDelayTimer);
			}
			else
			{
				clearTimeout(openDelayTimer);
				closeDelayTimer = setTimeout(check, 50);
			}
			
		}
		
		public function get openTime():int 
		{
			return behav.openTime;
		}
		
		public function set openTime(value:int):void 
		{
			behav.openTime = value;
		}
		
		public function get closeTime():int 
		{
			return behav.closeTime;
		}
		
		public function set closeTime(value:int):void 
		{
			behav.closeTime = value;
		}
		private function check():void
		{
			trace('check');
			trace(isOver <= 0 && isShown);
			if (isOver==0 && isShown) hide();
		}
	}

}