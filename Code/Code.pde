import g4p_controls.*;

ArrayList<Flashcard> cardHistory;
ArrayList<Flashcard> cardProbabilityList;

int timerVar;//timing variables
float timeLeft;
int currentTime;
int secondTime;
boolean timeBool = false;
boolean timeToggle = true;

// character limit for question field and answer field
int questionCharLimit = 300;
int answerCharLimit = 300;

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
  cardHistory = new ArrayList<Flashcard>();
  cardProbabilityList = new ArrayList<Flashcard>();
  timerSlider.setValue(36);
  
  size(600, 600);

}

void draw() {
  //moves the all the flashcard for those 30 frames
  if (frames <= 30 & frames != 0) {
    for (int i = 0; i < cardHistory.size(); i++) {cardHistory.get(i).y -= scroll_speed;}
  }

  //resetting the frames after the 30 interations
  if (frames > 30) {frames = 0; scrollBoolean = false; scroll_speed = 20;}

  background(0);
  
  //drawings the card
  for (int i = 0; i < cardHistory.size(); i++) {
    cardHistory.get(i).display();
  }

  //starts frame count when the object is scrolling
  if (scrollBoolean == true) {frames += 1;}

  //note that the draw runs at 30 times per second
  
  if (timeBool && timeToggle){
    secondTime = millis();
    
    timeLeft = timerVar - (secondTime - currentTime)/100;
    displayTime.setText("Time left: " + str(timeLeft));
    
    if (timeLeft == 0){
      timeBool = false;
      
      if (scrollBoolean == false & cardHistory.size() > 1){
        cardIndex += 1;
      
        timeBool = true;
        
        currentTime = millis();

      if (float(cardIndex) > (cardHistory.size()-1)) {
        Flashcard value = cardProbabilityList.get(int(random(0, cardProbabilityList.size())));
      
        cardHistory.add(new Flashcard(50, 650, value.question, value.answer));
      
    }
      scrollBoolean = true;
  }
    }

  }
}


void keyPressed() {
  if (key == CODED){
    
    //updating card index
    if (keyCode == DOWN & scrollBoolean == false & cardHistory.size() > 1){
      cardIndex += 1;

      //created a new card using the card index
      if (float(cardIndex) > (cardHistory.size()-1)) {
        Flashcard value = cardHistory.get(int(random(cardHistory.size()-1)));

        //renders it off screen until it get to it
        cardHistory.add(new Flashcard(50, 650, value.question, value.answer));
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
