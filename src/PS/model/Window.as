package PS.model 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.text.engine.TabAlignment;
	import flash.utils.setTimeout;
	import PS.Engine;
	import PS.controller.Controller;
	import PS.controller.TapController;
	import PS.Globals;
	import PS.Interfaces.Icontainer;
	import PS.Interfaces.IdisplayObject;
	import PS.Interfaces.Itransformable;
	import PS.model.bases.SpriteBase;
	
	/**
	 * ...
	 * @author 
	 */
	public class Window extends EventDispatcher implements IdisplayObject, Icontainer
	{
		//EVENTS:
		public static const BACK:String = 'back';
		public static const CLOSE:String = 'close';
		
		
		//========================================================
		protected var inst:SpriteBase;
		protected var myChild:Window;
		protected var previous:Window;
		public var owner:Window;
		protected var controller:TapController;
		
		protected var contentBox:Sprite;
		public function Window(_owner:Window,prevChild:Window=null) 
		{
			super();
			inst = new SpriteBase();
			//trace('new ' + this);
			previous = prevChild;
			//owner = _owner;
			
			inst.addEventListener(Event.ADDED_TO_STAGE, added);
		
		}
		
		protected function onTap(e:Event):void 
		{
			
		}
		
		protected function init():void
		{
			contentBox = new Sprite();
			inst.addChild(contentBox);
			controller = Controller.addTapListener(inst.source);
			controller.autoDelete = false;
			controller.addEventListener(TapController.ON_TAP, onTap)
			
			
			
		}
		protected function kill():void 
		{
			//trace('kill window');
			
			inst.removeChild(contentBox);
			controller.enabled = false;
			controller.removeEventListener(TapController.ON_TAP, onTap)
			controller = null;
		
		}// full clear
		public function addChild(child:DisplayObject):DisplayObject 
		{
			if (contentBox) return contentBox.addChild(child);
			else return null;
		}
		public function removeChild(child:DisplayObject):DisplayObject 
		{
			if (contentBox) return contentBox.removeChild(child);
			else return null;
		}
		
		public function back():void //on back btn
		{
			dispatchEvent(new Event(BACK));
		}
		public function close():void//on close btn
		{
			dispatchEvent(new Event(CLOSE));
			//trace('close');
		}
		public function loadChild(scr:Window):void //add new child
		{
			
			closeChild();
			myChild = scr;
			myChild.addTo(inst.source);
			myChild.addEventListener(BACK, onChildBack);
			myChild.addEventListener(CLOSE, onChildClose);
		}
		
		/* INTERFACE PS.Interfaces.IdisplayObject */
		
		public function addTo(container:DisplayObjectContainer):void
		{
			inst.addTo(container);
		}
		
		public function removeFrom(container:DisplayObjectContainer):void 
		{
			inst,removeFrom(container);
		}
		
		public function isChildOf(container:DisplayObjectContainer):Boolean
		{
			if (container.getChildIndex(inst.source) == -1) return false;
			else return true;
		}
		
		/* INTERFACE PS.Interfaces.IdisplayObject */
		
		public function get transform():Itransformable 
		{
			return inst.transform;
		}
		
		
		//PRIVATE METHODS-------------------------------------------------
		protected function added(e:Event):void 
		{
			inst.removeEventListener(Event.ADDED_TO_STAGE, added);
			inst.addEventListener(Event.REMOVED_FROM_STAGE, removed);
			init();
		}	
		protected function removed(e:Event):void 
		{
			inst.removeEventListener(Event.ADDED_TO_STAGE, removed);
			inst.addEventListener(Event.ADDED_TO_STAGE, added);
			kill();
			
		}
		protected function closeChild():void
		{
			if (myChild)
			{
				//myChild.kill();
				myChild.removeFrom(inst.source);
				myChild.removeEventListener(BACK, onChildBack);
				myChild.removeEventListener(CLOSE, onChildClose);
				myChild = null;
			}
		}
		
		private function onChildClose(e:Event):void 
		{
			trace('on child close');
			closeChild();
		}
		
		private function onChildBack(e:Event):void //это событие может означать не закрывание child-а, а его смену на предыдущего
		{
			trace('click back');
			if (myChild.previous)
			{
				
				loadChild(myChild.previous);
			}
			else
			{
				closeChild();
			}
		}
		
	
		
	}

}