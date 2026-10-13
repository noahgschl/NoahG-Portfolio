//This was made using a Java based program called Processing.


//Noah Gayner
//Snake In A Maze


int radius = 10, directionX = 0, directionY = 0;//Sets the variables for the radius and directions
float x = 185, y = 190, speed = 3;//Sets the variables for the x, y, and speed 

void setup() //sets the attributes of the console window
{ 
  background(#36A231);//sets the background color to a deep green
  smooth();//turns on anti-aliasing
  size(800,1000);//sets the size of the window
  ellipseMode(RADIUS);//changes how ellipses are created from now on
}


void keyPressed() {//This function reacts to input on the arrow keys
  
  if (key == CODED)//Checks if the key pressed is coded
  {
    if (keyCode == LEFT)//Checks if the key pressed is the LEFT arrow key
    {
      directionX =- 1;//Sets the ball to go to the left
      directionY = 0;//Sets the up and down direction to zero
    }
    else if (keyCode == RIGHT)//Checks if the key pressed is the RIGHT arrow key
    {
      directionX = 1;//Sets the ball to go to the right
      directionY = 0;//Sets the up and down direction to zero
    }
    else if (keyCode == UP)//Checks if the key pressed is the UP arrow key
    {
      directionY =- 1;//Sets the ball to go up
      directionX = 0;//stops the snake from moving on the horizontal plane//Sets the left and right direction to zero
    }
    else if (keyCode == DOWN)//Checks if the key pressed is the DOWN arrow key
    {
      directionY = 1;//Sets the ball to go down 
      directionX = 0;//stops the snake from moving on the horizontal plane//Sets the left and right direction to zero
    }
  }
}

void draw(){//This function draws in the entire maze for the ball to traverse,
//and tells the ball how to move when movement is input

noStroke();

   if (x < 460 + 80 &&
    x + radius > 20 &&
    y < 670 + 650 &&
    radius + y > 670) 
    {
      x = 185;//sets the snake to the start x value
      y = 850;
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0;//stops the snake from moving on the vertical plane
      fill(0);//sets the color of the next object to black
      textSize(30);//sets the text size to 30
      text("Congratulations, you've escaped the maze! \nYou can play again, or end the game now.", 150, 750);//displays the victory text, telling the user that they've won
    }  


  x = x + speed*directionX;//Says that the x direction equals the sum of the x direction plus the speed of the ball
  y = y + speed*directionY;//Says that the y direction equals the sum of the y direction plus the speed of the ball
 
 
  fill(#F52C2C);//Turns the balls color bright red
  ellipse (x, y, radius, radius);//creates the ball using its x, y, and radius value
  
  fill(0);//Makes the text on screen black
  textSize(40);//Changes the text size to 40 pixels
  text("Welcome to Snake in the Hedge Maze!", 10, 35);//Creates the text "Snake in the Hedge Maze!" at the specified coords
  textSize(20);//Changes the text to be smaller, now 20 pixels
  text("Use the arrow keys to esacpe the maze, and don't touch the walls!", 10, 70);//Creates text to help the user understand how to move the ball through the maze
  
  
  noStroke();//means that the walls won't have an outline
  fill(#11460F);//gives the walls a darker green color to look similar to hedges
  rect(100, 150, 20, 510, 5);//left wall
  rect(700, 150, 20, 510, 0, 5, 5, 5);//right wall
  rect(100, 150, 130, 20, 5, 5, 5, 5);//shorter top wall
  rect(200, 150, 500, 20, 5, 0, 0, 5);//longer top wall
  rect(100, 210, 70, 20, 5, 5, 0, 5);//entrance, left wall
  rect(210, 150, 20, 80, 5, 5, 5, 5);//entrance, right wall
  rect(150, 230, 20, 160, 0, 0, 5, 5);//entrance, longer left wall
  rect(210, 270, 20, 80, 5, 0, 5, 5);//left side of middle dead end
  rect(210, 270, 200, 20, 5, 0, 0, 0);//top of middle dead end
  rect(270, 270, 20, 280, 0, 5, 5, 5);//right side of middle dead end
  rect(210, 390, 20, 220, 5, 5, 5, 5);//left side, attached to bottom horizontal wall (next line of code)
  rect(210, 590, 200, 20, 0, 0, 5, 5);//bottom horizontal wall
  rect(150, 430, 80, 20, 5, 0, 0, 5);//first right wall in zig zag corridor
  rect(110, 480, 60, 20, 0, 5, 5, 0);//first left wall in zig zag corridor
  rect(150, 530, 80, 20, 5, 0, 0, 5);//second right wall in zig zag corridor
  rect(110, 580, 60, 20, 0, 5, 5, 0);//second left wall in zig zag corridor
  rect(450, 530, 20, 140, 5, 5, 0, 0);//upright to the left of the exit
  rect(410, 210, 20, 80, 0, 0, 5, 0);//dead end wall below top seporator
  rect(645, 210, 20, 410, 5, 5, 5, 5);//right side, channel seperator
  rect(390, 470, 20, 120, 5, 5, 0, 0);//left side of over-under by exit
  rect(390, 470, 160, 20, 5, 5, 5, 0);//top of over-under by exit
  rect(530, 470, 20, 200, 0, 5, 0, 5);//right side of over-under by exit
  rect(330, 390, 20, 200, 5, 5, 0, 0);//middle vertical seperator, to the left outside the exit wall
  rect(290, 330, 120, 20, 0, 5, 5, 0);//horizontal, north-west from center of maze
  rect(390, 330, 20, 80, 0, 5, 0, 0);//center vertical wall
  rect(390, 410, 160, 20, 0, 5, 5, 5);//horizontal, directly above horizontal exit wall
  rect(450, 350, 160, 20, 5, 0, 0, 5);//horizontal, first right horizontal wall near center
  rect(490, 290, 120, 20, 5, 0, 0, 5);//horizontal, second right horizontal wall near center
  rect(590, 270, 20, 380, 5, 5, 0, 0);//right seperator
  rect(270, 210, 380, 20, 5, 5, 0, 5);//top seperator
  rect(100, 650, 370, 20, 5, 0, 5, 5);//longer bottom wall
  rect(530, 650, 190, 20, 0, 5, 5, 5);//shorter bottom wall  
  

//The following lines of code are detecting collision for every rectangle/wall of the maze (there's a lot)

////Detects collision with the longer bottom wall
  if (x < 100 + 370 &&
    x + radius > 100 &&
    y < 650 + 20 &&
    radius + y > 650) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }

//Detects collision with the left wall
  if (x < 100 + 20 &&
    x + radius > 100 &&
    y < 150 + 510 &&
    radius + y > 150) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
      background(#36A231);
    }
    
//Detects collision with the shorter bottom wall
  if (x < 530 + 190 &&
    x + radius > 530 &&
    y < 650 + 20 &&
    radius + y > 650) 
    {
    x = 185;//sets the snake to the start x value
    y = 190;//sets the snake to the start y value
    directionX = 0;//stops the snake from moving on the horizontal plane
    directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the right wall
if (x < 700 + 20 &&
    x + radius > 700 &&
    y < 150 + 510 &&
    radius + y > 150) 
    {    
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }    
    
//Detects collision with the shorter top wall
if (x < 100 + 130 &&
    x + radius > 100 &&
    y < 150 + 20 &&
    radius + y > 150) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the longer top wall
if (x < 200 + 500 &&
    x + radius > 200 &&
    y < 150 + 20 &&
    radius + y > 150) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the entrance, left wall
if (x < 100 + 70 &&
    x + radius > 100 &&
    y < 210 + 20 &&
    radius + y > 210) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }

//Detects collision with the entrance, right wall
if (x < 210 + 20 &&
    x + radius > 210 &&
    y < 150 + 80 &&
    radius + y > 150) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
   
//Detects collision with the entrance, longer left wall
if (x < 150 + 20 &&
    x + radius > 150 &&
    y < 230 + 160 &&
    radius + y > 230) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the left side of dead end by entrance
if (x < 210 + 20 &&
    x + radius > 210 &&
    y < 270 + 80 &&
    radius + y > 270) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the top of dead end by entrance
if (x < 210 + 200 &&
    x + radius > 210 &&
    y < 270 + 20 &&
    radius + y > 270) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the right side of dead end by entrance
if (x < 270 + 20 &&
    x + radius > 270 &&
    y < 270 + 280 &&
    radius + y > 270) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the top seperator   
if (x < 270 + 380 &&
    x + radius > 270 &&
    y < 210 + 20 &&
    radius + y > 210) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the right seperator    
if (x < 590 + 20 &&
    x + radius > 590 &&
    y < 270 + 380 &&
    radius + y > 270) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the left side, attached to bottom horizontal wall (next line of code)    
if (x < 210 + 20 &&
    x + radius > 210 &&
    y < 390 + 220 &&
    radius + y > 390) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the bottom horizontal wall    
if (x < 210 + 200 &&
    x + radius > 210 &&
    y < 590 + 20 &&
    radius + y > 590) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }
    
//Detects collision with the first right wall in zig zag corridor    
if (x < 150 + 80 &&
    x + radius > 150 &&
    y < 430 + 20 &&
    radius + y > 430) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }    
    
//Detects collision with the first left wall in zig zag corridor   
if (x < 110 + 60 &&
    x + radius > 110 &&
    y < 480 + 20 &&
    radius + y > 480) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }    
    
