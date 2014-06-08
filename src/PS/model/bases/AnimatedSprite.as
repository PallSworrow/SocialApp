package PS.model.bases 
{
	import adobe.utils.CustomActions;
	import PS.Interfaces.behaviors.IdisplayBehavior;
	import PS.Interfaces.behaviors.IcontainerBehavior;
	import PS.Interfaces.behaviors.ItransformBehavior;
	import PS.Interfaces.Ianimated;
	import PS.Interfaces.Icontainer;
	import PS.Interfaces.IdisplayObject;
	import PS.Interfaces.Itransformable;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class AnimatedSprite extends SpriteBase implements Ianimated 
	{
		private var transformBehavs:Vector.<ItransformBehavior> = new Vector.<ItransformBehavior>;
		private var displayBehavs:Vector.<IdisplayBehavior> = new Vector.<IdisplayBehavior>;
		private var containerBehavs:Vector.<IcontainerBehavior> = new Vector.<IcontainerBehavior>;
		public function AnimatedSprite() 
		{
			super();
			
		}
		
		/* INTERFACE PS.Interfaces.Ianimated */
		//ADD
		public function addTransformBehavior(behavior:ItransformBehavior):void 
		{
			behavior.init(transform);
			transformBehavs.unshift(behavior);
		}
		
		public function addContainerBehavior(behavior:IcontainerBehavior):void 
		{
			behavior.init(container);
			containerBehavs.unshift(behavior);
		}
		
		public function addDisplayBehavior(behavior:IdisplayBehavior):void 
		{
			behavior.init(disp);
			displayBehavs.unshift(behavior);
		}
		//REMOVE
		public function removeTransformBehavior(behavior:ItransformBehavior):void 
		{
			var index:int = transformBehavs.indexOf(behavior);
			if (index >= 0) 
			{
				behavior.kill();
				transformBehavs.splice(index, 1);
			}
		}
		
		public function removeContainerBehavior(behavior:IcontainerBehavior):void 
		{
			var index:int = containerBehavs.indexOf(behavior);
			if (index >= 0)
			{
				behavior.kill();
				containerBehavs.splice(index, 1);
			}
		}
		
		public function removeDisplayBehavior(behavior:IdisplayBehavior):void 
		{
			var index:int = displayBehavs.indexOf(behavior);
			if (index >= 0) 
			{
				behavior.kill();
				displayBehavs.splice(index, 1);
			}
		}
		//HAS
		public function hasTransformBehavior(behavior:ItransformBehavior):Boolean 
		{
			if (transformBehavs.indexOf(behavior) != -1) return true;
			else return false;
		}
		
		public function hasContainerBehavior(behavior:IcontainerBehavior):Boolean 
		{
			if (containerBehavs.indexOf(behavior) != -1) return true;
			else return false;
		}
		
		public function hasDisplayBehavior(behavior:IdisplayBehavior):Boolean 
		{
			if (displayBehavs.indexOf(behavior) != -1) return true;
			else return false;
		}
		//GETTERS:
		
		override public function get transform():Itransformable 
		{
			if (transformBehavs.length > 0) return transformBehavs[0];
			else return super.transform;
		}
		override protected function get disp():IdisplayObject 
		{
			if (displayBehavs.length > 0) return displayBehavs[0];
			else return super.disp;
		}
		override protected function get container():Icontainer 
		{
			if (containerBehavs.length > 0) return containerBehavs[0];
			else return super.container;
		}
	}

}