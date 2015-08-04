package Game {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class Game extends MovieClip {
		
		//common
		
		//assets
		
		//variables
		
		//arrays
		
		public function Game() {
			// game
		}
		
		public function startscreen(){
			//sscreen
		}
		
		public function SetUp(){
			//setup
		}
		
		public function onTimer(evt:TimerEvent):void{
			
			IntroduceEnemies();
			ProcessUserInput();
			MoveObjects();
			CollisionDetection();
			RemoveDeadObjects();
			UpdateDisplay();
			CheckForGameOver();
			
			
		}//gameloop
		
		public function IntroduceEnemies(){}
		public function ProcessUserInput(){}
		public function MoveObjects(){}
		public function CollisionDetection(){}
		public function RemoveDeadObjects(){}
		public function UpdateDisplay(){}
		public function CheckForGameOver(){}
		
	}
	
}
