package view.elements 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import PS.Interfaces.Itransformable;
	import flash.display.DisplayObjectContainer;
	import model.interfaces.IuserPreview;
	import model.profiles.UserProfile;
	import PS.model.bases.SpriteBase;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class UserPreview extends SpriteBase implements IuserPreview 
	{
		private var _profile:UserProfile;
		/*protected var container:DisplayObjectContainer;
		protected var clX:int;
		protected var clY:int;*/
		public function UserPreview() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			var cl:CloudCommentSCL = new CloudCommentSCL();
			cl.init(source, source);
			cl.y = height / 2 - 5;
			cl.text = 'Hellow world  muthafacka';
			
			
		}
		/* INTERFACE model.interfaces.IuserPreview */
		
		public function set profile(value:UserProfile):void 
		{
			_profile = value;
		}
		
		public function get profile():UserProfile 
		{
			return _profile;
		}
		
		
		
	}

}