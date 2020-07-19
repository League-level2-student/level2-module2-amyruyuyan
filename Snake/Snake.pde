//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*
int x;
int y;

int foodX;
int foodY;
class Segment { 
  
int snakex;
int snakey;

//Add x and y member variables. They will hold the corner location of each segment of the snake.


// Add a constructor with parameters to initialize each variable.

Segment(int snakex, int snakey){
  this.snakex = snakex;
  this.snakey = snakey;
}
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

ArrayList<Segment> tail = new ArrayList<Segment>();

int direction = UP;
int amountoffood = 0;
Segment head = new Segment(250, 250);

// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);
frameRate(10);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(48)*10 + 10);
     foodY = ((int)random(48)*10 + 10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
background(#FFD8E6);
drawFood();
move();
drawSnake();
eat();
}

void drawFood() {
  //Draw the food
fill(#D8FFF1);
rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
fill(#E7E5FF);
rect(head.snakex, head.snakey, 10, 10);
manageTail();
}



//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  for (int i = 0; i < tail.size(); i++){   
fill (#F1D6FF);
rect (tail.get(i).snakex, tail.get(i).snakey, 10, 10);
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.snakex, head.snakey));
  tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for (int i = 0; i < tail.size(); i++){
  if (head.snakex == tail.get(i).snakex && head.snakey == tail.get(i).snakey){
    amountoffood = 0;
    tail = new ArrayList<Segment>();
    tail.add(new Segment(head.snakex, head.snakey));
  }
  }
  }
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (key == CODED) {
    if (keyCode == UP) {
      direction = UP;
      } 
   else if (keyCode == DOWN) {
      direction = DOWN;
      } 
   else if (keyCode == LEFT){
     direction = LEFT;
      }
   else if (keyCode == RIGHT){
     direction = RIGHT;
   }
   } 
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
switch(direction) {
  case UP: head.snakey -= 10; 
    // move head up here 
    break; 
  case DOWN: head.snakey += 10;
    // move head down here 
    break;
  case LEFT: head.snakex -= 10;
   // figure it out 
    break;
  case RIGHT: head.snakex += 10;
    // mystery code goes here 
    break;
  }
checkBoundaries();
 
    /*
  switch(direction) {
  case UP: snakeX - 1;
    // move head up here 
    break;
  case DOWN:
    // move head down here 
    break;
  case LEFT:
   // figure it out 
    break;
  case RIGHT:
    // mystery code goes here 
    break;
  }
  */
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if (head.snakex == 500){
   head.snakex = 10;
 }
 if (head.snakex == 0){
   head.snakex = 490;
 }
 if (head.snakey == 500){
   head.snakey = 10;
 }
 if (head.snakey == 0){
   head.snakey = 490;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if (head.snakex == foodX && head.snakey == foodY){
  amountoffood += 1;
  dropFood();
  tail.add(new Segment(head.snakex, head.snakey));
}
}
