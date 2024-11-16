import g4p_controls.*;

ArrayList<Flashcard> cardList;

int scroll_speed = 20;
int frames = 0;
Boolean scrollBoolean = false;

int cardIndex = 0;

PFont f;


void setup() {
  createGUI();
  f = createFont("Arial", 16, true);
  cardList = new ArrayList<Flashcard>();
  
  size(600, 600);

  // String ans1 = "Eric";
  // String ans2 = "6";
  // String ans3 = "5";

  // String q1 = "What is your name?";
  // String q2 = "What is your height?";
  // String q3 = "What is your favorite number?";

  // Flashcard f1 = new Flashcard(50, 50, q1, ans1);
  // Flashcard f2 = new Flashcard(50, 650, q2, ans2);
  // Flashcard f3 = new Flashcard(50, 1250, q3, ans3); 

  for (int n = 0; n < 10; n++) {
    cardList.add(new Flashcard(50, 50 + 600*n, "1", "1"));
  }

  println(cardList.size());


}

void draw() {

  if (frames <= 30 & frames != 0) {
    for (int i = 0; i < cardList.size(); i++) {cardList.get(i).y -= scroll_speed;}
  }

  if (frames > 30) {frames = 0; scrollBoolean = false; scroll_speed = 20;}

  background(0);
  for (int i = 0; i < cardList.size(); i++) {
    cardList.get(i).display();
  }

  if (scrollBoolean == true) {frames += 1;}
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == DOWN & scrollBoolean == false){
      scrollBoolean = true;

      if (float(cardIndex + 1) > (cardList.size()-1)) {
        cardList.add(cardList.get(int(random(cardList.size()-1))));
        println("wow", cardIndex);
        }
      
      cardIndex += 1;


      
    }

    if (keyCode == UP & scrollBoolean == false) {
      scrollBoolean = true; scroll_speed = -20;cardIndex -=1;
    }
  }

}
