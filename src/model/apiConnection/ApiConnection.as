package model.apiConnection 
{
	import air.update.events.DownloadErrorEvent;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import model.apiConnection.requests.ApiRequest;
	import model.ConnectionEvent;
	import PS.PSmodel.Engine;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class ApiConnection extends EventDispatcher
	{
		
		
		private static const reqsInterval:int = 400;
		private static var reqsPull:Vector.<ApiRequest> = new Vector.<ApiRequest>;
		private static var cooldown:int = -1;
		
		
		private var current:ApiRequest;
		public function ApiConnection() 
		{
			if (cooldown == -1) init();//first request
		}
		public function load(req:ApiRequest):void
		{
			if (current) abort();
			current = req;
			
			if (cooldown <= 1000) sendRequest(req);
			else reqsPull.push(req);
		}
		public function abort():void
		{
			if (current) current.aborted = true;
		}
		protected function onLoad(data:Object):void
		{
			if (current.aborted) break;
			
			current.processTheResult(data);
			
			if (current.complete) 
			{
				dispatchEvent(new ConnectionEvent(ConnectionEvent.ON_LOAD, current.result));
				current = null;
			}
			else load(current);
		}
		
		
		
		private static function sendRequest(req:ApiRequest, loader:ApiConnection):void
		{
			cooldown += reqsInterval;
		
			//init Api Call
		}
		private static function onRequestFail(e:Object):void
		{
			//ERROR
		}
		
		
		
		
		
		private static function init():void
		{
			cooldown = 0;
			Engine.instance.addEventListener(Event.ENTER_FRAME, cooldownSupport);
		}
		
		static private function cooldownSupport(e:Event):void 
		{
			if (cooldown > 0) cooldown -= 1000 / Engine.frameRate;
			
		}
		
		
		static private function checkPull():void
		{
			var req:ApiRequest;
			while (reqsPull.length > 0 )
			{
				req = reqsPull.shift();
				if (!req.aborted)
				{
					sendRequest(req);
					break;
					
				}
			}
		}
	}

}