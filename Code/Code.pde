ArrayList<Flashcard> cardList;

void setup() {
  cardList = new ArrayList<Flashcard>();

  size(600, 600);

  Flashcard f1 = new Flashcard(50, 50, "gay", "this");
  Flashcard f2 = new Flashcard(50, 700, "gay", "this");
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


