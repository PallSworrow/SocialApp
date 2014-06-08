package model 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class ConnectionEvent extends Event 
	{
		public static const ON_LOAD:String = 'onload';
		public static const ON_FAIL:String = 'onfail';
		
		
		private var _data:Object
		public function ConnectionEvent(type:String dt:Object ) 
		{
			_data = dt;
			super(type);
			
			
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
	}

}