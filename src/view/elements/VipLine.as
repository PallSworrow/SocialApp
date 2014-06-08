package view.elements 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import model.profiles.UserProfile;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import model.interfaces.IvipLine;
	import PS.elements.cloud.Icloud;
	import PS.elements.cloud.UnderMouseCloud;
	import PS.Globals;
	import PS.lib.SystemEmbeds;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class VipLine extends Sprite implements IvipLine 
	{
		private var items:Vector.<VipItem>;
		public function VipLine() 
		{
			super();
			
		}
		
		/* INTERFACE model.interfaces.IvipLine */
		
		public function get inst():Sprite 
		{
			return this;
		}
		
		public function init(vec:Vector.<UserProfile>):void 
		{
			items = new Vector.<VipItem>;
			var offset:int = 0;
			var item:VipItem; 
			for (var i:int = 0; i < 10; i++)
			{
				/*if (vec[i])
				{
					
				}*/
				//test/
				item = new VipItem(item_rollOver);
				item.addTo(this);
				items.push(item);
				items[i].x = offset;
				offset += items[i].width;
				
				
				
			}
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
			addEventListener(MouseEvent.ROLL_OVER, rollOver);
			addEventListener(MouseEvent.ROLL_OUT, rollOut);
		}
		
		private function item_rollOver(item:VipItem):void 
		{
			item.addTo(inst);
		}
		
		private function rollOut(e:MouseEvent):void 
		{
			speed = -0.5;
		}
		
		private function rollOver(e:MouseEvent):void 
		{
			speed = 0;
		}
		
		private var speed:Number =-0.5;
		private function enterFrame(e:Event):void 
		{
			for each(var item:VipItem in items)
			{
				if (item.x <= -item.width/2) item.x += items.length*item.width;
				item.x +=speed;
			}
		}
		private var handler:Function;
		private var isH:Boolean = false;
		public function addHandler(_handler:Function):void 
		{
			isH = true;
			handler = _handler;
		}
		
	}

}