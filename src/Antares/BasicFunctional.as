package Antares 
{
	import flash.display.DisplayObject;
	import flash.display.NativeWindowDisplayState;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.NativeWindowDisplayStateEvent;
	import flash.events.TimerEvent;
	import flash.events.TouchEvent;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.utils.Timer;
	import PS.controller.Controller;
	import PS.controller.TapController;
	import PS.PSmodel.Globals;
	import PS.PSmodel.LogTracker;

	/**
	 * ...
	 * @author 
	 */
	
	 /*/
	  - corners
	  - 'T' enable/disable mouse
	  - F - full/normal screen
	  - main preloader
	  - back to main when downtime
 	 
	 
	 
	 //*/
	public class BasicFunctional 
	{
		
		public static function init() :void
		{
			if (!Globals.mainClip) {/*error*/ LogTracker.write('Globals are not inited', 'error', 'basicFunctional'); return; }
			
			Globals.mainClip.stage.addEventListener(KeyboardEvent.KEY_DOWN, onStageKeyDown);
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			Globals.mainClip.stage.addEventListener(TouchEvent.TOUCH_TAP, restoreFS);
			
			Globals.mainClip.stage.nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE, onDisplayStateChange);
			
			//setScreenState(StageDisplayState.FULL_SCREEN_INTERACTIVE);
		
		}
		
		static private function onDisplayStateChange(event:NativeWindowDisplayStateEvent):void
        {
            if (event.afterDisplayState == NativeWindowDisplayState.MAXIMIZED) setScreenState(StageDisplayState.FULL_SCREEN_INTERACTIVE);
        }
		//CORNERS-------------------------------------------
		private static var id1:int = -1;
		private static var id2:int = -1;
		private static var time1:Timer;
			
		private static var x0:int;
		private static var y0:int;
		private static var x1:int;
		private static var y1:int;
		static private function restoreFS(e:TouchEvent):void 
		{
			if (id1 == -1)//первое касание
			{
				trace('touch1')
				id1 = e.touchPointID;
				x0 = e.stageX;
				y0 = e.stageY;
			}
		
			else if(e.touchPointID != id1)//зканчиваем жест состоящий из двух прикосновений
			{
				trace('touch2')
				id1 = id2 = -1;
				x1 = e.stageX;
				y1 = e.stageY;
				if (Math.sqrt((x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1)) > Globals.stageWidth*1.01)
				{
					LogTracker.write('Corners!', 'cornersTap', 'BasicFunctional');
					setScreenState(StageDisplayState.NORMAL);
				}
			}
			else
			{
				trace('reset')
				id1 = id2 = -1;
			}
		}
		//====================================================================
		
		
		//HOT KEYS----------------------------------------------
		static private function onStageKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.F) changeDisplayState();
			if (e.keyCode == Keyboard.T) changeMouseStat();
			
		}
		//mouse:
		private static var mouse:Boolean = true;
		static private function changeMouseStat():void 
		{
			if (mouse)	Mouse.hide();
			else Mouse.show();
				
			mouse = !mouse;
		}
		
		//full screen switch
		static private function changeDisplayState():void 
		{
			if (Globals.mainClip.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE) 
				setScreenState(StageDisplayState.NORMAL);
            else 
				setScreenState(StageDisplayState.FULL_SCREEN_INTERACTIVE);
		}
		private static function setScreenState(state:String):void
		{
			Globals.mainClip.stage.displayState = state;
		}
		//=========================================================================================
		
		
		//DOWNTIME------------------------------------------------------------
		private static var downtimeTimer:Timer;
		private static var downTimeHandler:Function;
		private static const downtimeLimit:int=5; // in minutes
		private static var ctrl:TapController;
		public static function addDowntimeFunction(func:Function):void
		{
			downTimeHandler = func;
			ctrl = Controller.addTapListener(Globals.mainClip.stage);
			ctrl.addEventListener(TapController.ON_PRESS, stagePress);
			
			downtimeTimer = new Timer(downtimeLimit*60000);
			downtimeTimer.start();
			downtimeTimer.addEventListener(TimerEvent.TIMER, downTimeTick);
		}
		public static function stopDownTimeFunction():void
		{
			
			ctrl.removeEventListener(TapController.ON_PRESS, stagePress);
			ctrl.enabled = false;
			
			
			downtimeTimer.stop();
			downtimeTimer.removeEventListener(TimerEvent.TIMER, downTimeTick);
			downtimeTimer = null;
		}
		
		
		static private function downTimeTick(e:Event):void 
		{
			downTimeHandler();
		}
		
		static private function stagePress(e:Event):void 
		{
			downtimeTimer.reset();
			downtimeTimer.start();
		}
		
		
		
		
		
		//==================================================================================
	}

}