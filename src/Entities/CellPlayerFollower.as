package Entities
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class CellPlayerFollower extends Cell
	{
		public var image:Spritemap = new Spritemap(Statics.playerCellImg, 32, 32);
		
		public function CellPlayerFollower(x:int, y:int, player:Cell)
		{
			super(false, x, y, image, player);
			image.add("default", [0, 1, 2, 3], 8, true);
			image.play("default", false, 2);
			type = "follower";
			speed = 70;
			layer = 1;			
			setHitbox(26, 26);
		}
		
		override public function update():void
		{
			super.update();
			setHitbox(26 * (graphic as Spritemap).scale, 26 * (graphic as Spritemap).scale);
			if (!isLeader && leader != null)
			{
				moveTowards(LevelOne.player.x, LevelOne.player.y, speed * FP.elapsed, ["player", "follower"]);				
			}
			(graphic as Spritemap).scale = ((LevelOne.player.graphic as Spritemap).scale / 3) * 2;
			if (eating != null)
			{
				moveTowards(eating.x, eating.y, 20 * FP.elapsed);
				eating.health -= 10;
				trace(eating.health);
				if (eating.health <= 0)
				{
					eating = null;
					speed = 70;					
				}
			}			
			if (collideTypes("follower", x, y))
			{
				x = x + FP.rand(50) - 25;
				y = y + FP.rand(50) - 25;
			}
			eatCheck();
			super.update();
		}
		
		public function eatCheck():void
		{
			var enemy:CellEnemy = collide("enemy", x, y) as CellEnemy;
			if (enemy != null)
			{
				if ((enemy.graphic as Spritemap).scale < (graphic as Spritemap).scale)
				{
					eating = enemy;
					enemy.beingEaten = true;
				}
				else
				{
					health -= 5;
				}
			}
			
			if (health <= 0)
			{
				FP.world.remove(this);
			}
		}
	
	}

}