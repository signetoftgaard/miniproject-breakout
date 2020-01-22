color background = #000000;

//ball & ball-variables----------
ball b; //defines a ball called 'b'
int ball_x = 800; 
int ball_y = 500;
float ball_r = 25; //radius of ball
float speed_x = 10;
float speed_y = 10;
//-------------------------------

//paddle & paddle-variables
paddle p;
float paddle_y = 900;
float paddle_w = 200;
float paddle_h = 20;
float offset = 100; //offset from the bottom of the screen
//------------------------------

// brick stuff------------------
//tutorial used to make the 2D-array https://processing.org/tutorials/2darray/
brick [][] brick_grid; //defining the brick array
int brick_c = 10; //columns
int brick_r = 8; //rows
float brick_x = 160; //x-coordinates of the brick
float brick_y = 40; //y-coordinates of the brick
float brick_w = 155; //width of brick, less than x value to make space
float brick_h = 35; //height of brick, less than y value to make space
float remove = -100; //coordinates where the dead bricks are removed to
//------------------------------

//trail ------------------------
//tutorial used: https://processing.org/tutorials/arrays/
int num = 10;
int[]trail_x = new int[num]; //array that stores x-positions
int[]trail_y = new int[num]; //array that stores y-positions
int index_p = 0; //index position


void setup() {
  size(1600, 1000);

  b = new ball (ball_x, ball_y, ball_r, speed_x, speed_y); //constructs ball b
  brick_grid = new brick[brick_c][brick_r];

  for (int i = 0; i < brick_c; i++) {
    for (int j = 0; j < brick_r; j++) {
      brick_grid[i][j] = new brick(brick_x * i, brick_y * j, brick_w, brick_h);
    }
  }
}

void draw() {
  background(background);
  p = new paddle(paddle_y, paddle_w, paddle_h); //paddle


  b.display(); //displays the ball
  p.display(); //displays paddle
  b.bounce(p); //makes ball bounce off paddle

//making the trail---------------------------
  trail_x[index_p] = ball_x;
  trail_y[index_p] = ball_y;
  index_p = (index_p + 1) % num; //cycles the index position 0 and the number of elements (in this case 10)
  for (int i = 0; i < num; i++) {
    int pos = (index_p + i) % num;
    float r = (ball_r + i);
    int transparency = (255-i*5);
    noStroke();
    fill(#0000FF, transparency);
    ellipse(trail_x[pos], trail_y[pos], r, r);
  }
//--------------------------------------------

  for (int i = 0; i < brick_c; i++) {
    for (int j = 0; j < brick_r; j++) { //displays the bricks and calls function that changes the speed when ball hits a brick
      brick_grid[i][j].display();
      b.back(brick_grid[i][j]);
    }
  }
}
