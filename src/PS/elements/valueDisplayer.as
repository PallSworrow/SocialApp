package PS.elements 
{
	import fl.text.TLFTextField;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import PS.Interfaces.IdisplayObject;
	import PS.Interfaces.Itransformable;
	import PS.model.bases.SpriteBase;
	import PS.model.text.TextBox;
	import PS.model.text.TLFtextBox;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class valueDisplayer extends SpriteBase
	{
		protected var _name:String;
		protected var _value:String;
		
		protected var tf0:TextField;
		protected var tf1:TextBox;
		protected var font:Object;
		public function valueDisplayer(variable:String,val:String,fontProp:Object=null) 
		{
			super();
				font = fontProp;
				
			_name = variable;
			
			_value = val;
			
			tf0 = new TextBox(100,fontProp);
		//	tf0.width = 1;
			//tf0.autoSize = TextFieldAutoSize.RIGHT;
			tf1 = new TextBox(1,fontProp);
			addChild(tf0);
			addChild(tf1);
			update();
		}
		
		private function update():void
		{
			trace('name=' + name);
			tf0.text = name+': ';
			tf1.text = value;
			tf1.x = tf0.width;
		}
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(val:String):void 
		{
			_name = value;
			update();
		}
		
		public function get value():String 
		{
			return _value;
		}
		
		public function set value(val:String):void 
		{
			_value = value;
			update();
		}
		
	
		public function get inst():DisplayObject
		{
			return source;
		}
		
		
	}

}