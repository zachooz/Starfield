static final int OBJECT_COUNT = 500;
Spreadable[] galacticObject = new Spreadable[OBJECT_COUNT];
int obCount = 0;

void setup(){
	size(800,800);
	background(0);
	galacticObject[galacticObject.length-1] = new Oddball();
	noStroke();
}

interface Spreadable{
	void move();
	void create();
	void run();
}

class Asteroid implements Spreadable{
	float x;
	float y;
	int xSpeed;
	int ySpeed;
	float theSize;
	Asteroid(){
		x  = (float) (Math.random()*30 + 385);
		y = (float) (Math.random()*30 + 385);
		xSpeed = (int) (Math.random()*11-5);
		ySpeed = (int) (Math.random()*11-5);
		theSize = (float) (Math.random()*50 + 20);
	}
	void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*7-3);
			ySpeed = (int) (Math.random()*7-3);
			move();
			return;	
		}
		theSize+=.1;
		x+=xSpeed;
		y+=ySpeed;
	}
	void create(){
		fill(100, 100, 100);
		ellipse(x,y,theSize,theSize);
	}
	void run(){
		create();
		move();
	}
}

class Star implements Spreadable{
	float x;
	float y;
	int xSpeed;
	int ySpeed;
	float theSize;
	float swerve;
	Star(){
		x  = (float) (Math.random()*30 + 385);
		y = (float) (Math.random()*30 + 385);
		xSpeed = (int) (Math.random()*9-4);
		ySpeed = (int) (Math.random()*9-4);
		theSize = (float) (Math.random()*10 + 5);
		swerve = 0;
	}
	void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*9-4);
			ySpeed = (int) (Math.random()*9-4);
			move();
			return;	
		}
		x+=xSpeed + 2*Math.sin(swerve);
		y+=ySpeed + 2*Math.sin(swerve);
		theSize+=.1;
		swerve+=.1;
	}
	void create(){
		fill(255, 243, 61);
		ellipse(x,y,theSize,theSize);
	}
	void run(){
		create();
		move();
	}
}

class Comet implements Spreadable{
	float x;
	float y;
	int xSpeed;
	int ySpeed;
	float theSize;
	float swerve;
	Comet(){
		x  = (float) (Math.random()*30 + 385);
		y = (float) (Math.random()*30 + 385);
		xSpeed = (int) (Math.random()*15-7);
		ySpeed = (int) (Math.random()*15-7);
		theSize = (float) (Math.random()*10 + 5);
	}
	void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*5-2);
			ySpeed = (int) (Math.random()*5-2);
			move();
			return;	
		}
		x+=xSpeed + Math.tan(swerve);
		y+=ySpeed + Math.tan(swerve);
		theSize+=.1;
		swerve+=.1;
	}
	void create(){
		fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
		ellipse(x,y,theSize,theSize);
	}
	void run(){
		create();
		move();
	}
}

class Oddball implements Spreadable{
	float x;
	float y;
	float rotation;
	float theSize;
	float changeSize;
	Oddball(){
		x=200;
		y=200;
		rotation=0;
		theSize=0;
		changeSize = .5;
	}
	void move(){
		if(theSize>300){
			changeSize*=-1;
		}
		if(theSize<0){
			changeSize*=-1;
		}
		theSize+=changeSize;
		translate(width/2, height/2);
		rotate(rotation+=.01);

	}
	void create(){
		fill(0,255,0);
		ellipse(x, y, theSize, theSize);
	}
	void run(){
		move();
		create();
	}
}



void draw(){
	rectMode(CENTER);
	int randomNum = (int) (Math.random() * 10);
	fill(0,0,0,10);
	rect(250,250,8000,8000);
	if(obCount >= galacticObject.length-1){
		obCount = 0;
	}
	if(randomNum <=2){
		galacticObject[obCount] = new Comet();
	} else if(randomNum <= 7){
		galacticObject[obCount] = new Star();
	} else if(randomNum <= 10){
		galacticObject[obCount] = new Asteroid();
	}
	obCount++;
	if(galacticObject[galacticObject.length-1]!=null){
		galacticObject[galacticObject.length-1].move();
	}
	for(int i = 0; i<galacticObject.length-1; i++){
		if(galacticObject[i]!=null){
			galacticObject[i].run();
		}
	}
	if(galacticObject[galacticObject.length-1]!=null){
		galacticObject[galacticObject.length-1].create();
	}
}
