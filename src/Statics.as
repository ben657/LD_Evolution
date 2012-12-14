package  
{
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Data;
	/**
	 * ...
	 * @author Connor Lishman
	 */
	public class Statics 
	{
		[Embed(source = "../assets/player.png")]
		public static const playerCellImg:Class;
		
		[Embed(source = "../assets/red.png")]
		public static const enemyRedImg:Class;
		
		[Embed(source = "../assets/purple.png")]
		public static const enemyPurpleImg:Class;
		
		//[Embed(source = "../assets/seabg.png")]
		//public static const seabgImg:Class;
		
		[Embed(source = "../assets/blue.png")]
		public static const enemyBlueImg:Class;
		
		[Embed(source = "../assets/green fish.png")]
		public static const playerFish:Class;
		
		[Embed(source = "../assets/red fish.png")]
		public static const redFish:Class;
		
		[Embed(source = "../assets/purple fish.png")]
		public static const puprpleFish:Class;
		
		[Embed(source = "../assets/blue fish.png")]
		public static const blueFish:Class;
		
		[Embed(source = "../assets/bubbles.png")]
		public static const bubblesImg:Class;
		
		public static const colours:Array = ["red", "purple", "blue", "ev1red", "ev1purple", "ev1blue"];
		
		[Embed(source = "../assets/sounds/eat.mp3")]
		public static const eatSnd:Class;
		
		public static const eatFx:Sfx = new Sfx(eatSnd);
		
		[Embed(source = "../assets/sounds/loop.mp3")]
		public static const loopSnd:Class;
		
		public static const loopFx:Sfx = new Sfx(loopSnd);
		
		[Embed(source = "../assets/sounds/die.mp3")]
		public static const dieSnd:Class;
		
		public static const dieFx:Sfx = new Sfx(dieSnd);
		
		public static function getHiScore():int
		{
			Data.load("data");
			var score:int = Data.readInt("hiscore");
			return score;			
		}
		
		public static function setHiScore(score:int):void
		{
			Data.load("data");
			Data.writeInt("hiscore", score);
			Data.save("data");
		}
		
	}

}