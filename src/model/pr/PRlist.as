package model.pr 
{
	import adobe.utils.ProductManager;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import model.profiles.prObjectProfile;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class PRlist extends EventDispatcher
	{
		//EVENTS:
		public static const ON_CHECK:String = 'oncheck';
		public static const ON_LOAD:String = 'onload';
		public static const ON_NEXT:String = 'onnext';
		
		//inst:
		private var _list:Vector.<prObjectProfile>;
		private var reqStat:Boolean;
		private var _current:prObjectProfile;
		private var checkedItem:prObjectProfile;
		public function PRlist(_type:String,selectRule:Boolean, objs:Vector.<prObjectProfile>=null) 
		{
			reqStat = selectRule;
			if (list) list = objs;
			else{}//connect to server
			
		}
		
		//PRIVATE
			//loading:
		private function onListLoaded(e:Event):void
		{
			
		}
		private function get list():Vector.<prObjectProfile> 
		{
			return _list;
		}
		
		private  function set list(value:Vector.<prObjectProfile>):void 
		{
			_list = value;
			dispatchEvent(new Event(ON_LOAD));
		}
			//next:
		private function onNextCheckComplete(e:Event):void
		{
			if (checkedItem.done == reqStat)
			{
				current = checkedItem;
			}
			else next();
		}
			//check:
		private function onCheckComplete(e:Event):void
		{
			if (current.done != reqStat)
			{
				//save
			}
			dispatchEvent(new Event(ON_CHECK));
		}
		
		
		
		//PUBLIC:
		public function next():void
		{
			if (list.length == 0) current = null;
			else
			{
				checkedItem = list.shift();
				checkedItem.check();
				
				
			}
		}
		public function get current():prObjectProfile
		{
			return _current;
		}
		
		private function set current(value:prObjectProfile):void 
		{
			_current = value;
			dispatchEvent(new Event(ON_NEXT));
		}
		public function check():void
		{
			current.check();
		}
		public function kill():void
		{
			
		}
		
		
	}

}