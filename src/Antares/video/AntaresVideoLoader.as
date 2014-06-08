package  Antares.video
{
	import Antares.Settings;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.SoundTransform;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Video;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import PSvideoPlayer.interfaces.IvideoLoader;
	import PSvideoPlayer.VideoPlayerEvents;
	
	
	
	
	/**
	 * ...
	 * @author Faizulina A.D.
	 */
	public class AntaresVideoLoader extends Sprite implements IvideoLoader
	{
		private var nc:NetConnection;
		private var ns:NetStream;
		private var video:Video;
		private var filePath:String;
		private var duration:Number;
		private var framerate:int;
		
		
		
		public function AntaresVideoLoader() 
		{
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			destroy();
		}
		//API------------------------------------------------------------------
	
		/* INTERFACE PSvideoPlayer.interfaces.IvideoLoader */
		private var _isPlaying:Boolean;
		private var _volume:Number;
		public function load(link:String):void 
		{
			clear();
			filePath = Settings.HOST + Settings.DATA_URL + link;
			
			nc = new NetConnection();
			nc.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			nc.connect(null);
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void 
		{
			if (isPlaying) dispatchEvent(new Event(VideoPlayerEvents.ON_PROGRESS_CHANGE));
			dispatchEvent(new Event(VideoPlayerEvents.ON_LOAD_PROCESS));
		}
		
		
		public function clear():void 
		{
			if (nc)
			destroy();
		}
		public function play():void 
		{
			ns.resume();
			_isPlaying = true;
		}
		
		public function stop():void 
		{
			ns.pause();
			_isPlaying = false;
		}
		
		public function get isPlaying():Boolean 
		{
			return _isPlaying;
		}
		
		public function get progress():Number 
		{
			return ns.time / duration;;
		}
		
		public function set progress(value:Number):void 
		{
			ns.seek(duration*value);
		}
		
		public function get volume():Number 
		{
			return ns.soundTransform.volume;
		}
		
		public function set volume(value:Number):void 
		{
			trace('loader set volume to:' + value);
			ns.soundTransform = new SoundTransform(value);
		}
		private function destroy():void
		{
			ns.close();
			ns.removeEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler); 
			
            ns.removeEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			nc.removeEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			nc.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			nc.close();
			nc = null;
			ns = null;
			_isPlaying = false;
			dispatchEvent(new Event(VideoPlayerEvents.ON_STOP));
			dispatchEvent(new Event(VideoPlayerEvents.ON_CLEAR));
			dispatchEvent(new Event(VideoPlayerEvents.ON_LOAD_PROCESS));
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
	
		//=====================================================================================================
		
		
		
		private function netStatusHandler(e:NetStatusEvent):void {
			switch (e.info.code) {
                case "NetConnection.Connect.Success":
                    connectStream();
                    break;
                case "NetStream.Play.StreamNotFound":
                    trace("Stream not found:", filePath);
                    break;
            }
		}
		
       
		private function connectStream():void {
			//removeChild(preloader);
			//trace('add video');
            video = new Video(740, 420);
			video.x = 0
			video.y = 0;
			addChild(video);
			//addChild(close);
            ns = new NetStream(nc);
			ns.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler); 
            ns.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            ns.client = this;
            video.attachNetStream(ns);
            ns.play(filePath);
			_isPlaying = true;
			dispatchEvent(new Event(VideoPlayerEvents.ON_LOAD));
			dispatchEvent(new Event(VideoPlayerEvents.ON_PLAY));
			dispatchEvent(new Event(VideoPlayerEvents.ON_SOUND_CHANGE));
			
			
        }
		
		public function onMetaData(meta:Object):void {
			duration = meta.duration;
			trace("metadata: duration=" + meta.duration + " width=" + meta.width + " height=" + meta.height + " framerate=" + meta.framerate);
			video.width = meta.width;
			video.height = meta.height;
			framerate = meta.framerate;
			dispatchEvent(new Event(VideoPlayerEvents.ON_METADATA));
		}
		
		public function onXMPData(meta:Object):void {
			
		}
		
		public function onCuePoint(info:Object):void {
			trace("cuepoint: time=" + info.time + " name=" + info.name + " type=" + info.type);
		}
		
		public function onPlayStatus(info:Object):void {
			
		}
		
		
		
		
	
		private function getTimecode(num:Number):String {
			var t:Number = Math.round(num);
			var min:Number = Math.floor(t/60);
			var sec:Number = t%60;
			var tc:String = new String("");
			
			if(min < 10) {tc += "0";}
			
			if(min >= 1) {
				tc += min.toString();
			} else {
				tc += "0";
			}
			
			tc += ":";
			
			if(sec < 10) {
				tc += "0";
				tc += sec.toString();
			} else 	{
				tc += sec.toString();
			}
			return tc;	
		}
		
		/* INTERFACE PSvideoPlayer.interfaces.IvideoLoader */
		
		
		public function addTo(container:DisplayObjectContainer):void 
		{
			container.addChild(this);
		}
		
		public function removeFrom(container:DisplayObjectContainer):void 
		{
			container.removeChild(this);
		}
		
		public function isChildOf(container:DisplayObjectContainer):Boolean 
		{
			return false;
		}
		
		/* INTERFACE PSvideoPlayer.interfaces.IvideoLoader */
		
		public function get loaded():Number 
		{
			trace('total: ' + ns);
			trace('loaded: ' + ns.bytesLoaded);
			trace('persent: ' +ns.bytesLoaded/ns.bytesTotal);
			return ns.bytesLoaded/ns.bytesTotal;
		}
		
	//ERROR EVENTS--------------------------------------------------------------------------------
		private function securityErrorHandler(e:SecurityErrorEvent):void {
            trace("securityErrorHandler: " + e);
        }
		
		private function asyncErrorHandler(e:AsyncErrorEvent):void { 
    		trace("asyncErrorHandler: " + e);
		}
		
	
	
	//================================================================================================
		
	}

}