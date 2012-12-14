package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Menus.MainMenu;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Ben Sandwick & Connor Lishman
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(640, 480, 60);
			FP.world = new MainMenu();
			FP.screen.color = 0xEFFFFF;
		}				
	}	
}