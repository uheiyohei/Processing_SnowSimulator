int[] snowX;
int[] snowY;
int[] stack;
int maxStack;

void setup() {
  size(600, 400);
  snowX = new int[100];
  snowY = new int[100];
  stack = new int[601];
  maxStack = 0;
  
  init();
}

void init() {
  // Set snow's initial position
  for (int i = 0; i < snowY.length; i++) {
    snowX[i] = (int)random(600);
    snowY[i] = (int)random(400);
  }
  for (int i = 0; i < stack.length; i++) {
    stack[i] = 0;
  }
}

void draw() {
  noStroke();
  
  // Refresh the animation
  fill(100);
  rect(0, 0, 600, 400 - maxStack);
  
  fill(255);
  for (int i = 0; i < snowY.length; i++) {
    // When snow lies
    if (400 - snowY[i] <= stack[snowX[i]]) {
      stack[snowX[i]]++;
      if (stack[snowX[i]] > maxStack) {
        maxStack = stack[snowX[i]];
      }
      
      snowX[i] = (int)random(600);
      snowY[i] = 0;
    } 
    // Snow falls down
    else {
      snowY[i] += 1;
      
      // Animation of snow's fluttering
      int minRand = -1;
      int maxRand = 2;
      if (snowX[i] <= 0) {
        minRand = 0;
      } else if (snowX[i] == 599) {
        maxRand = 1;
      } else if (snowX[i] >= 600) {
        maxRand = 0;
      }
      snowX[i] += random(minRand, maxRand);
    }
    
    ellipse(snowX[i], snowY[i], 5, 5);
  }
}
