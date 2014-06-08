package 
{
	import Antares.ServerConnection;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import model.videoExample.VideopPlayerEx;
	import PS.Engine;
	import PS.model.Window;
	import view.Content;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class Main extends Sprite 
	{
		private var mainWindow:Window;
		private var popupBox:Sprite;
		public static var PopupContainer:Sprite;
		public static var CloudContainer:Sprite;
		public function Main():void 
		{
			CloudContainer = new Sprite();
			Engine.init(this,700,800 );
			var sc:ServerConnection = new ServerConnection();
			sc.addEventListener('LOADING_DATA_COMPLETE', sc_loadingDataComplete);
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			Embeds.initFonts();
		}
		
		private function addedToStage(e:Event):void 
		{
			trace('this.w=' + width);
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			
			mainWindow = new Content(null);
			mainWindow.addTo(this);
			addChild(CloudContainer);
		
		}
		
		private function sc_loadingDataComplete(e:Event):void 
		{
			
		}
		
	}
	
}