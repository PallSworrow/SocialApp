package PS.model.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class AnimationEvent extends Event 
	{
		public static const ON_START_APPERAING:String = 'startappearing';
		public static const ON_START_HIDDING:String = 'starthidding';
		public static const ON_APPERAING_COMPLETE:String = 'onapComplete';
		public static const ON_HIDDING_COMPLETE:String = 'onhdComplete';
		public static const ON_ANIMATION_STARTED:String = 'animStarted';
		public static const ON_ANIMATION_COMPLETED:String = 'animCompleted';
		public static const ON_ANIMATION:String = 'onanim';
		
		private var _subEvent:String;
		private var _animationType:String;
		public function AnimationEvent(type:String,animation:String='',subE:String='') 
		{
			_animationType = animation;
			_subEvent = subE;
			super(type);
			
		}
		
		public function get animationType():String 
		{
			return _animationType;
		}
		
		public function get subEvent():String 
		{
			return _subEvent;
		}
		
		
	}

}