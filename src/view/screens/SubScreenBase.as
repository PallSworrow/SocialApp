package view.screens 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import model.interfaces.ISubScreen;
	import PS.Globals;
	import PS.lib.SystemEmbeds;
	import PS.model.bases.AnimatedSprite;
	import PS.model.behaviors.displayBehaviors.TweenDisplayBehavior;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class SubScreenBase extends AnimatedSprite implements ISubScreen 
	{
		private var tdb:TweenDisplayBehavior;
		public function SubScreenBase() 
		{
			super();
			addChild(new SystemEmbeds.error_noImage).y=400;
			tdb = new TweenDisplayBehavior();
			tdb.leftBorder = -Globals.stageWidth;
			tdb.rightBorder = Globals.stageWidth;
			addDisplayBehavior(tdb);
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
		}
		
		private function removedFromStage(e:Event):void 
		{
			dispose();
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
	
		
		private function addedToStage(e:Event):void 
		{
			init();
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
		protected function init():void 
		{
			
		}
		protected function dispose():void 
		{
			
		}
		/* INTERFACE model.interfaces.ISubScreen */
		
		public function show(into:DisplayObjectContainer, from:int = 1):void 
		{
			trace('SHOW');
			trace('dir: ' + from);
			x = from * Globals.stageWidth;
			tdb.tweenDir = from;
			disp.addTo(into);
		}
		
		public function tweenOut(to:int = -1):void 
		{
			trace('TWEEN OUT');
			trace('dir: ' + to);
			tdb.tweenDir = to;
			disp.removeFrom(source.parent);
		}
		
		public function sendComand(comand:String, params:Object):void 
		{
			
		}
		
	}

}