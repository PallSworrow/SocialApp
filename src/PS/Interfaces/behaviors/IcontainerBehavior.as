package PS.Interfaces.behaviors 
{
	import fl.text.IContainerManager;
	import PS.Interfaces.Icontainer;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface IcontainerBehavior extends Icontainer
	{
		function init(target:Icontainer):void
		function kill():void
	}
	
}