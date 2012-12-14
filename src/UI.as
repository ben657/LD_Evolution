package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author ...
	 */
	public class UI extends Entity 
	{
		public var scoreGrphc:Text;
		public var speedGrphc:Text;
		public var absorbSpeedGrphc:Text;
		public var followerLimitGrphc:Text;
		public var health:Text;
		
		public function UI() 
		{
			scoreGrphc = new Text("Score: ", 16, 16);
			scoreGrphc.color = 0;
			speedGrphc = new Text("Speed: ", 16, FP.screen.height - 20 - 16);
			speedGrphc.color = 0;
			absorbSpeedGrphc = new Text("AbsorbSpd: ", 16, speedGrphc.y - 20);
			absorbSpeedGrphc.color = 0;
			followerLimitGrphc = new Text("Followers: ", 16, absorbSpeedGrphc.y - 20);
			followerLimitGrphc.color = 0;
			
			graphic = new Graphiclist(scoreGrphc, speedGrphc, absorbSpeedGrphc, followerLimitGrphc);
			graphic.scrollX = graphic.scrollY = 0;
		
		}
		
		override public function update():void 
		{
			super.update();
			scoreGrphc.text = "Score: " + LevelOne.player.score;
			speedGrphc.text = "Speed: " + LevelOne.player.speed;
			absorbSpeedGrphc.text = "AbsorbSpd: " + LevelOne.player.absorbSpeed;
			followerLimitGrphc.text = "Followers: " + LevelOne.player.numFollowers;
		}
		
	}

}