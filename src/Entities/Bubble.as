package Entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Ben Sandwick & Connor Lishman
	 */
	public class Bubble extends Entity 
	{
		public var time:Number;
		public var direction:Point = new Point();
		public var rotation:int;
		public var speed:int = 20;		
		
		public function Bubble() 
		{
			time = FP.rand(2) + 1;
			time *= 60;
			direction.x = FP.rand(2) - 1;
			direction.y = FP.rand(2) - 1;
			rotation = FP.rand(360);
			var image:Image = new Image(Statics.bubblesImg);
			image.angle = rotation;
			image.alpha = 0.5;
			
			var minX:int = LevelOne.player.x - 320;
			var minY:int = LevelOne.player.y - 240;
			var maxX:int = LevelOne.player.x + 320;
			var maxY:int = LevelOne.player.y + 240;
			super(minX + (maxX - minX) * Math.random(), minY + (maxY - minY) * Math.random(), image);
		}
		
		override public function update():void 
		{
			super.update();
			if (time != 0)
			{
				moveBy(direction.x * speed * FP.elapsed, direction.y * speed * FP.elapsed);
			}
			else
			{
				FP.world.remove(this);
			}
			time--;
		}
		
	}

}