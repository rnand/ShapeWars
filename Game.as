package 
{

	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	public class Game extends MovieClip
	{

		//common
		public var timer:Timer = new Timer(28);
		public var score:int;

		//assets
		public var buttonstart:ButtonStart;
		public var gametitle:Title;
		public var hero:Hero;
		public var scorebox:ScoreBox;
		


		//variables

		//arrays

		public function Game()
		{
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			StartScreen();
		}

		public function StartScreen()
		{
			gametitle = new Title  ;
			addChild(gametitle);
			gametitle.x = 400;
			gametitle.y = 100;
			buttonstart = new ButtonStart  ;
			addChild(buttonstart);
			buttonstart.x = 407;
			buttonstart.y = 327;
			buttonstart.addEventListener(MouseEvent.CLICK,buttonstartfunction);
			function buttonstartfunction(eventObject:MouseEvent)
			{
				removeChild(buttonstart);
				removeChild(gametitle);
				SetUp();
			}


		}

		public function SetUp()
		{
			hero=new Hero;
			addChild(hero);
			hero.x=400;
			hero.y=500;
			hero.dead=false;
			score=0;
			scorebox=new ScoreBox;
			addChild(scorebox);
			scorebox.x=25;
			scorebox.y=12;
		}

		public function onTimer(evt:TimerEvent):void
		{

			IntroduceEnemies();
			ProcessUserInput();
			MoveObjects();
			CollisionDetection();
			RemoveDeadObjects();
			UpdateDisplay();
			CheckForGameOver();


		}//gameloop

		public function IntroduceEnemies()
		{
		}
		public function ProcessUserInput()
		{
		}
		public function MoveObjects()
		{
		}
		public function CollisionDetection()
		{
		}
		public function RemoveDeadObjects()
		{
		}
		public function UpdateDisplay()
		{
		}
		public function CheckForGameOver()
		{
		}

	}

}