//Detects collision with the second right wall in zig zag corridor
if (x < 150 + 80 &&
    x + radius > 150 &&
    y < 530 + 20 &&
    radius + y > 530) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }    
    

if (x < 110 + 60 &&
    x + radius > 110 &&
    y < 580 + 20 &&
    radius + y > 580) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 
    
//Detects collision with the upright to the left of the exit    
if (x < 450 + 20 &&
    x + radius > 450 &&
    y < 530 + 140 &&
    radius + y > 530) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    }    
    
//Detects collision with the dead end wall below top seperator    
 if (x < 410 + 20 &&
    x + radius > 410 &&
    y < 210 + 80 &&
    radius + y > 210) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the right side, channel seperator
if (x < 645 + 20 &&
    x + radius > 645 &&
    y < 210 + 410 &&
    radius + y > 210) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the left side of over-under by exit
if (x < 390 + 20 &&
    x + radius > 390 &&
    y < 470 + 120 &&
    radius + y > 470) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the top of over-under by exit
if (x < 390 + 20 &&
    x + radius > 390 &&
    y < 470 + 120 &&
    radius + y > 470) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the right side of over-under by exit
if (x < 530 + 20 &&
    x + radius > 530 &&
    y < 470 + 200 &&
    radius + y > 470) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the middle vertical seperator, to the left outside the exit wall
if (x < 330 + 20 &&
    x + radius > 330 &&
    y < 390 + 200 &&
    radius + y > 390) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the horizontal, north-west from center of maze
if (x < 290 + 120 &&
    x + radius > 290 &&
    y < 330 + 20 &&
    radius + y > 330) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the center vertical wall
if (x < 390 + 20 &&
    x + radius > 390 &&
    y < 330 + 80 &&
    radius + y > 330) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the horizontal, directly above horizontal exit wall
if (x < 390 + 160 &&
    x + radius > 390 &&
    y < 410 + 20 &&
    radius + y > 410) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 

//Detects collision with the horizontal, first right horizontal wall near center
if (x < 450 + 160 &&
    x + radius > 450 &&
    y < 350 + 20 &&
    radius + y > 350) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 


//Detects collision with the horizontal, second right horizontal wall near center
if (x < 490 + 120 &&
    x + radius > 490 &&
    y < 290 + 20 &&
    radius + y > 290) 
    {
      x = 185;//sets the snake to the start x value
      y = 190;//sets the snake to the start y value
      directionX = 0;//stops the snake from moving on the horizontal plane
      directionY = 0; background(#36A231);//stops the snake from moving on the vertical plane, refreshes the background
    } 
}

  
