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
		public var gameovermsg:GameOver;
		public var instructions:Instructions;


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
			instructions = new Instructions;
			addChild(instructions);
			instructions.x=400;
			instructions.y=550;
			buttonstart = new ButtonStart  ;
			addChild(buttonstart);
			buttonstart.x = 407;
			buttonstart.y = 327;
			buttonstart.addEventListener(MouseEvent.CLICK,buttonstartfunction);
			function buttonstartfunction(eventObject:MouseEvent)
			{
				removeChild(buttonstart);
				removeChild(gametitle);
				removeChild(instructions);
				SetUp();
			}


		}

		public function SetUp()
		{
			hero = new Hero  ;
			addChild(hero);
			hero.x = 400;
			hero.y = 500;
			hero.dead = false;
			score = 0;
			scorebox = new ScoreBox  ;
			addChild(scorebox);
			scorebox.x = 800;
			scorebox.y = 50;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,KeyUpHandler);
			BulletArray = new Array  ;
			EnemyArray = new Array  ;
			timer.start();
		}

		public function KeyDownHandler(e:KeyboardEvent)
		{
			trace(e.keyCode);
			if (e.keyCode == 39)
			{
				Right = true;
			}
			if (e.keyCode == 37)
			{
				Left = true;
			}

		}

		public function KeyUpHandler(e:KeyboardEvent)
		{
			trace(e.keyCode);
			if (e.keyCode == 39)
			{
				Right = false;
			}
			if (e.keyCode == 37)
			{
				Left = false;
			}
			if (e.keyCode == 32)
			{
				Space = true;
			}
		}

		public function Shoot()
		{
			Space = false;
			bullet = new Bullet  ;
			addChild(bullet);
			bullet.x = hero.x;
			bullet.y = hero.y;
			bullet.dead = false;
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
			rnd1 = Math.random() * 30;
			if (rnd1==1)
			{
				enemy1 = new Enemy1  ;
				addChild(enemy1);
				enemy1.x = Math.random() * 800;
				enemy1.y = -30;
				EnemyArray.push(enemy1);
			}
		}
		public function ProcessUserInput()
		{
			if (Right && hero.x<780)
			{
				hero.x +=  5;
			}
			if (Left && hero.x>20)
			{
				hero.x -=  5;
			}
			if (Space)
			{
				Shoot();
			}
		}
		public function MoveObjects()
		{
			for(i=0;i<EnemyArray.length;i++){
				EnemyArray[i].action();
			}
			for each(var obj:Object in BulletArray){
				obj.y-=10;
			}
		}
		public function CollisionDetection()
		{
			for(i=0;i<EnemyArray.length;i++){
				if(EnemyArray[i].hitTestObject(hero)){
					hero.dead=true;
				}
				for(ii=0;ii<BulletArray.length;ii++){
					if(EnemyArray[i].hitTestObject(BulletArray[ii])){
						EnemyArray[i].dead=true;
						BulletArray[ii].dead=true;
						score+=5;
					}
				}
			}
		}





		public function RemoveDeadObjects()
		{
			for(i=0;i<BulletArray.length;i++){
				if(BulletArray[i].dead || BulletArray[i].y<0){
					removeChild(BulletArray[i]);
					BulletArray[i]=null;
					BulletArray.splice(i,1);
				}
			}
			for(i=0;i<EnemyArray.length;i++){
				if(EnemyArray[i].dead){
					removeChild(EnemyArray[i]);
					EnemyArray[i]=null;
					EnemyArray.splice(i,1);
				}
			}
			
			
		}




		public function UpdateDisplay()
		{
			scorebox.scoretext.text=  "Score:"+score.toString();
		}
		public function CheckForGameOver()
		{
			if(hero.dead){
				timer.stop();
				gameovermsg=new GameOver;
				addChild(gameovermsg);
				gameovermsg.x=400;
				gameovermsg.y=200;
				gameovermsg.addEventListener(MouseEvent.CLICK,gameoverfunction);
				function gameoverfunction(eventObject:MouseEvent){
					RemoveAllObjects();
					StartScreen();
				}
			}
		}
		
		public function RemoveAllObjects(){
			for(i=0;i<BulletArray.length;i++){
				removeChild(BulletArray[i]);
				BulletArray[i]=null;
			}
			for(i=0;i<EnemyArray.length;i++){
				removeChild(EnemyArray[i]);
				EnemyArray[i]=null;
			}
			BulletArray = [];
    		EnemyArray = [];
    		removeChild(hero);
    		removeChild(gameovermsg);
    		removeChild(scorebox);
    		stage.removeEventListener(KeyboardEvent.KEY_DOWN, KeyDownHandler);
    		stage.removeEventListener(KeyboardEvent.KEY_UP, KeyUpHandler);
		}

	}

}