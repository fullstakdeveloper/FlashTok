import g4p_controls.*;

ArrayList<Flashcard> cardList;

// scrollmovement variable
int scroll_speed = 20;
int frames = 0;
Boolean scrollBoolean = false;

//to keep track of card and create new cards
int cardIndex = 0;

//font defintion
PFont f;

void setup() {
  createGUI();
  f = createFont("Arial", 16, true);
  cardList = new ArrayList<Flashcard>();
  
  size(600, 600);

}

void draw() {
  //moves the all the flashcard for those 30 frames
  if (frames <= 30 & frames != 0) {
    for (int i = 0; i < cardList.size(); i++) {cardList.get(i).y -= scroll_speed;}
  }

  //resetting the frames after the 30 interations
  if (frames > 30) {frames = 0; scrollBoolean = false; scroll_speed = 20;}

  background(0);
  
  //drawings the card
  for (int i = 0; i < cardList.size(); i++) {
    cardList.get(i).display();
  }

  //starts frame count when the object is scrolling
  if (scrollBoolean == true) {frames += 1;}

  //note that the draw runs at 30 times per second
}


void keyPressed() {
  if (key == CODED){
    
    //updating card index
    if (keyCode == DOWN & scrollBoolean == false & cardList.size() > 1){
      cardIndex += 1;

      //created a new card using the card index
      if (float(cardIndex) > (cardList.size()-1)) {
        Flashcard value = cardList.get(int(random(cardList.size()-1)));

        //renders it off screen until it get to it
        cardList.add(new Flashcard(50, 630, value.question, value.answer));
      }

      //for the moment of the flashcard down
      scrollBoolean = true;
    }

    //To move the flashcard down
    if (keyCode == UP & scrollBoolean == false & cardIndex != 0) {
      //updating card index
      scrollBoolean = true; scroll_speed = -20;cardIndex -=1;
    }
  }

}
