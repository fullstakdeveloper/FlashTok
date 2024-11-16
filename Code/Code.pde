import g4p_controls.*;

ArrayList<Flashcard> cardList;

Flashcard selectedCard;
Flashcard futureCard;

int scroll_speed = 20;
int frames = 0;
Boolean scrollBoolean = false;

int cardIndex = 1;

PFont f;

void setup() {
  createGUI();
  f = createFont("Arial", 16, true);
  cardList = new ArrayList<Flashcard>();

  size(600, 600);

  for (int i = 0; i < 50; i++) {
    cardList.add(new Flashcard(50, 50 + 600 * i, "", ""));
  }
}

void draw() {
  if (scrollBoolean) {
    if (frames <= 30 && frames != 0) {
      for (Flashcard card : cardList) {
        card.y -= scroll_speed;
      }
    }

    if (frames > 30) {
      frames = 0;
      scrollBoolean = false;
      scroll_speed = 20;
    }
  }

  background(0);
  for (Flashcard card : cardList) {
    card.display();
  }

  if (scrollBoolean) {
    frames++;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN && !scrollBoolean) {
      scrollBoolean = true;
    }

    if (keyCode == UP && !scrollBoolean) {
      scrollBoolean = true;
      scroll_speed = -20;
      cardIndex++;
    }
  }
}
