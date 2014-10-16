import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Starfield extends PApplet {

static final int OBJECT_COUNT = 500;
Spreadable[] galacticObject = new Spreadable[OBJECT_COUNT];
int obCount = 0;

public void setup(){
	size(800,800);
	background(0);
	galacticObject[galacticObject.length-1] = new Oddball();
}

interface Spreadable{
	public void move();
	public void create();
	public void run();
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
	public void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*7-3);
			ySpeed = (int) (Math.random()*7-3);
			move();
			return;	
		}
		theSize+=.1f;
		x+=xSpeed;
		y+=ySpeed;
	}
	public void create(){
		fill(100, 100, 100);
		rect(x,y,theSize,theSize);
	}
	public void run(){
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
	public void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*9-4);
			ySpeed = (int) (Math.random()*9-4);
			move();
			return;	
		}
		x+=xSpeed + 2*Math.sin(swerve);
		y+=ySpeed + 2*Math.sin(swerve);
		theSize+=.1f;
		swerve+=.1f;
	}
	public void create(){
		fill(255, 243, 61);
		rect(x,y,theSize,theSize);
	}
	public void run(){
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
	public void move(){
		if(xSpeed == 0 && ySpeed == 0){
			xSpeed = (int) (Math.random()*5-2);
			ySpeed = (int) (Math.random()*5-2);
			move();
			return;	
		}
		x+=xSpeed + Math.tan(swerve);
		y+=ySpeed + Math.tan(swerve);
		theSize+=.1f;
		swerve+=.1f;
	}
	public void create(){
		fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
		rect(x,y,theSize,theSize);
	}
	public void run(){
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
		changeSize = .5f;
	}
	public void move(){
		if(theSize>width/2){
			changeSize*=-1;
		}
		if(theSize<0){
			changeSize*=-1;
		}
		theSize+=changeSize;
		translate(width/2, height/2);
		rotate(rotation+=.01f);

	}
	public void create(){
		fill((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256));
		rect(x,y,theSize,theSize);
	}
	public void run(){
		move();
		create();
	}
}



public void draw(){
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Starfield" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}