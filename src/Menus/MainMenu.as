package Menus 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import punk.ui.PunkButton;
	import punk.ui.PunkText;
	
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class MainMenu extends World 
	{
		public var playBtn:PunkButton;
		public var helpBtn:PunkButton;
		
		public var title:PunkText;
		
		public function MainMenu() 
		{
			title = new PunkText("Primordial Pool", 0, 100);
			title.x = FP.screen.width / 2 - title.width / 2;
			title.color = 0;
			addGraphic(title);
			playBtn = new PunkButton(FP.screen.width / 2 - 50, FP.screen.height / 3, 100, 30, "Play Game", onPlayBtn);
			helpBtn = new PunkButton(playBtn.x, playBtn.y + 40, 100, 30, "Help", onHelpBtn);
			
			add(playBtn);
			add(helpBtn);
		}
		
		public function onHelpBtn():void
		{
			FP.world = new HelpMenu();
		}
		
		public function onPlayBtn():void
		{
			FP.world = new LevelOne();
		}
		
		override public function end():void 
		{
			super.end();
			removeAll();
		}
	}

}