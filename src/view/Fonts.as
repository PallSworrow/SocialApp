package view 
{
	import flash.filters.GlowFilter;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class Fonts 
	{
		public static const mainMenu:Object = 
		{
			font:'main',
			size:14,
			align: 'center'
		}
		public static const subMenu:Object = 
		{
			font:'main',
			size:12,
			align: 'center'
		}
		public static const smallValueDisp:Object = 
		{
			font:'mainAS',
			size:12,
			filter: new GlowFilter(0x7d7d7d,0.4,2,2),
		//autoSize:TextFieldAutoSize.RIGHT,
			color:0x7d7d7d
		//,singleLine:true
		}
		
	}

}