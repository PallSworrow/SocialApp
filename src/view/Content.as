package view 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import model.interfaces.IsubMenu;
	import model.interfaces.ISubScreen;
	import model.interfaces.IvipLine;
	import model.Values;
	import PS.elements.Switcher.SwitchButton;
	import PS.Globals;
	import PS.lib.SystemEmbeds;
	import PS.micro.TableContainer;
	import PS.model.Window;
	import view.elements.CloudBg;
	import view.elements.SubMenu;
	import view.elements.TextButton;
	import PS.elements.valueDisplayer;
	import view.elements.valueDisplayerScl;
	import view.elements.VipLine;
	import view.screens.SubScreenBase;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class Content extends Window 
	{
		private static var cnt:Content;
		public static function navigateTo(menu:int, submenu:int):void
		{
			cnt.mainMenu[menu].Tap(false);
			cnt.subMenu.show(menu, submenu);
			
			//cnt.currentScreen = cnt.btnIndex;
		}
		
		public function Content(_owner:Window, prevChild:Window=null) 
		{
			super(_owner, prevChild);
			cnt = this;
			
		}
		private var mainMenu:Vector.<SwitchButton>;
		private var subMenu:IsubMenu;
		private var vip:IvipLine;
		
		private var coins:valueDisplayer;
		private var pts:valueDisplayer;
		private var currScreen:ISubScreen;
		private var screens:Array = [
		/*friends*/[/*topFriends*/new SubScreenBase(),new SubScreenBase()/*olololo*/],
		/*coins*/[/*free*//*buy*/],
		/*pr*/[/*like*//*reposts*//*comments*//*people*/],
		/*rating*/[/*mainRating*//*topFace*/],
		/*info*/[/*news*//*fuckYou*//*tutor*//*feedBack*//*settings*/]
		];
		override protected function init():void 
		{
			super.init();
			mainMenu = new Vector.<SwitchButton>;
			(addChild(new Embeds.main_bg) as Bitmap).smoothing = true;
			
			var disp:DisplayObject;
			disp = new Embeds.main_menu;
			trace(Globals.stageWidth);
			disp.x = (Globals.stageWidth-disp.width)/2;
			disp.y = 180;
			
			subMenu = new SubMenu(disp.y, disp.y + disp.height);
			subMenu.inst.x = (Globals.stageWidth - subMenu.inst.width) / 2;
			subMenu.addHandler(onSubMenuBtn);
			
			
			
		
			addChild(subMenu.inst);
			addChild(disp);
			var btn:TextButton;
			var table:TableContainer = new TableContainer(1, 0, 0, false);
			var sp:Shape;
			for (var i:int = 0; i < 5; i++)
			{
				sp = new Shape();
				sp.graphics.beginFill(0xffffff); 
				sp.graphics.drawRect(0, 0,100, 30); 
				sp.graphics.endFill();
				sp.alpha = 0;
				btn = new TextButton(sp, 'mainMenu');
				btn.addHandler(onMainMenuBtn, i);
				table.addChild(btn);
				btn.text = 'BUTTON ' + i;
				mainMenu.push(btn);
			}
			addChild(table);
			table.y = disp.y + (disp.height) / 2;
			table.x = (Globals.stageWidth - table.width) / 2 + btn.width / 2;
			Values.addEventListener(Values.ON_CHANGE, onValuesUpdate);
			
			coins = new valueDisplayerScl('Монеты', '0');
			pts = new valueDisplayerScl('Очки', ' 0');
			addChild(coins.inst);
			addChild(pts.inst);
			coins.x = 60;
			coins.y = 160;
			pts.x = 185;
			pts.y = 160;
			
			vip = new VipLine();
			addChild(vip.inst);
			vip.init(null);
			vip.inst.y = disp.y + disp.height + subMenu.inst.height + 4 + vip.inst.height / 2;
			
			
			//	mainMenu[0].Tap();
			navigateTo(0, 1);
		}
		
		private function onSubMenuBtn(params:Object):void 
		{
			trace(params);
			loadScreen(params.type, params.index);
		}
		
		
		
		private function onMainMenuBtn(btnIndex:int):void 
		{
			subMenu.show(btnIndex, 0);
		}
		
		private var curScreenMainType:int=-1;
		private var currScreenSubType:int=-1;
		private function loadScreen(type:int, index:int):void
		{
			var TweenDir:int = 0;
			if (curScreenMainType > type) TweenDir = 1;
			else if (curScreenMainType < type) TweenDir = -1;
			else
			{
				if (currScreenSubType > index) TweenDir = 1;
				else if (currScreenSubType < index) TweenDir = -1;
				else return;
			}
			if (currScreen) 
			{
				currScreen.tweenOut(TweenDir);
				
			}
			if (screens[type][index])
			{
				currScreen = screens[type][index];
				currScreen.show(inst.source, -TweenDir);
			}
			else currScreen = null;
			
			curScreenMainType = type;
			currScreenSubType = index;
		}
		private function onValuesUpdate(e:Event):void
		{
			
		}
	}

}