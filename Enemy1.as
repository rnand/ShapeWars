package  {
	
	import flash.display.MovieClip;
	
	
	public class Enemy1 extends MovieClip {
		
		public var yspeed:int=5;
		public var xspeed:int=5;
		public var mydirection:String;
		public var rnd1:int;
		public var dead:Boolean;
		
		
		public function Enemy1() {
			rnd1=Math.random()*2;
			if(rnd1==0){
				mydirection="left";
			}
			if(rnd1==1){
				mydirection="right";
			}
			
		}
		public function action():void{
			this.y+=yspeed;
			if(mydirection=="right"){
				this.x+=xspeed;
			}
			if(mydirection=="left"){
				this.x-=xspeed;
			}
			if(this.x<5){
				mydirection="right";
			}
			if(this.x>755){
				mydirection="left";
			}
			if(this.y>610){
				dead=true;
			}
		}
	}
	
}
