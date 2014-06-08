package model.profiles 
{
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class UserProfile 
	{
		private var _id:int;
		private var _gender:int;
		private var _greet:String;
		private var _data:Object;
		private var _price:int;
		
		
		
		public function UserProfile(uid:int, sex:int,greeting:String,cost:int,props:Object=null) 
		{
			_id = uid;
			_gender = sex;
			_greet = greeting;
			_data = props;
			_price = cost;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function get gender():int 
		{
			return _gender;
		}
		
		public function get greet():String 
		{
			return _greet;
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
		public function get price():int 
		{
			return _price;
		}
		
	}

}