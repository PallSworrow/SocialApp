package model.profiles 
{
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class prObjectProfile 
	{
		private var _done:Boolean;
		private var _actionType:String;
		private var _owner:String;
		
		private var _contentOwner:String;
		private var _contentType:String;
		private var _contentId:String;
		public function prObjectProfile(type:String,item:String,isDone:Boolean,initiator:String ) 
		{
			_actionType = type;
			_done = isDone;
			_owner = initiator;
			
			readItemData(item);
		}
		
		private function readItemData(item:String):void 
		{
			_contentOwner = '';
			_contentType = '';
			_contentId = '';
		}
		public function check():void
		{
			//connect to api
		}
		public function abortChecking():void
		{
			
		}
		public function get done():Boolean {return _done;}
		
		public function get actionType():String {return _actionType;}
		
		public function get owner():String {return _owner;}
		
		public function get contentOwner():String {return _contentOwner;}
		
		public function get contentType():String {return _contentType;}
		
		public function get contentId():String 	{return _contentId;}
		
	}

}