package PS.elements.Switcher 
{
	import PS.elements.Switcher.SwitchButton;
	/**
	 * ...
	 * @author 
	 */
	public class switcherGroups 
	{
		public static var allGroups:Object = new Object();
		
		
		public static function addToGroup(switcher:SwitchButton, group:String):void
		{
			if (!allGroups[group]) allGroups[group] = new Vector.<SwitchButton>;
			allGroups[group].push(switcher);
		}
		public static function removeFromGroup(switcher:SwitchButton, group:String):void
		{
			
		}
		
		public static function unselectGroup(group:String):void
		{
			if (allGroups[group])
			{
				var gr:Vector.<SwitchButton> = allGroups[group];
				for (var i:int = gr.length-1; i >=0; i--)
				{
					gr[i].TapOther();
					
				}
			}
		}
	
		
	}

}