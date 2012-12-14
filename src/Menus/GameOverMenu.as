package Menus 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import punk.ui.PunkButton;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GameOverMenu extends World 
	{
		public var menuBtn:PunkButton;
		public var lastScoreTxt:Text;
		public var hiScoreTxt:Text;
		
		public function GameOverMenu() 
		{
			if (LevelOne.player.score > Statics.getHiScore())
			{
				Statics.setHiScore(LevelOne.player.score);
			}
			menuBtn = new PunkButton(FP.screen.width / 2 - 50, 400, 100, 30, "Menu", onMenuBtn);
			lastScoreTxt = new Text("Score: " + LevelOne.player.score, FP.screen.width / 2 + 50, 240);
			hiScoreTxt = new Text("HiScore: " + Statics.getHiScore(), FP.screen.width / 2 + 50, 200);
			lastScoreTxt.x = FP.screen.width / 2 - lastScoreTxt.width / 2;
			hiScoreTxt.x = FP.screen.width / 2 - hiScoreTxt.width / 2;
			
			lastScoreTxt.color = hiScoreTxt.color = 0;
			var list:Graphiclist = new Graphiclist(lastScoreTxt, hiScoreTxt);
			addGraphic(list);
			add(menuBtn);
		}
		
		public function onMenuBtn():void
		{
			FP.world = new MainMenu();
		}
		
	}

}