PVector nums = new PVector();

Button[] buttons = new Button[11];
Button next;

boolean nextQuestion = false;
boolean answered = false;
boolean correct = false;

void setup() {
  size(1000, 600);

  nums.x = (int)random(0, 6);
  nums.y = (int)random(0, 6);

  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(new PVector(i*(width/11), 400), i);
  }
  next = new Button(new PVector(width/4*3, 100), "Next");
}

void questionDraw() {
  fill(255);

  if (nextQuestion) {  
    nums.x = (int)random(0, 6);
    nums.y = (int)random(0, 6);
  }
  nextQuestion = false;

  text(str(nums.x).substring(0, 1) + " + " + str(nums.y).substring(0, 1) + " = ?", 100, 100);
}

void mousePressed() {
  if (next.isOver()) {
    nextQuestion = true;
    answered = false;
  }

  if (!answered) {
    for (int i =0; i < buttons.length; i++) {
      if  (buttons[i].isOver()) {
        int answer = (int)nums.x + (int)nums.y;
        if (answer == buttons[i].num) {
          println("correct");
          correct = true;
        } else {
          correct = false;
          println("Incorrect");
        }
        answered = true;
        break;
      }
    }
  } else {
  }
}

void draw() {
  background(0);
  questionDraw();
  for (int i =0; i < buttons.length; i++) {
    fill(255);
    buttons[i].draw();
    buttons[i].isOver();
  }
  next.draw();
  next.isOver();
  fill(255);

  if (answered) {
    if (correct) {
      text("Correct!", width/2, height/2 -10);
  } else {
      text("Incorrect!", width/2, height/2 -10);
    }
          text("Press next to continue", width/2, height/2+20);
  }
}
