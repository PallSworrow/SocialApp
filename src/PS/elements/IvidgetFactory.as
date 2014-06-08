package PS.elements 
{
	import PS.elements.cloud.Icloud;
	import PS.elements.Switcher.SwitchButton;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface IvidgetFactory 
	{
		function newScrollBar(params:Object=null):ScrollBar
		function newSwitchButton(view:Object, group:String = ''):SwitchButton
		function newCloud(params:Object):Icloud
	
	
}