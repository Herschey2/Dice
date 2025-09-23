Die[] dice;
int dSize =50;
int avg;
int sum;
int sumsum;
int counter;
void setup(){
      noLoop();
      size(500,500);
      int cols = width / dSize;
      int rows = (height-100) / dSize;
      dice = new Die[cols * rows];
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          int x = i * dSize;
          int y = j * dSize;
          dice[i + j * cols] = new Die(x, y);
        }
      }
}
void draw(){
      background(0,0,0);
      for (int i = 0; i < dice.length; i++) {
        dice[i].roll();
        dice[i].show();
      }
      counter++;
      sumsum+=sum;
      int(avg=sumsum/counter);
      fill(255);
      textSize(24);
      text("sum = " +sum, width/2+100, height-50);
      sum=0;
      text("avg of " +counter+" rolls = " +avg, width/2-200, height-50);
}
void mousePressed(){
      redraw();
}
void keyPressed() {
    if (key == 'r') {
      sumsum = 0;
      counter = 0;
      redraw();
    }
    if (key == ' ') {
      redraw();
    }
    if (key == '+') {
      dSize++;
      int cols = width / dSize;
      int rows = (height-100) / dSize;
      dice = new Die[cols * rows];
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          int x = i * dSize;
          int y = j * dSize;
          dice[i + j * cols] = new Die(x, y);
        }
      }
      sumsum = 0;
      counter = 0;
      redraw();
    }
    if (key == '-') {
      dSize--;
      int cols = width / dSize;
      int rows = (height-100) / dSize;
      dice = new Die[cols * rows];
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          int x = i * dSize;
          int y = j * dSize;
          dice[i + j * cols] = new Die(x, y);
        }
      }
      sumsum = 0;
      counter = 0;
      redraw();
    }
}
class Die{
      int rolls;
      int dieX=0;
      int dieY=0;
      Die(int x, int y)
      {
         dieX=x;
         dieY=y;
      }
      void roll()
      {
        rolls=(int)(Math.random()*6+1);
        sum+=rolls;
      }
      void show()
      {
          rect(dieX,dieY,dSize,dSize);
          fill(0);
          if (rolls == 1 || rolls == 3 || rolls == 5) {
            ellipse(dieX + dSize / 2, dieY + dSize / 2, dSize/5, dSize/5);
          }
          if (rolls != 1) {
            ellipse(dieX + dSize * 0.75, dieY + dSize * 0.25, dSize/5, dSize/5);
            ellipse(dieX + dSize * 0.25, dieY + dSize * 0.75, dSize/5, dSize/5);
          }
          if (rolls >= 4) {
            ellipse(dieX + dSize * 0.25, dieY + dSize * 0.25, dSize/5, dSize/5);
            ellipse(dieX + dSize * 0.75, dieY + dSize * 0.75, dSize/5, dSize/5);
          }
          if (rolls == 6) {
            ellipse(dieX + dSize * 0.25, dieY + dSize * 0.5, dSize/5, dSize/5);
            ellipse(dieX + dSize * 0.75, dieY + dSize * 0.5, dSize/5, dSize/5);
          }
          fill(255);
      }
}
