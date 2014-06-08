package PS.model.text 
{
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author 
	 */
	public class TextBox extends TextField 
	{
		
		public function TextBox(w:int,param:Object = null) 
		{
			super();
			text = ''
			var font:TextFormat;
			
	
			
			if (!param) param = { };
			//defaults:		
			var fnt:String='';
			var sz:int=24;
			var clr:uint=0;
			var bld:Boolean=false;
			var itl:Boolean=false;
			var undr:Boolean=false;
			var align:String='left';
			var Asize:String = TextFieldAutoSize.LEFT;
			var ww:Boolean = true
			//wordWrap = true;
			//customs:
			if (param.font)
			{
				fnt = param.font;
			}
			if (param.size) sz = param.size;
			if (param.color) clr = param.color;
			if (param.italic) itl = param.italic;
			if (param.underlined) undr = param.underlined;
			if (param.align) align = param.align;
			if (param.autoSize) Asize = param.autoSize;
			if (param.filter) this.filters = [param.filter];
			if (param.singleLine) 
			{
				trace('SINGLE LINE MUTHEFACKER');
				ww = false;
				multiline = false;
			}
			
			
			//apply:
			embedFonts = true;
			font = new TextFormat(fnt, sz, clr, bld, itl, undr, null, null, align);
			
			width = w;
			autoSize = Asize
			selectable = false;
			//
			//border = true;
			
			
			//antiAliasType = AntiAliasType.NORMAL
			
			defaultTextFormat = font;
			
			///wordWrap = ww;
		}
		/*override public function get text():String 
		{
			return super.text;
		}
		
		override public function set text(value:String):void 
		{
			trace('append text:' + value);
			//super.text = value;
			htmlText = value;
		}
		*/
	}

}