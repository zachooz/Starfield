Spreadable galacticObject = new Spreadable[200];


void setup(){
	size(500,500);
	background(0);
}

interface Spreadable{
	void move();
	void create();
	float x  = (float) (Math.random()*30 + 235);
	float y = (float) (Math.random()*30 + 235);
	int xSpeed;
	int ySpeed;
	float theSize;
}

class Asteroid implements Spreadable{
	Asteroid(){
		xSpeed = (int) (Math.random()*7-3);
		ySpeed = (int) (Math.random()*7-3);
		theSize = (float) (Math.random()*50 + 20);
	}
	void move(){
		if(xSpeed == 0 || ySpeed == 0){
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
}

class Star implements Spreadable{
	Star(){
		xSpeed = (int) (Math.random()*9-4);
		ySpeed = (int) (Math.random()*9-4);
		theSize = (float) (Math.random()*10 + 5);
	}
	void move(){
		if(xSpeed == 0 || ySpeed == 0){
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
		ellipse(x,y,theSize,theSize);
	}
}

class Comet implements Spreadable{
	Comet(){
		xSpeed = (int) (Math.random()*15-7);
		ySpeed = (int) (Math.random()*15-7);
		theSize = (float) (Math.random()*10 + 5);
	}
	void move(){
		if(xSpeed == 0 || ySpeed == 0){
			xSpeed = (int) (Math.random()*15-7);
			ySpeed = (int) (Math.random()*15-7);
			move();
			return;	
		}
		x+=xSpeed;
		y+=ySpeed;
	}
	void create(){
		fill(51, 295, 255);
		ellipse(x,y,theSize,theSize);
	}
}

void draw(){
	fill(0);
	rect(-10,-10,800,800);
}
