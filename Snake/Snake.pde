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

int direction;
int amountoffood;
Segment head = new Segment(250, 250);

// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
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
}



//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
switch(direction) {
  case UP: direction.snakex - 1;
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
 
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear

}
