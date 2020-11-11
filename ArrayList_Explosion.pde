ArrayList<Circle> circles = new ArrayList<Circle>();

void setup() {
  size(300, 300);
}

void mousePressed(){
  for(int i = 0; i < 100; i++){
    circles.add(new Circle(mouseX, mouseY));   
  }
}

void draw() {
  background(200);

  for (int i = circles.size()-1; i >= 0; i--) {
    circles.get(i).move();
    circles.get(i).display();
    
    if(circles.get(i).isOffScreen()){
      circles.remove(i);
    }
  }
}

class Circle {

  float x;
  float y;
  float xSpeed = random(-3, 3);
  float ySpeed = random(-3, 3);
  
  Circle(float x, float y){
    this.x = x;
    this.y = y;
  }
 
  void move() {
    x += xSpeed;
    y += ySpeed;
  }

  void display() {
    ellipse(x, y, 20, 20);
  }
  
  boolean isOffScreen(){
    return x < 0 || x > width || y < 0 || y > height;
  }
}
