package com.antares.framework.server 
{
	import Antares.Settings;
	import flash.events.Event;
	import flash.events.IOErrorEvent;     // добавлено
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.events.HTTPStatusEvent;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import com.antares.Globals;     // добавлено !!!
	
	/**
	 * ...
	 * @author WD
	 */
	public class ServerLoader extends URLLoader 
	{
		
        private static var _serverLoader:ServerLoader;
        
        public static function get instance():ServerLoader
        {
            if (!_serverLoader) _serverLoader = new ServerLoader();
            return _serverLoader;
        }
		
		
		public static var host:String = Settings.HOST;
		public static var userName:String = Settings.USER_NAME;
		public static var password:String = Settings.PASSWORD;

		public var answer:Array;
		public var msg:String;
	
		private static var _isLoggedIn:Boolean = false;
		
		private var reque:URLRequest;     // добавлено
		//private var mark:ErrorMark = new ErrorMark();     // добавлено !!!
		
		public function ServerLoader(request:URLRequest=null) 
		{
			super(request);
			if (!_isLoggedIn) this.reLogin(); 
		}
		
		protected function getAjaxRequest(url:String):URLRequest
		{
			var req:URLRequest = new URLRequest(url);
			req.requestHeaders = new Array(new URLRequestHeader("X-Requested-With","XMLHttpRequest"));
			return req;
		}

		
		public function reLogin():void
		{
			trace("Server relogin");
			reque = this.getAjaxRequest(host+Settings.LOGIN_URL); // изменено
			reque.method = URLRequestMethod.POST; // изменено
			reque.data = new URLVariables(); // изменено
			reque.data["name"] = userName; // изменено
			reque.data["password"] = password; // изменено
			this.addEventListener(Event.COMPLETE, urlLoader_complete);
			this.addEventListener(IOErrorEvent.IO_ERROR, urlLoader_error);     // добавлено
			this.load(reque); // изменено
		}

		protected function urlLoader_complete(evt:Event):void
		{
			this.removeEventListener(Event.COMPLETE, urlLoader_complete);
			this.removeEventListener(IOErrorEvent.IO_ERROR, urlLoader_error);     // добавлено
			(this.data == "200 Login success")?(_isLoggedIn = true):(_isLoggedIn = false);	
			if (_isLoggedIn) { trace("Server relogin succeded"); }
			dispatchEvent(new Event("LOGIN"));
		}
		
		protected function urlLoader_error(evt:IOErrorEvent):void     // добавлено
		{
			this.load(reque);
		}
		
		
		public function getStructureXML(categoryId:int):Boolean
		{
			if (_isLoggedIn)
			{
				var req:URLRequest = this.getAjaxRequest(host + Settings.STRUCTURE_URL + categoryId);
				req.idleTimeout = 600000;     // добавлено !!!
				trace("getStructureXML",categoryId);
				this.addEventListener(Event.COMPLETE, xmlLoader_Result);
				this.addEventListener(IOErrorEvent.IO_ERROR, xmlLoader_Error);     // добавлено !!!
				this.load(req);
				return true;
			}
			else
			{
				return false;
			}			
		}
		
		public function getDataList(categoryId:int):Boolean
		{
			if (_isLoggedIn)
			{
				var req:URLRequest = this.getAjaxRequest(host+Settings.DATA_LIST_URL+categoryId);
				trace("getDataList",categoryId);
				this.addEventListener(Event.COMPLETE, urlLoader_Result);
				this.load(req);
				return true;
			}
			else
			{
				return false;
			}
		}

		public function getCategoryList(categoryId:int):Boolean
		{
			if (_isLoggedIn)
			{
				var req:URLRequest = this.getAjaxRequest(host+Settings.CATEGORY_URL+categoryId);

				this.addEventListener(Event.COMPLETE, urlLoader_Result);
				this.load(req);
				return true;
			}
			else
			{
				return false;
			}
		}

		protected function xmlLoader_Result(evt:Event):void
		{
			this.removeEventListener(Event.COMPLETE, xmlLoader_Result);
			this.removeEventListener(IOErrorEvent.IO_ERROR, xmlLoader_Error);     // добавлено !!!
			//if (Globals.vars.stage.contains(mark)) 		Globals.vars.stage.removeChild(mark);     // добавлено !!!
			//trace(this.data);
			dispatchEvent(new Event("DATALOAD"));
		}
		
		protected function xmlLoader_Error(evt:IOErrorEvent):void     // добавлено !!!
		{
			//mark.x = 1920;
			//mark.y = 0;
			//Globals.vars.stage.addChild(mark);
		}
		
		
		protected function urlLoader_Result(evt:Event):void
		{
			removeEventListener(Event.COMPLETE, urlLoader_Result);
			this.answer = new Array();
			var res:Array = this.data.split("\r");
			this.msg = res[0];
			if (res[0].match(/^\[SUCCESS COUNT:.+]$/))
			{
				var list:Array = res[1].split("\n");

				for (var i:int = 0; i < list.length; i++)
				{
					if (list[i])
					{
						this.answer.push(list[i].split(" "));
						//[list[i].substr(0,list[i].indexOf(" "))] = list[i].substr(list[i].indexOf(" ") + 1);
					}
				}
			}
				
			dispatchEvent(new Event("DATALOAD"));
		}
		
		public function get isLogged():Boolean { return _isLoggedIn; }
		
		
	}

}