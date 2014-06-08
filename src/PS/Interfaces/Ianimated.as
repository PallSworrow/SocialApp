package PS.Interfaces 
{
	import PS.Interfaces.behaviors.IcontainerBehavior;
	import PS.Interfaces.behaviors.IdisplayBehavior;
	import PS.Interfaces.behaviors.ItransformBehavior;
	import PS1.PSmodel.behaviors.IdisplayobjectBehavior;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface Ianimated 
	{
		function addTransformBehavior(behavior:ItransformBehavior):void
		function addContainerBehavior(behavior:IcontainerBehavior):void
		function addDisplayBehavior(behavior:IdisplayBehavior):void
		
		function removeTransformBehavior(behavior:ItransformBehavior):void
		function removeContainerBehavior(behavior:IcontainerBehavior):void
		function removeDisplayBehavior(behavior:IdisplayBehavior):void
		
		function hasTransformBehavior(behavior:ItransformBehavior):Boolean
		function hasContainerBehavior(behavior:IcontainerBehavior):Boolean
		function hasDisplayBehavior(behavior:IdisplayBehavior):Boolean
	}
	
}