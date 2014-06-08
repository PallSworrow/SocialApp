package view.elements 
{
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.Font;
	import PS.elements.Switcher.Behaviors.SWmenuBehavior;
	import PS.elements.Switcher.SwitchButton;
	import PS.model.text.TLFtextBox;
	import view.Fonts;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class TextButton extends SwitchButton 
	{
		
		private var _text:String;
		private var tf:TLFtextBox;
		private var obj:Sprite = new Sprite();
		private var back:DisplayObject;
		private var offsetX:int = 10;
		private var fontType:Object = Fonts.mainMenu;
		public function TextButton(bg:DisplayObject, addToGroup:String=null,params:Object = null) 
		{
			back = bg;
			back.x = -back.width / 2;
			back.y = -back.height / 2;
			obj.addChild(bg);
			
			/*var bd:BitmapData = new BitmapData(bg.width, bg.height);
			bd.draw(bg);
			obj1.addChild(new Bitmap(bd));
			obj2.addChild(new Bitmap(bd));*/
			if(params) fontType = params;
			super(obj, addToGroup);
			//addBehavior(new SWmenuBehavior(obj2,null,obj1));
		
		}
		
		public function get text():String 
		{
			return _text;
		}
		
		public function set text(value:String):void 
		{
			_text = value;
			if (!tf) 
			{
				tf = new TLFtextBox(back.width,fontType);
				obj.addChild(tf);
			}
			tf.text = value;
			tf.y =  - tf.height / 2;
			tf.x = -tf.width / 2;
			
		}
		override protected function Over():void 
		{
			super.Over();
			TweenLite.to(obj, 0.4, { scaleX:1.2, scaleY:1.2 } );
		}
		override public function Tap(needCallHandler:Boolean = true):void 
		{
			super.Tap(needCallHandler);
			TweenLite.to(obj, 0.4, { scaleX:1.2, scaleY:1.2 } );
			tf.textColor = 0xff0000;
		}
		override protected function Out():void 
		{
			super.Out();
			if(!active)	TweenLite.to(obj, 0.4, { scaleX:1, scaleY:1 } );
		}
		override public function TapOther():void 
		{
			super.TapOther();
			TweenLite.to(obj, 0.4, { scaleX:1, scaleY:1 } );
			tf.textColor = 0x000000;
		}
	
		
	}

}