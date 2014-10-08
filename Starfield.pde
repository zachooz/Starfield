static final int OBJECT_COUNT = 200;
Spreadable[] galacticObject = new Spreadable[OBJECT_COUNT];
int obCount = 0;

void setup(){
	size(500,500);
	background(0);
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
		x  = (float) (Math.random()*30 + 235);
		y = (float) (Math.random()*30 + 235);
		xSpeed = (int) (Math.random()*7-3);
		ySpeed = (int) (Math.random()*7-3);
		theSize = (float) (Math.random()*50 + 20);
	}
	void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*7-3);
			ySpeed = (int) (Math.random()*7-3);
			move();
			return;	
		}
		x+=xSpeed;
		y+=ySpeed;
	}
	void create(){
		fill(100, 100, 100);
		rect(x,y,theSize,theSize);
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
	Star(){
		x  = (float) (Math.random()*30 + 235);
		y = (float) (Math.random()*30 + 235);
		xSpeed = (int) (Math.random()*9-4);
		ySpeed = (int) (Math.random()*9-4);
		theSize = (float) (Math.random()*10 + 5);
	}
	void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*9-4);
			ySpeed = (int) (Math.random()*9-4);
			move();
			return;	
		}
		x+=xSpeed;
		y+=ySpeed;
	}
	void create(){
		fill(255, 243, 61);
		rect(x,y,theSize,theSize);
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
	Comet(){
		x  = (float) (Math.random()*30 + 235);
		y = (float) (Math.random()*30 + 235);
		xSpeed = (int) (Math.random()*15-7);
		ySpeed = (int) (Math.random()*15-7);
		theSize = (float) (Math.random()*10 + 5);
	}
	void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*13-6);
			ySpeed = (int) (Math.random()*13-6);
			move();
			return;	
		}
		x+=xSpeed;
		y+=ySpeed;
	}
	void create(){
		fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
		rect(x,y,theSize,theSize);
	}
	void run(){
		create();
		move();
	}
}

void draw(){
	rectMode(CENTER);
	int randomNum = (int) (Math.random() * 10);
	fill(0,0,0,10);
	rect(250,250,800,800);
	if(obCount >= galacticObject.length){
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

	for(int i = 0; i<galacticObject.length; i++){
		if(galacticObject[i]!=null){
			galacticObject[i].run();
		}
	}
}
