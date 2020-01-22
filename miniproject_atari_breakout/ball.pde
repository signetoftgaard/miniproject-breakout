class ball {
  color ball_color = #0000FF;
  float b_x;
  float b_y;
  float b_r; //radius of ball
  
  //speed variables---------
  float speed_x;
  float speed_y;
  float speed_factor = 10; //the main speed, makes the math work
  //------------------------


  ball(float bax, float bay, float bar, float tspeed_x, float tspeed_y) { //constructor for the ball, which variables do we need
    b_x = bax;
    b_y = bay;
    b_r = bar;
    speed_x = tspeed_x;
    speed_y = tspeed_y;
  }

  void display() { //function that displays ball
    fill(ball_color);
    ellipse(ball_x, ball_y, ball_r, ball_r);
    move();
  }


  void move() { //makes the ball move
    ball_x += speed_x;
    ball_y += speed_y;
    edges(); //function is called here, so we don't need to in setup, as edges are always need when ball is moving
  }



  void edges() { //makes sure the ball doesn't move out of the window
    if (ball_x >= width-ball_r || ball_x <= 0 + ball_r) {
      speed_x *= -1;
    }
    if (ball_y >= height-ball_r || ball_y <= 0+ball_r) {
      speed_y *= -1;
    }
  }

  void bounce(paddle other) { //makes the ball bounce differently according to where on the paddle it hits
    if (ball_y + ball_r > other.p_y-other.p_h/2 && ball_x > other.p_x - other.p_w/2 && ball_x  < other.p_x + other.p_w/2) {
      speed_y *= -1; //y-speed is constant
      speed_x = (ball_x - (other.p_m))/speed_factor;
    }
    }

void back(brick other){
  if(ball_y -ball_r <= other.br_y+other.br_h && ball_x > other.br_x && ball_x < other.br_x+other.br_w){
    println("collide");
    speed_y *=-1;
    println(speed_y);
  }
  
 


}
}
