package model.interfaces 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import model.profiles.UserProfile;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface IvipLine 
	{
		function get inst():Sprite
		function init(vec:Vector.<UserProfile>):void
		function addHandler(_handler:Function):void
		
	}
	
}