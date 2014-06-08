package PS.Interfaces.behaviors 
{
	import PS.Interfaces.Itransformable;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface ItransformBehavior extends Itransformable
	{
		function init(target:Itransformable):void
		function kill():void
	}
	
}