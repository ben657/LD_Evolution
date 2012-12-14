package  
{
	import Entities.Bubble;
	import Entities.Cell;
	import Entities.CellEnemy;
	import Entities.CellEnemyFloat;
	import Entities.CellPlayer;
	import Menus.MainMenu;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class LevelOne extends World 
	{
		public static var player:CellPlayer;
		
		public var nextSpawnTime:int = 0;
		public var nextBubbleTime:int = 0;
		public var ui:UI;
		
		public static var numSpawned:int = 0;
		
		public function LevelOne() 
		{
			Statics.loopFx.loop();
			player = new CellPlayer(0, 0);			
			add(player);
			ui = add(new UI) as UI;
			//var bg:Entity = addGraphic(new Image(Statics.seabgImg),0, -1920/2,-1440/2);
			//(bg.graphic as Image).alpha = 0.3;
			numSpawned = 0;
			//bg.graphic.scrollX = bg.graphic.scrollY = 0;			
		}
		
		override public function update():void 
		{
			bringToFront(ui);
			if (Input.check(Key.ESCAPE))
			{
				FP.world = new MainMenu();
			}
			//if (camera.x < -640)
			//{
				//camera.x = -640;
			//}
			//if (camera.x > 0)
			//{
				//camera.x = 0;
			//}
			//if (camera.y < -480)
			//{
				//camera.y = -480;
			//}
			//if (camera.y > 0 )
			//{
				//camera.y = 0;
			//}
			
			super.update();
			if (nextSpawnTime <= 0 && numSpawned < 30)
			{
				var nextX:int = FP.rand(1280) - 640;
				var nextY:int = FP.rand(480 * 2) - 480;
				var min:Number = (player.graphic as Spritemap).scale - 0.5;
				var max:Number = (player.graphic as Spritemap).scale + 1.5;
				var enemy:CellEnemy = add(new CellEnemyFloat(nextX, nextY, Statics.colours[FP.rand(3)],min + (max - min) * Math.random()/**(Math.random()*2) * player.size)**/)) as CellEnemy;
				nextSpawnTime = Math.random() * 60 + 1;	
				numSpawned++;
			}	
			if (nextBubbleTime == 0)
			{
				add(new Bubble());
				nextBubbleTime = Math.random() * 60 + 1;
			}
			nextBubbleTime -= 1;
			nextSpawnTime -= 1;
		}
		
		override public function end():void 
		{
			super.end();
			removeAll();
			Statics.loopFx.stop();
		}
		
	}

}