package model.interfaces 
{
	import flash.display.DisplayObjectContainer;
	import PS.Interfaces.IdisplayObject;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface ISubScreen
	{
		function show(into:DisplayObjectContainer, from:int = 1):void
		function tweenOut(to:int = -1):void
		function sendComand(comand:String,params:Object):void
	}
	
}