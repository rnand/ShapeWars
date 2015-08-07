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
		public var rnd1:int;
		public var i:int;
		public var ii:int;

		//assets
		public var buttonstart:ButtonStart;
		public var gametitle:Title;
		public var hero:Hero;
		public var scorebox:ScoreBox;
		public var enemy1:Enemy1;
		public var bullet:Bullet;


		//variables
		public var Right:Boolean;
		public var Left:Boolean;
		public var Space:Boolean;

		//arrays
		public var BulletArray:Array;
		public var EnemyArray:Array;

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
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,KeyUpHandler);
			BulletArray=new Array;
			EnemyArray=new Array;
			timer.start();
		}
		
		public function KeyDownHandler(e:KeyboardEvent){
			trace(e.keyCode);
			if(e.keyCode==39){
				Right=true;
			}
			if(e.keyCode==37){
				Left=true;
			}
			
		}
		
		public function KeyUpHandler(e:KeyboardEvent){
			trace(e.keyCode);
			if(e.keyCode==39){
				Right=false;
			}
			if(e.keyCode==37){
				Left=false;
			}
			if(e.keyCode==32){
				Space=true;
			}
		}
		
		public function Shoot(){
			Space=false;
			bullet=new Bullet;
			addChild(bullet);
			bullet.x=hero.x;
			bullet.y=hero.y;
			bullet.dead=false;
			BulletArray.push(bullet);
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
			rnd1=Math.random()*30;
			if(rnd1==1){
				enemy1=new Enemy1;
				addChild(enemy1);
				enemy1.x=Math.random()*800;
				enemy1.y=-30;
				EnemyArray.push(enemy1);
			}
		}
		public function ProcessUserInput()
		{
			if(Right && hero.x<780){
				hero.x+=5;
			}
			if(Left && hero.x>20){
				hero.x-=5;
			}
			if(Space){
				Shoot();
			}
		}
		public function MoveObjects()
		{
			for(i=0;i<EnemyArray.length;i++){
				EnemyArray[i].action();
			}
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