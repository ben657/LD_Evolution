package Entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class Cell extends Entity
	{
		public var isLeader:Boolean;
		public var leader:Cell;
		
		public var speed:int = 70;
		public var beingEaten:Boolean = false;
		public var eating:Cell = null;
		public var health:int = 1000;
		
		public function Cell(isLeader:Boolean, x:int, y:int, image:Graphic, leader:Cell = null)
		{
			centerOrigin();
			super(x, y, image);
			
			this.isLeader = isLeader;
			if (!isLeader && leader != null)
			{
				this.leader = leader;
			}
		
		}
		
		override public function update():void
		{
			super.update();
			if (x < -640)
			{
				x = -640;
			}
			if (x > 640 - 32)
			{
				x = 640 - 32;
			}
			if (y < -480)
			{
				y = -480;
			}
			if (y > 480 - 32)
			{
				y = 480 - 32;
			}
			
			//setHitbox(26 * (graphic as Spritemap).scale, 26 * (graphic as Spritemap).scale);
		}
	
	}

}