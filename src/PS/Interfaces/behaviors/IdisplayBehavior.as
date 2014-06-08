package PS.Interfaces.behaviors 
{
	import PS.Interfaces.IdisplayObject;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface IdisplayBehavior extends IdisplayObject
	{
		function init(target:IdisplayObject):void
		function kill():void
	}
	
}