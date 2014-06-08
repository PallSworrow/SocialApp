package PS.model.popupSystem 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import PS.model.PsSprite;
	import PS.PScontroller.Controller;
	import PS.controller.TapController;
	import PS.PSmodel.Engine;
	
	/**
	 * ...
	 * @author 
	 */
	public class Popup extends EventDispatcher
	{
		private var _item:PsSprite;
		private var currentCondition:String;
		private var goalCondition:String;
		private var ctrl:Controller;
		public function Popup () 
		{
			super();
			_item = new PsSprite();
			_item = obj;
			
			currentCondition = goalCondition = 'hidden';
			checkParameters(param);
			ctrl = Controller.addTapListener(obj);
			ctrl.addEventListener(TapController.ON_TAP, onTap);
			
			
			
			
		}
		//Engine interaction:
		internal function get inst():DisplayObject 
		{
			return _item.inst;
		}
		
		//PROTETED:	
		protected function addChild(child:PsSprite):void
		{
			_item.inst.addChild(child.inst);
		}
		protected function removeChild(child:PsSprite):void
		{
			_item.inst.removeChild(child.inst);
		}
		
		
		//PUBLIC:
		public function show():void
		{
			PopupEngine.addPopup(this);
		}
		
		public function hide():void
		{
			PopupEngine.closePopup(this);
		}
		
		
		
	}

}