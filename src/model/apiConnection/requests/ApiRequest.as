package model.apiConnection.requests 
{
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class ApiRequest
	{
		protected var _params:Object;
		protected var _result:Object;
		protected var _complete:Boolean = false;
		
		private var _aborted:Boolean = false;
		private var _link:String;
		
		public function ApiRequest(url:String, parameters:Object) 
		{
			_link = url;
			_params = parameters;
			_handler = handlerFunc;
		}
		public function processTheResult(data:Object):void //override for custom processing
		{
			complete = true;
			_result = data;
		}
		
		
		//GETTERS
		public function get params():Object 
		{
			return _params;
		}
		
		public function get link():String 
		{
			return _link;
		}
		
		
		public function get aborted():Boolean 
		{
			return _aborted;
		}
		
		
		public function set aborted(value:Boolean):void 
		{
			_aborted = value;
		}
		
		public function get result():Object 
		{
			return _result;
		}
		
		public function get complete():Boolean 
		{
			return _complete;
		}
		
		
		
	}

}