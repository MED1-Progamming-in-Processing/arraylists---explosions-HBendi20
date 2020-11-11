ArrayList<Shape> shapes = new ArrayList<Shape>();
int nextshapetype;
void setup() {
  size(800, 800);
}

void mousePressed(){
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
  float xSpeed = random(-5, 5);
  float ySpeed = random(-5, 5);
  
  Shape(float x, float y, int z){
    this.x = x;
    this.y = y;
    this.shapetype=z;
  }
 
  void move() {
    x += xSpeed;
    y += ySpeed;
    ySpeed+=0.098;
  }

  void display() {
    if (shapetype==1){
      fill(255,0,0);
      ellipse(x, y, 20, 20);
    }
    if (shapetype==2){
      fill(0,255,0);
      rectMode(CENTER);
      rect(x, y, 20, 20);
    }
    if (shapetype==3){
      fill(0,0,255);
      triangle(x-10, y+10, x, y-8,x+10,y+10);
    }
  }
  
  boolean isOffScreen(){
    return x < 0 || x > width || y < 0 || y > height;
  }
}
