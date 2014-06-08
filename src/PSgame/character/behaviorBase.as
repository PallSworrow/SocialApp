package PSgame.character 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class behaviorBase extends EventDispatcher
		
		public static const ON_COMPLETE:String = 'oncomplete'; 
		
		protected var _status:int;//
		/*
		-1 restricted
		0 ready
		1 in process
		2 complete
		*/
		public function behaviorBase() 
		{
			super(this);
			_status = 0;
			
		}
		public function start():void
		{
			if (_status == -1) return;
			
		}
		protected function onComplete():void
		{
			_status = 2;
			dispatchEvent(new Event(ON_COMPLETE));
		}
		
		//public function 
		public function get status():int 
		{
			return _status;
		}
		public function get restricted():Boolean
		{
			if (_status == -1) return true;
			else return false;
		}
		public function set restricted(val:Boolean):void
		{
			if (val == false) _status = -1;
		}
	}

}