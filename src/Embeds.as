package  
{
	import flash.text.Font;
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class Embeds 
	{
		//Main
		[Embed(source="lib/bg.jpg")]
		public static var main_bg:Class;
		[Embed(source = "lib/menu.png")]
		public static var main_menu:Class;
		[Embed(source = "lib/submenu.png")]
		public static var main_submenu:Class;
		[Embed(source = "lib/wallpaper-949596.jpg")]
		public static var main_starlingsDeath:Class;
		
		
		
		
		//Fonts
		[Embed(source = "lib/AvantGarde.TTF", fontName = 'mainBold',
		embedAsCFF = "false", 
		fontFamily = 'policeEmbed',
		//advancedAntiAliasing = 'true', 
		mimeType = 'application/x-font-truetype')]
		public static var font_mainB:Class;
		
		[Embed(source="lib/AVG45__C.ttf", 
		fontName = 'mainAS', 
		embedAsCFF = "false",
		fontFamily = 'policeEmbed',
		//advancedAntiAliasing = 'true',   
		mimeType = 'application/x-font-truetype')]
		public static var font_mainAS:Class;
		
		[Embed(source="lib/AVG45__C.ttf", 
		fontName = 'main', 
		//embedAsCFF = "false",
		fontFamily = 'policeEmbed',
		advancedAntiAliasing = 'true',   
		mimeType = 'application/x-font-truetype')]
		public static var font_main:Class;
		
		public static function initFonts():void
		{
			//Font.registerFont(font_main);
			//Font.registerFont(font_mainB);
		}
	}

}