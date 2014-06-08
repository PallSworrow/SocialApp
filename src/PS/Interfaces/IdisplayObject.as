
package PS.Interfaces 
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface IdisplayObject
	{
		function addTo(container:DisplayObjectContainer):void;
		function removeFrom(container:DisplayObjectContainer):void;
		function isChildOf(container:DisplayObjectContainer):Boolean;
		
		function get transform():Itransformable
	}
	
}