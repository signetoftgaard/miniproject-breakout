color background = #000000;

//ball & ball-variables----------
ball b; //defines a ball called 'b'
float ball_x = 800; 
float ball_y = 500;
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
//float paddle_m = paddle_x + paddle_w/2; //middle of paddle


//------------------------------

// brick stuff------------------
brick [][] brick_grid; //defining the brick array
int brick_c = 10; //columns
int brick_r = 5; //rows
//float brick_x = 160; //x-coordinates of the brick
//float brick_y = 40; //y-coordinates of the brick
float brick_w = 155; //width of brick, less than x value to make space
float brick_h = 35; //height of brick, less than y value to make space
//------------------------------

boolean draw = true;
void setup() {
  size(1600, 1000);

  b = new ball (ball_x, ball_y, ball_r, speed_x, speed_y); //constructs ball b
  brick_grid = new brick[brick_c][brick_r];
  for (int i = 0; i < brick_c; i++) {
    for (int j = 0; j < brick_r; j++) {
      brick_grid[i][j] = new brick(160 * i, 40 * j, brick_w, brick_h);
    }
  }
}

void draw() {
  background(background);

  
      p = new paddle(paddle_y, paddle_w, paddle_h); //paddle
  b.display(); //displays the ball
  p.display(); //displays paddle
  b.bounce(p); //makes ball bounce off paddle
  
  
  for (int i = 0; i < brick_c; i++) {
    for (int j = 0; j < brick_r; j++) {
      brick_grid[i][j].display();
      b.back(brick_grid[i][j]);
    }
  }
}
