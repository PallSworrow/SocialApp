package Antares 
{
	import com.antares.framework.server.ServerLoader;
	import flash.events.EventDispatcher;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	

	
	/**
	 * ...
	 * @author Павел
	 */
	public class ServerConnection extends EventDispatcher 
	{
		
		//INITIALISING: ---------------------------------------------------------
		public  function ServerConnection():void
		{
			var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.load(new URLRequest("settings.xml"));
			xmlLoader.addEventListener(Event.COMPLETE, parseXML);
			
			
			
			
		}
		
		private function parseXML(e:Event):void {
			var info:XML = XML(e.target.data);
			
			Settings.HOST = info.host;
			Settings.USER_NAME = info.user_name;
			Settings.PASSWORD = info.password;
			
			Settings.LOGIN_URL = info.login_url;
			Settings.STRUCTURE_URL = info.structure_url;
			Settings.CATEGORY_URL = info.category_url;
			Settings.DATA_LIST_URL = info.data_list_url;
			Settings.DATA_URL = info.data_url;
			
			Settings.MSK_CATEGORY = int(info.msk_category);
			
			Settings.ID_MAIN_INFO = int(info.main);
			Settings.ID_MUSEUM_INFO = int(info.museum);
			Settings.ID_CHRONICLE_INFO = int(info.chronicle);
			Settings.ID_PAPER_INFO = int(info.paper);
			Settings.ID_PHOTO_INFO = int(info.photo_video);
			
			
			var time_relogin:Number = Number(info.time_relogin);
			if (time_relogin <= 0) 	time_relogin = 5;
			var time_return:Number = Number(info.time_return);
			if (time_return <= 0) 	time_return = 10;
			
			trace('parse XML: ' + Settings.HOST);
			
			
			ServerLoader.instance.addEventListener('LOGIN', onLoggedFirst);
			
		}
		
		private function onLoggedFirst(e:Event):void 
		{
			ServerLoader.instance.removeEventListener('LOGIN', onLoggedFirst);
			trace('logged!');
			
			ServerLoader.instance.getStructureXML(Settings.MSK_CATEGORY);//7
			ServerLoader.instance.addEventListener('DATALOAD', onLoadXML);
			
			
			
			
			
		}
		private function onLoadXML(e:Event):void 
		{
			
			
			readXML(XML(ServerLoader.instance.data));
			
			dispatchEvent(new Event('LOADING_DATA_COMPLETE'));
			
			
			//ServerLoader.instance.addEventListener(Event.COMPLETE, instance_complete);*/
			
		}
		public static var test:String;
		protected static function readXML(list:XML):void
		{
		
			
			
		}
		
		
		
		
		
		private var reloginInProgress:Boolean = false;
		public function relogin():void
		{
			reloginInProgress = true;
			ServerLoader.instance.addEventListener('LOGIN', relogged);
		}
		
		private function relogged(e:Event):void 
		{
			ServerLoader.instance.removeEventListener('LOGIN', relogged);
			reloginInProgress = false;
			dispatchEvent(new Event('RELOGGED'));
		}
		
		
		
	}
	
}