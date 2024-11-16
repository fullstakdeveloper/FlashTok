import g4p_controls.*;

ArrayList<Flashcard> cardList;

Flashcard selectedCard;
Flashcard futureCard;

int scroll_speed = 20;
int frames = 0;
Boolean scrollBoolean = false;

PFont f;


void setup() {
  createGUI();
  f = createFont("Arial", 16, true);
  cardList = new ArrayList<Flashcard>();

  size(600, 600);

  String ans1 = "Eric";
  String ans2 = "6";

  String q1 = "What is your name?";
  String q2 = "What is your height?";

  Flashcard f1 = new Flashcard(50, 50, q1, ans1);
  Flashcard f2 = new Flashcard(50, 650, q2, ans2);  
}

void draw() {

  if (frames <= 30 & frames != 0) {
    for (int i = 0; i < cardList.size(); i++) {cardList.get(i).y -= scroll_speed;}
  }

  if (frames > 30) {frames = 0; scrollBoolean = false;scroll_speed = 20;}

  background(0);
  for (int i = 0; i < cardList.size(); i++) {
  cardList.get(i).display();
  }

  if (scrollBoolean == true) {frames += 1;}
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == DOWN & scrollBoolean == false){
      for (int i = 0; i < cardList.size(); i++) {scrollBoolean = true;}
    }

    if (keyCode == UP & scrollBoolean == false) {
      for (int i = 0; i < cardList.size(); i++) {scrollBoolean = true; scroll_speed = -20;}
    }
  }

}
