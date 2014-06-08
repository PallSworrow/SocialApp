package model.interfaces 
{
	import model.profiles.UserProfile;
	import PS.Interfaces.IdisplayObject;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public interface IuserPreview extends IdisplayObject
	{
		function set profile(value:UserProfile):void
		function get profile():UserProfile
		
	}
	
}