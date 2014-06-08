package model.interfaces 
{
	import flash.display.DisplayObject;
	import PS.Interfaces.IdisplayObject;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface IsubMenu 
	{
		function get inst():DisplayObject
		function show(type:int,index:int):void
		function addHandler(handler:Function):void
	}
	
}