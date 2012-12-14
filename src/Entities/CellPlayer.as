package Entities
{
	import flash.geom.Point;
	import Menus.GameOverMenu;
	import Menus.MainMenu;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Anim;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class CellPlayer extends Cell
	{
		public var image:Spritemap = new Spritemap(Statics.playerCellImg, 32, 32);
		public var size:Number = 1;
				
		public var absorbSpeed:int = 10;
		public var followerLimit:int = 2;
		public var numFollowers:int = 0;
		
		public var score:int = 0;
		
		public function CellPlayer(x:int, y:int)
		{
			super(true, x, y, image);
			centerOrigin();
			(graphic as Spritemap).centerOrigin();
			image.add("default", [0, 1, 2, 3], 8, true);
			image.play("default");
			speed = 100;
			layer = 1;
			type = "player";
			setHitbox(26, 26,16,16);
		
		}
		
		override public function added():void
		{
			//FP.world.add(new CellPlayerFollower(x + 16, y + 16, this));
		}
		
		override public function update():void
		{
			super.update();
			var scale:Number = (graphic as Spritemap).scale;
			setHitbox(26 * scale, 26 * scale, 16 * scale, 16 * scale);
			(graphic as Spritemap).scale = (health / 1000) * size;
			if (eating != null && collide("enemy", x, y))
			{
				eating.health -= absorbSpeed;
				eating.beingEaten = true;
				if (eating.health <= 0)
				{
					eating = null;
					speed = 100;
				}
			}
			keyCheck();
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
				Statics.dieFx.play();
				FP.world = new GameOverMenu();
			}
		}
		
		public function keyCheck():void
		{
			var velocity:Point = new Point();
			
			if (Input.check(Key.D) || Input.check(Key.RIGHT))
			{
				velocity.x = speed * FP.elapsed;
			}
			if (Input.check(Key.A) || Input.check(Key.LEFT))
			{
				velocity.x = -speed * FP.elapsed;
			}
			if (Input.check(Key.S) || Input.check(Key.DOWN))
			{
				velocity.y = speed * FP.elapsed;
			}
			if (Input.check(Key.W) || Input.check(Key.UP))
			{
				velocity.y = -speed * FP.elapsed;
			}
			
			moveBy(velocity.x, velocity.y);
					
		}
		
		override public function render():void
		{
			super.render();
			FP.world.camera.x = x - 304;
			FP.world.camera.y = y - 224;
		}
	
	}

}