package model.videoExample 
{
	import Antares.video.AntaresVideoLoader;
	import flash.events.Event;
	import PSvideoPlayer.VideoPlayer;
	import PSvideoPlayer.VideoPlayerEvents;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class VideopPlayerEx extends VideoPlayer 
	{
		
		public function VideopPlayerEx() 
		{
			this.controls = new ControlsEx(800, 600);
			this.loader = new AntaresVideoLoader();
			
			super();
			
			loader.addTo(this.inst);
			controls.addTo(this.inst);
			loader.load('37927');
			loader.addEventListener(VideoPlayerEvents.ON_METADATA, loader_onLoad);
			
		}
		
		private function loader_onLoad(e:Event):void 
		{
			
			controls.width = loader.width;
			controls.height = loader.height;
		}
		
	}

}