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
	public class HelpMenu extends World 
	{
		public var controlsTxt:Text;
		public var redTxt:Text;
		public var purpleTxt:Text;
		public var blueTxt:Text;
		public var objectives1:Text;
		public var objectives2:Text;
		
		public var menuBtn:PunkButton;
		
		public function HelpMenu() 
		{
			controlsTxt = new Text("WASD or Arrows to move your cell. Escape to return to the menu.", 10, 10);
			controlsTxt.color = 0;
			redTxt = new Text("Absorb red cells to increase your speed.", 10, 30);
			redTxt.color = 0;
			purpleTxt = new Text("Asborb purple cells to increase your absorb speed.", 10, 50);
			purpleTxt.color = 0;
			blueTxt = new Text("Absorb blue cells to increase your max followers.", 10, 70);
			blueTxt.color = 0;
			objectives1 = new Text("You need to absorb other cells to increase your size and stats.", 10, 100);
			objectives1.color = 0;
			objectives2 = new Text("Increase your stats and gain points to make your cell rule the ocean.", 10, 120);
			objectives2.color = 0;
			
			menuBtn = new PunkButton(FP.screen.width / 2 - 50, 400, 100, 30, "Menu", onMenuBtn);
			add(menuBtn);
			
			var lines:Graphiclist = new Graphiclist(controlsTxt, redTxt, purpleTxt, blueTxt,objectives1,objectives2);
			addGraphic(lines);
		}
		
		public function onMenuBtn():void
		{
			FP.world = new MainMenu();
		}
		
	}

}