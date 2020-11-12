import processing.sound.*;

SoundFile explosion;
ArrayList<Shape> shapes = new ArrayList<Shape>();
int nextshapetype;
int globalscale = 20;

void setup() {
  size(800, 800);
  frameRate(60);
  explosion = new SoundFile(this, "explosion.mp3");
}

void mousePressed(){
  explosion.play();
  nextshapetype++;
  if (nextshapetype==4){
  nextshapetype=1;
}
  for(int i = 0; i < 100; i++){
    shapes.add(new Shape(mouseX, mouseY, nextshapetype));   
  }
}

void draw() {
  background(200);

  for (int i = shapes.size()-1; i >= 0; i--) {
    shapes.get(i).move();
    shapes.get(i).display();
    
    if(shapes.get(i).isOffScreen()){
      shapes.remove(i);
    }
  }
}

class Shape {

  float x;
  float y;
  int shapetype;
  int scale;
  float xSpeed = random(-5, 5);
  float ySpeed = random(-5, 5);
  
  Shape(float x, float y, int z){
    this.x = x;
    this.y = y;
    this.scale = globalscale;
    this.shapetype=z;
  }
  
  Shape(float x, float y, int z, int s){
    this.x = x;
    this.y = y;
    this.scale =s;
    this.shapetype=z;
  }
 
  void move() {
    x += xSpeed;
    y += ySpeed;
    ySpeed+=0.098;
  }

  void display() {
    if (shapetype==1){
      fill(round(random(0,255)),round(random(0,85)),round(random(0,85)));
      ellipse(x, y, this.scale, this.scale);
    }
    if (shapetype==2){
      fill(round(random(0,85)),round(random(0,255)),round(random(0,85)));
      rectMode(CENTER);
      rect(x, y, this.scale,this.scale);
    }
    if (shapetype==3){
      fill(round(random(0,85)),round(random(0,85)),round(random(0,255)));
      triangle(x-(this.scale/2), y+(+this.scale/2), x, y-(this.scale*0.4),x+(this.scale/2),y+this.scale/2);
    }
  }
  
  boolean isOffScreen(){
    return x < 0 || x > width || y < 0 || y > height;
  }
}
