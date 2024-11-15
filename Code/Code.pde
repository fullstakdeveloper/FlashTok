import g4p_controls.*;

ArrayList<Flashcard> cardList;

Flashcard selectedCard;
Flashcard futureCard;

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
  Flashcard f2 = new Flashcard(50, 700, q2, ans2);  
}

void draw() {
  background(0);
  for (int i = 0; i < cardList.size(); i++) {
  cardList.get(i).display();
  }
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == UP){
      for (int i = 0; i < cardList.size(); i++) {cardList.get(i).y += 50;}
    }

    if (keyCode == DOWN) {
      for (int i = 0; i < cardList.size(); i++) {cardList.get(i).y -= 50;}
    }
  }

}
