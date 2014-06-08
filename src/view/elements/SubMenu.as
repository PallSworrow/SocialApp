package view.elements 
{
	import air.desktop.URLFilePromise;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import model.interfaces.IsubMenu;
	import PS.elements.Switcher.SwitchButton;
	import PS.micro.TableContainer;
	import view.Fonts;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class SubMenu extends Sprite implements IsubMenu
	{
		private var curr:int=-1;
		private var activeY:int;
		private var hideY:int;
		private var box:Sprite;
		private var currActiveBtn:int;
		public function SubMenu(onHideY:int,onActiveY:int) 
		{
			super.addChild(new Embeds.main_submenu);
			activeY = onActiveY;
			hideY = onHideY;
			y = onHideY;
			box = new Sprite();
			super.addChild(box);
		}
		
		/* INTERFACE model.interfaces.IsubMenu */
		
		override public function addChild(child:DisplayObject):DisplayObject 
		{
			return box.addChild(child);
		}
		public function get inst():DisplayObject 
		{
			return this;
		}
		
		public function show(type:int,index:int):void 
		{
			currActiveBtn = index;
			trace('curr: ' + curr);
			if (curr == type) 
			{
				(table.getChildAt(currActiveBtn) as SwitchButton).Tap();
				return;
			}
			else
			{
				curr = type;
				onClick( { type:curr, index: index } );
				if (y != hideY) TweenMax.to(this, 0.5, { y:hideY, onComplete:onHidden } );
				else onHidden();
			}
		}
		
		private function onHidden():void 
		{
			updateView();
			TweenMax.to(this, 0.5, { y:activeY} );
		}
		private var table:TableContainer;
		private function updateView():void 
		{
			removeChild(box);
			box = new Sprite();
			super.addChild(box);
			var btn:TextButton;
			table = new TableContainer(1, 0, 0, false);
			var sp:Shape;
			for (var i:int = 0; i < 5; i++)
			{
				sp = new Shape();
				sp.graphics.beginFill(0xffffff); 
				sp.graphics.drawRect(0, 0,80, 20); 
				sp.graphics.endFill();
				sp.alpha = 0;
				btn = new TextButton(sp, 'subMenu',Fonts.subMenu);
				btn.addHandler(onClick,{type:curr,index: i});
				table.addChild(btn);
				btn.text = 'BUTTON ' + i;
				
			}
			
			table.y = (height-table.height) / 2 + btn.height / 2;
			table.x = (width - table.width) / 2 + btn.width / 2;
			addChild(table);
			(table.getChildAt(currActiveBtn) as SwitchButton).Tap(false);
		}
		
		private function onClick(params:Object):void 
		{
			if (ishd) hndl(params);
		}
		private var hndl:Function;
		private var ishd:Boolean = false;
		public function addHandler(handler:Function):void 
		{
			hndl = handler;
			ishd = true;
		}
		
		
	}

}