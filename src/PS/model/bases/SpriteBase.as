package PS.model.bases 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	import PS.Interfaces.Icontainer;
	import PS.Interfaces.IdisplayObject;
	import PS.Interfaces.Itransformable;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class SpriteBase implements IdisplayObject, Itransformable, IEventDispatcher, Icontainer
	{
		private var inst:Sprite;
		
		public function SpriteBase() 
		{
			inst = new Sprite();
		
		}
		/* INTERFACE flash.events.IEventDispatcher */
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			inst.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			inst.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean 
		{
			return inst.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean 
		{
			return inst.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean 
		{
			return  inst.willTrigger(type);
		}
		
		/* INTERFACE PS.Interfaces.Itransformable */
		
		public function get x():Number 
		{
			return inst.x;
		}
		
		public function get y():Number 
		{
			return inst.y;
		}
		
		public function get width():Number 
		{
			return inst.width;
		}
		
		public function get height():Number 
		{
			return inst.height;
		}
		
		public function get scaleX():Number 
		{
			return inst.scaleX;
		}
		
		public function get scaleY():Number 
		{
			return inst.scaleY;
		}
		
		public function get rotation():Number 
		{
			return inst.rotation;
		}
		
		public function get alpha():Number 
		{
			return inst.alpha;
		}
		
		public function get visible():Boolean 
		{
			return inst.visible;
		}
		
		public function set x(value:Number):void 
		{
			inst.x = value;
		}
		
		public function set y(value:Number):void 
		{
			inst.y = value;
		}
		
		public function set width(value:Number):void 
		{
			inst.width = value;
		}
		
		public function set height(value:Number):void 
		{
			inst.height = value;
		}
		
		public function set scaleX(value:Number):void 
		{
			inst.scaleX = value;
		}
		
		public function set scaleY(value:Number):void 
		{
			inst.scaleY = value;
		}
			
		public function set rotation(value:Number):void 
		{
			inst.rotation = value;
		}
			
		public function set alpha(value:Number):void 
		{
			inst.alpha = value;
		}
		
		public function set visible(value:Boolean):void 
		{
			inst.visible = value;
		}
		
		
		/* INTERFACE PS.Interfaces.IdisplayObject */
		
		public function addTo(container:DisplayObjectContainer):void 
		{
			container.addChild(inst);
		}
		
		public function removeFrom(container:DisplayObjectContainer):void 
		{
			container.removeChild(inst);
		}
		
		public function isChildOf(container:DisplayObjectContainer):Boolean 
		{
			if (container.getChildIndex(inst) == -1) return false;
			else return true;
		}
		
		/* INTERFACE PS.Interfaces.Icontainer */
		
		public function removeChild(child:DisplayObject):DisplayObject 
		{
			return inst.removeChild(child);
		}
		
		public function addChild(child:DisplayObject):DisplayObject 
		{
			return inst.addChild(child);
		}
		
		
		
		/* INTERFACE PS.Interfaces.Itransformable */
		
		public function get filters():Array 
		{
			return inst.filters;
		}
		
		public function set filters(value:Array):void 
		{
			inst.filters = value;
		}
		//FOR BEHAVIOR OVERRIDES:
		public function get source():Sprite
		{
			return inst;
		}
		protected function get container():Icontainer
		{
			return this;
		}
		protected function get disp():IdisplayObject
		{
			return this;
		}
		public function get transform():Itransformable
		{
			return this;
		}
		

		public function get globalCoordinates():Point
		{
			if (inst.parent) return inst.parent.localToGlobal(new Point(x, y));
			else return null;
		}
		
	}

}