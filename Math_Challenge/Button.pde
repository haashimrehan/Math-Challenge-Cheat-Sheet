class Button {
  PVector pos = new PVector();
  int _width = width/11;
  int _height = 70;
  String text;
  int num;
  int shade = 255;
  
  Button (PVector _pos, int _num) {
    pos = _pos;
    text = str(_num);
    num = _num;
  }

  Button (PVector _pos, String _num) {
    pos = _pos;
    text = _num;
  }

  void draw() {
    textAlign(CENTER, CENTER);
    textSize(25);
    strokeWeight(5);

    fill(shade);
    rect(pos.x+5, pos.y, _width, _height, 10);
    fill(0);
    text(text, pos.x + 5 + _width/2, pos.y + (_height/2));
  }

  boolean isOver() {
    if (mouseX < pos.x + _width && mouseX > pos.x && mouseY < pos.y + _height && mouseY > pos.y) {
      shade = 150;
      return true;
    }
    shade = 255;
    return false;
  }
}
