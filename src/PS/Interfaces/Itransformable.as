package PS.Interfaces 
{
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface Itransformable 
	{
		function get x():Number;
		function get y():Number;
		function get width():Number;
		function get height():Number;
		function get scaleX():Number;
		function get scaleY():Number;
		function get rotation():Number;
		function get alpha():Number;
		function get visible():Boolean;
		function get filters():Array

		function set x(value:Number):void
		function set y(value:Number):void
		function set width(value:Number):void
		function set height(value:Number):void
		function set scaleX(value:Number):void
		function set scaleY(value:Number):void
		function set rotation(value:Number):void
		function set alpha(value:Number):void
		function set visible(value:Boolean):void
		function set filters(value:Array):void
	}
	
}