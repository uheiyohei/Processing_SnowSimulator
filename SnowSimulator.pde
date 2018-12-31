int[][] snowPosition;
int[] stack;
int maxStack;

void setup() {
  size(600, 400);
  snowPosition = new int[100][2];
  stack = new int[601];
  maxStack = 0;
  
  init();
}

void init() {
  // Set snow's initial position
  for (int i = 0; i < snowPosition.length; i++) {
    snowPosition[i][0] = (int)random(600);
    snowPosition[i][1] = (int)random(400);
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
  for (int i = 0; i < snowPosition.length; i++) {
    // When snow lies
    if (400 - snowPosition[i][1] <= stack[snowPosition[i][0]]) {
      stack[snowPosition[i][0]]++;
      if (stack[snowPosition[i][0]] > maxStack) {
        maxStack = stack[snowPosition[i][0]];
      }
      
      snowPosition[i][0] = (int)random(600);
      snowPosition[i][1] = 0;
    } 
    // Snow falls down
    else {
      snowPosition[i][1] += 1;
      
      // Animation of snow's fluttering
      int minRand = -1;
      int maxRand = 2;
      if (snowPosition[i][0] <= 0) {
        minRand = 0;
      } else if (snowPosition[i][0] == 599) {
        maxRand = 1;
      } else if (snowPosition[i][0] >= 600) {
        maxRand = 0;
      }
      snowPosition[i][0] += random(minRand, maxRand);
    }
    
    ellipse(snowPosition[i][0], snowPosition[i][1], 5, 5);
  }
}
