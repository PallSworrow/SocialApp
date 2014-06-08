package PS.elements.Switcher.Behaviors 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	import PS.elements.Switcher.IswitchBehavior;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class SWmenuBehavior implements IswitchBehavior 
	{
			private var inactive:DisplayObject;
		private var press:DisplayObject;
		private var active:DisplayObject
		private var over:DisplayObject;
		private var _isActive:Boolean = false;
		public function SWmenuBehavior(activeTexture:DisplayObject, onPressTexture:DisplayObject=null, onOverTexture:DisplayObject=null) 
		{
			press = onPressTexture;
			active = activeTexture;
			over = onOverTexture;
		}
		
		/* INTERFACE PS.elements.Switcher.IswitchBehavior */
		
		public function onTap():void 
		{
			if(press) press.visible = false;
			if(over) over.visible = false;
			inactive.visible = false;
			active.visible = true; 
			_isActive = true;
		}
		
		public function onTapOther():void 
		{
			if(press)press.visible = false;
			inactive.visible = true;
			active.visible = false; 
			_isActive = false;
		}
		
		public function onPress():void 
		{
			
			
			if (press) 
			{
				if(over) over.visible = false;
				press.visible = true;
				inactive.visible = false;
				active.visible = false;
			}
		}
		
		public function onRelease():void 
		{
			if (press) press.visible = false;
			
			if (!over) drop();
			else isover = isover;
		}
		private function drop():void
		{
			
			if(over) over.visible = false;
			if (isActive)
			{
				inactive.visible = false;
				active.visible = true;
				
			}
			else
			{
				inactive.visible = true;
				active.visible = false;
				
			}
		}
		
		public function init(client:DisplayObjectContainer, nativeTexture:DisplayObject):void 
		{
			inactive = nativeTexture;
			client.addChild(inactive);
			if (press) 
			{
				press.visible = false;
				client.addChild(press);
			}
			if (over) 
			{
				over.visible = false;
				client.addChild(over);
			}
			client.addChild(active);
			active.visible = false;
		}
		
		/* INTERFACE PS.elements.Switcher.IswitchBehavior */
		private var _isover:Boolean = false;
		public function onOver():void 
		{
			isover = true;
		}
		
		public function onOut():void 
		{
			isover = false;
		}
		
		public function get isActive():Boolean 
		{
			return _isActive;
		}
		
		public function get isover():Boolean 
		{
			return _isover;
		}
		
		public function set isover(value:Boolean):void 
		{
			_isover = value;
			if (!over) return;
			if (value)
			{
				if (press) press.visible = false;
				active.visible = false;
				inactive.visible = false;
				over.visible = true;
			}
			else drop();
		}
		
	}

}