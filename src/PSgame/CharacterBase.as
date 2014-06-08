package PSgame 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import PSgame.character.behaviorBase;
	import PSgame.character.viewPart;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class CharacterBase 
	{
		protected var inst:MovieClip;
		private var viewParts:Object;
		
		public function CharacterBase(obj:MovieClip,viewProperties:Object) 
		{
			inst = obj;
			viewProps = viewProperties;
			//check for correct input?
			for(var param:String in viewProps)
			{
				if (!(viewProps[param] is viewPart))
				{
				
					//throw exception
				}
			}
			inst.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		
		//engine:
		private function onAdded(e:Event):void 
		{
			inst.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			inst.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			
			inst.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function onRemoved(e:Event):void 
		{
			inst.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			inst.addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			inst.removeEventListener(Event.ENTER_FRAME, update);
		}
		
		
		
		//life process: 
		protected var bornBehavior:behaviorBase;
		protected var dieBehavior:behaviorBase;
		public function born():void
		{
			bornBehavior.start();
			bornBehavior.addEventListener(behaviorBase.ON_COMPLETE, onBornComplete);
		}
		
		private function onBornComplete(e:Event):void 
		{
			bornBehavior.removeEventListener(behaviorBase.ON_COMPLETE, onBornComplete);
			enable();
		}
		
		protected function enable():void
		{
			bornBehavior.restricted = true;
			
			//activate all systems
		}
		public function die():void
		{
			dieBehavior.start();
			dieBehavior.addEventListener(behaviorBase.ON_COMPLETE, onDieComplete);
		}
		
		private function onDieComplete(e:Event):void 
		{
			dieBehavior.removeEventListener(behaviorBase.ON_COMPLETE, onDieComplete);
			disable();
		}
		protected function disable():void
		{
			dieBehavior.restricted = true;
			
			//diactivate all system
		}
		
		
		
		//personalisation 
		protected function setViewPartValue(part:String, val:int):void
		{
			(viewParts[part] as viewPart).currentVal = val;
		}
		private function update(e:Event):void
		{
			for each(var part:viewPart in viewParts)
			{
				part.update();
			}
		}
	}

}