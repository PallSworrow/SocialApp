package view.elements 
{
	import com.greensock.TweenLite;
	import PS.elements.valueDisplayer;
	import view.Fonts;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class valueDisplayerScl extends valueDisplayer 
	{
		
		public function valueDisplayerScl(variable:String, val:String) 
		{
			//font = Fonts.smallValueDisp;
			super(variable, val,Fonts.smallValueDisp);
			
		}
		override public function get value():String 
		{
			return super.value;
		}
		
		override public function set value(value:String):void 
		{
			super.value = value;
			TweenLite.from(tf1, 0.6, { textcolor:0xff0000 } );
		}
	}

}