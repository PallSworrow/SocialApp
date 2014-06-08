package model.videoExample 
{
	import adobe.utils.CustomActions;
	import flash.display.DisplayObject;
	import PS.elements.ProgressBar;
	import PS.elements.ScrollBar;
	import PS.elements.Switcher.Behaviors.SWtogleBehavior;
	import PS.elements.Switcher.SwitchButton;
	import PS.lib.SystemEmbeds;
	import PS1.PSelements.micro.LoadingBar;
	import PSvideoPlayer.SimpleVPcontrols;
	
	/**
	 * ...
	 * @author p.swarrow
	 */
	public class ControlsEx extends SimpleVPcontrols 
	{
		
		public function ControlsEx(w:int,h:int) 
		{
			
			playBtn = new SwitchButton(new SystemEmbeds.player_play);
			playBtn.addBehavior(new SWtogleBehavior(new SystemEmbeds.player_pause));
			
			
			soundBtn = new SwitchButton(new SystemEmbeds.player_soundOff);
			soundBtn.addBehavior(new SWtogleBehavior(new SystemEmbeds.player_sound));
			
			//volumeb = new ScrollBar(50,new SystemEmbeds.
			var disp:DisplayObject = new SystemEmbeds.player_controlsBg;
			
			progressBar = new ProgressBar(new SystemEmbeds.player_loadBg, new SystemEmbeds.player_loadFill);
			
			playBtn.x = 50
			playBtn.y = 540;
			
			soundBtn.x = 650
			soundBtn.y = 540;
			
			progressBar.y = 550;
			progressBar.x = 100;
			super();
			width = w;
			height = h;
			
			addChild(progressBar, 'left', 'down');
			addChild(playBtn, 'left', 'down');
			addChild(soundBtn, 'right', 'down');
		}
		
	}

}