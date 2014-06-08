package PS.elements.cloud 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import PS.Interfaces.Icontainer;
	import PS.Interfaces.IdisplayObject;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface Icloud extends Icontainer
	{
		function init(trigger:InteractiveObject, container:DisplayObjectContainer):void
		function forceShow():void
		function forceHide():void
	
	}
	
}