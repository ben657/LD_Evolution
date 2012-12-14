package Entities
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class CellEnemy extends Cell
	{
		public var color:String;
		public var image:Spritemap;
		public var fading:Boolean = true;
		public var size:Number = 1;
		
		public function CellEnemy(x:int, y:int, colour:String, size:Number)
		{
			setHitbox(26, 26);
			this.color = colour;
			this.size = size;
			switch (colour)
			{
				case "red": 
					image = new Spritemap(Statics.enemyRedImg, 32, 32);
					break;
				case "purple": 
					image = new Spritemap(Statics.enemyPurpleImg, 32, 32);
					break;
				case "blue": 
					image = new Spritemap(Statics.enemyBlueImg, 32, 32);
					break;
			}
			super(false, x, y, image);
			image.add("default", [0, 1, 2, 3], 8, true);
			image.play("default");
			image.alpha = 0;
		}
		
		override public function update():void
		{
			setHitbox(26 * (graphic as Spritemap).scale, 26 * (graphic as Spritemap).scale);
			speed = 70;
			super.update();
			(graphic as Spritemap).scale = (health / 1000) * size;
			if (fading)
			{
				image.alpha += 0.05;
				if (image.alpha == 1)
				{
					fading = false;
				}
			}
			var enemy:CellEnemy = collide("enemy", x, y) as CellEnemy;
			if (enemy != null)
			{
				if ((enemy.graphic as Spritemap).scale < (graphic as Spritemap).scale && enemy.color != color)
				{
					enemy.health -= 10;
				}
			}
			if (beingEaten)
			{
				speed /= 8;
			}
			if (health <= 0)
			{
				FP.world.remove(this);
				LevelOne.numSpawned--;
				if (beingEaten)
				{
					if (LevelOne.player.numFollowers < LevelOne.player.followerLimit)
					{
						FP.world.add(new CellPlayerFollower(LevelOne.player.x, LevelOne.player.y, LevelOne.player));
						LevelOne.player.numFollowers++;
					}
					switch (color)
					{
						case Statics.colours[0]: 
							LevelOne.player.speed += 10;
							break;
						case Statics.colours[1]: 
							LevelOne.player.absorbSpeed += 2;
							break;
						case Statics.colours[2]: 
							LevelOne.player.followerLimit += 1;
							trace("blue");
							break;
					}
					LevelOne.player.size += 0.1;
					LevelOne.player.score += size * 10;
					Statics.eatFx.play();
				}
			}
		}
	
	}
}