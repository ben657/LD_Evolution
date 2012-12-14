package Entities
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class CellEnemyFloat extends CellEnemy
	{
		public var timeToMove:Number = 0;
		public var velocity:Point = new Point();
		
		public function CellEnemyFloat(x:int, y:int, colour:String, size:Number)
		{
			super(x, y, colour, size);
			setHitbox(32, 32);
			type = "enemy";
			layer = 2;
		}
		
		override public function update():void
		{
			super.update();
			if (timeToMove <= 0)
			{
				velocity.x = FP.rand(150) - 75;
				velocity.y = FP.rand(150) - 75;
				timeToMove = (Math.random() * 2) * 60;				
			}				
			timeToMove -= 1;			
			moveBy(velocity.x * FP.elapsed, velocity.y * FP.elapsed);
		}
	
	}

}