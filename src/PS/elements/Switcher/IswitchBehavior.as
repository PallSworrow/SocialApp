package PS.elements.Switcher 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author 
	 */
	public interface IswitchBehavior 
	{
		function onTap ():void
		function onTapOther():void
		function onPress():void
		function onRelease():void
		function onOver():void
		function onOut():void
		function init(client:DisplayObjectContainer, nativeTexture:DisplayObject):void
		function get isActive():Boolean
	}
	
}