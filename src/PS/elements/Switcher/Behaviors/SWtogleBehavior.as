package PS.elements.Switcher.Behaviors 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import PS.elements.Switcher.IswitchBehavior;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class SWtogleBehavior implements IswitchBehavior 
	{
		private var inactive:DisplayObject;
		private var press:DisplayObject;
		private var active:DisplayObject
		private var _isActive:Boolean = false;
		public function SWtogleBehavior(activeTexture:DisplayObject, onPressTexture:DisplayObject=null) 
		{
			press = onPressTexture;
			active = activeTexture;
			if(press) press.visible = false;
			active.visible  = false;
		}
		
		/* INTERFACE PS.elements.Switcher.IswitchBehavior */
		
		public function onTap():void 
		{
			if (isActive)
			{
				if(press) press.visible = false;
				inactive.visible = true;
				active.visible = false;
				_isActive = false;
			}
			else
			{
				if(press) press.visible = false;
				inactive.visible = false;
				active.visible = true;
				_isActive = true;
			}
		}
		
		public function onTapOther():void 
		{
			
		}
		
		public function onPress():void 
		{
			if (press) 
			{
				press.visible = true;
				inactive.visible = false;
				active.visible = false;
			}
		}
		
		public function onRelease():void 
		{
			if(press) press.visible = false;
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
			if(press) client.addChild(press);
			client.addChild(active);
		}
		
		/* INTERFACE PS.elements.Switcher.IswitchBehavior */
		
		public function onOver():void 
		{
			
		}
		
		public function onOut():void 
		{
			
		}
		
		public function get isActive():Boolean 
		{
			return _isActive;
		}
		
	}

}