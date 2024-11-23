/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void showAnswerClick(GButton source, GEvent event) { //_CODE_:showAnswer:736547:
  if (cardHistory.get(cardIndex).showAns == true) {cardHistory.get(cardIndex).showAns = false;} // if has been clicked before, hide answer
  else {cardHistory.get(cardIndex).showAns = true;}
} //_CODE_:showAnswer:736547:

public void nextClick(GButton source, GEvent event) { //_CODE_:next:681460:
  if (scrollBoolean == false && cardProbabilityList.size() > 0){
      cardIndex += 1;
      
      timeBool = true;
      
      currentTime = millis();

    if (float(cardIndex) > (cardHistory.size()-1)) {
      Flashcard value = cardProbabilityList.get(int(random(0, cardProbabilityList.size())));
      
      cardHistory.add(new Flashcard(50, 650, value.question, value.answer));
      
    scrollBoolean = true;
  }

  cardHistory.get(cardIndex-1).showAns = false;
  cardHistory.get(cardIndex-1).hardEasy = false;
  }
} //_CODE_:next:681460:

public void previousClick(GButton source, GEvent event) { //_CODE_:previous:422535:
  if (scrollBoolean == false & cardIndex != 0) {
    scrollBoolean = true; scroll_speed = -20;cardIndex -=1;
  }

  currentTime = millis();

  cardHistory.get(cardIndex+1).showAns = false;
  cardHistory.get(cardIndex+1).hardEasy = false;
} //_CODE_:previous:422535:

public void easyButtonClick(GButton source, GEvent event) { //_CODE_:easyButton:287005:
  if (cardHistory.get(cardIndex).hardEasy != true){ // if hard/easy hasnt been clicked before, 
    int values = 0; //set values to 0 so we can make sure it only removes one
    for (int i = 0; i < cardProbabilityList.size(); i++) {  //for every card
        if (cardHistory.get(cardIndex).question == cardProbabilityList.get(i).question) { //check if its the card we are on
          if (values > 0) {cardProbabilityList.remove(i); break;} // removes one card
            values += 1; // makes it so it doesnt repeat
      }
    }
  }
} //_CODE_:easyButton:287005:

public void hardButtonClick(GButton source, GEvent event) { //_CODE_:hardButton:837404:
  if (cardHistory.get(cardIndex).hardEasy != true) { //make sure it hard/easy hasnt been clicked before
    cardProbabilityList.add(cardHistory.get(cardIndex)); // card probability list adds one
  }
  cardHistory.get(cardIndex).hardEasy = true; //sets hard easy to true so it doesnt get clicked again
} //_CODE_:hardButton:837404:

public void deleteCardChange(GButton source, GEvent event) { //_CODE_:deleteCard:362801:
  for (int i = 0; i < cardProbabilityList.size(); i++) {
    Flashcard value1 = cardHistory.get(cardIndex);
    Flashcard value2 = cardProbabilityList.get(i);
    if (value1.question == value2.question) {
      cardProbabilityList.remove(i);
    }
  }
} //_CODE_:deleteCard:362801:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:965333:
  appc.background(230);
} //_CODE_:window1:965333:

public void questionFieldChange(GTextArea source, GEvent event) { //_CODE_:questionField:268747:
  //println("questionField - GTextArea >> GEvent." + event + " @ " + millis());
} //_CODE_:questionField:268747:

public void answerFieldChange(GTextArea source, GEvent event) { //_CODE_:answerField:296875:
  //println("answerField - GTextArea >> GEvent." + event + " @ " + millis());
} //_CODE_:answerField:296875:

public void submitClick(GButton source, GEvent event) { //_CODE_:submit:405464:
  if (questionField.getText().length() > questionCharLimit) { //if over char limit for both question display error message
    charLimitIndicator.setText("Question Character Limit of " + questionCharLimit + " passed");
    return;
  }
  else if (answerField.getText().length() > answerCharLimit) { //same for answer
    charLimitIndicator.setText("Answer Character Limit of " + answerCharLimit + " passed");
    return;
  }


  if (cardHistory.size() < 1) { //if no cards
    Flashcard newFlashcard = new Flashcard(50, 50, questionField.getText(), answerField.getText()); //makes first flashcard
    cardHistory.add(newFlashcard); // adds flashcard to card history list
    cardProbabilityList.add(newFlashcard); //adds to probability list
    timeBool = true; // starts timer
    currentTime = millis();
  
  }

  else {
    Flashcard newFlashcard = new Flashcard(50, 650, questionField.getText(), answerField.getText()); //else drwas flashcard below the current one

    //dont touch this code please
    if (cardProbabilityList.contains(newFlashcard) != true) {cardProbabilityList.add(newFlashcard);} //if the probability list does not contain it, add to probability list
    
    }

  
  answerField.setText(""); //set fields to nothing
  questionField.setText("");
  charLimitIndicator.setText("");
} //_CODE_:submit:405464:

public void timerSliderChange(GCustomSlider source, GEvent event) { //_CODE_:timerSlider:376555:
  timerVar = timerSlider.getValueI() + 1; //adds one to the value of timer slider since it takes one second to scroll down
  currentTime = millis(); //restarts timer
  timerValue.setText("Timer set to: " + str(timerVar - 1) + " seconds"); 
} //_CODE_:timerSlider:376555:

public void timerToggleClick(GCheckbox source, GEvent event) { //_CODE_:timerToggle:833309:
  if (timerToggle.isSelected()){ //if selected, start timer
    timeToggle = true;
  }
  
  else{
    timeToggle = false; //else false
  }
  
  currentTime = millis(); //start timer
} //_CODE_:timerToggle:833309:

public void blueSliderChange(GCustomSlider source, GEvent event) { //_CODE_:blueSlider:500756:
  blueRGB = blueSlider.getValueI();
} //_CODE_:blueSlider:500756:

public void greenSliderChange(GCustomSlider source, GEvent event) { //_CODE_:greenSlider:521711:
  greenRGB = greenSlider.getValueI();
} //_CODE_:greenSlider:521711:

public void redSliderChange(GCustomSlider source, GEvent event) { //_CODE_:redSlider:844552:
  redRGB = redSlider.getValueI();
} //_CODE_:redSlider:844552:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  showAnswer = new GButton(this, 360, 560, 100, 30);
  showAnswer.setText("Show Answer");
  showAnswer.addEventHandler(this, "showAnswerClick");
  next = new GButton(this, 470, 560, 120, 30);
  next.setText("Next Flashcard");
  next.addEventHandler(this, "nextClick");
  previous = new GButton(this, 470, 10, 120, 30);
  previous.setText("Previous Flashcard");
  previous.addEventHandler(this, "previousClick");
  easyButton = new GButton(this, 10, 560, 100, 30);
  easyButton.setText("Easy");
  easyButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  easyButton.addEventHandler(this, "easyButtonClick");
  hardButton = new GButton(this, 120, 560, 110, 30);
  hardButton.setText("Hard");
  hardButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  hardButton.addEventHandler(this, "hardButtonClick");
  deleteCard = new GButton(this, 240, 560, 110, 30);
  deleteCard.setText("Remove Card");
  deleteCard.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  deleteCard.addEventHandler(this, "deleteCardChange");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 600, 400, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  questionField = new GTextArea(window1, 10, 30, 280, 80, G4P.SCROLLBARS_VERTICAL_ONLY);
  questionField.setOpaque(true);
  questionField.addEventHandler(this, "questionFieldChange");
  answerField = new GTextArea(window1, 10, 140, 280, 80, G4P.SCROLLBARS_VERTICAL_ONLY);
  answerField.setOpaque(true);
  answerField.addEventHandler(this, "answerFieldChange");
  label1 = new GLabel(window1, 110, 120, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Answer");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 110, 10, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Question");
  label2.setOpaque(false);
  submit = new GButton(window1, 110, 240, 80, 30);
  submit.setText("Submit");
  submit.addEventHandler(this, "submitClick");
  timerSlider = new GCustomSlider(window1, 310, 80, 270, 40, "grey_blue");
  timerSlider.setLimits(30, 1, 60);
  timerSlider.setNbrTicks(6);
  timerSlider.setStickToTicks(true);
  timerSlider.setEasing(3.0);
  timerSlider.setNumberFormat(G4P.INTEGER, 0);
  timerSlider.setOpaque(false);
  timerSlider.addEventHandler(this, "timerSliderChange");
  timerToggle = new GCheckbox(window1, 460, 130, 120, 20);
  timerToggle.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  timerToggle.setText("Timer Toggle");
  timerToggle.setOpaque(false);
  timerToggle.addEventHandler(this, "timerToggleClick");
  timerToggle.setSelected(true);
  blueSlider = new GCustomSlider(window1, 310, 330, 270, 40, "grey_blue");
  blueSlider.setLimits(0, 0, 255);
  blueSlider.setNumberFormat(G4P.INTEGER, 0);
  blueSlider.setOpaque(false);
  blueSlider.addEventHandler(this, "blueSliderChange");
  greenSlider = new GCustomSlider(window1, 310, 280, 270, 40, "grey_blue");
  greenSlider.setLimits(0, 0, 255);
  greenSlider.setEasing(2.0);
  greenSlider.setNumberFormat(G4P.INTEGER, 0);
  greenSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  greenSlider.setOpaque(false);
  greenSlider.addEventHandler(this, "greenSliderChange");
  redSlider = new GCustomSlider(window1, 310, 230, 270, 40, "grey_blue");
  redSlider.setLimits(0, 0, 255);
  redSlider.setNumberFormat(G4P.INTEGER, 0);
  redSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  redSlider.setOpaque(false);
  redSlider.addEventHandler(this, "redSliderChange");
  redLabel = new GLabel(window1, 250, 240, 80, 20);
  redLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redLabel.setText("Red");
  redLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  redLabel.setOpaque(false);
  greenLabel = new GLabel(window1, 250, 290, 80, 20);
  greenLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  greenLabel.setText("Green");
  greenLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  greenLabel.setOpaque(false);
  blueLabel = new GLabel(window1, 250, 340, 80, 20);
  blueLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueLabel.setText("Blue");
  blueLabel.setOpaque(false);
  charLimitIndicator = new GLabel(window1, 310, 30, 270, 30);
  charLimitIndicator.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  charLimitIndicator.setLocalColorScheme(GCScheme.RED_SCHEME);
  charLimitIndicator.setOpaque(false);
  displayTime = new GLabel(window1, 310, 170, 120, 30);
  displayTime.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  displayTime.setOpaque(false);
  rgbIndicator = new GLabel(window1, 460, 170, 120, 30);
  rgbIndicator.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  rgbIndicator.setOpaque(false);
  timerValue = new GLabel(window1, 310, 130, 140, 20);
  timerValue.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  timerValue.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton showAnswer; 
GButton next; 
GButton previous; 
GButton easyButton; 
GButton hardButton; 
GButton deleteCard; 
GWindow window1;
GTextArea questionField; 
GTextArea answerField; 
GLabel label1; 
GLabel label2; 
GButton submit; 
GCustomSlider timerSlider; 
GCheckbox timerToggle; 
GCustomSlider blueSlider; 
GCustomSlider greenSlider; 
GCustomSlider redSlider; 
GLabel redLabel; 
GLabel greenLabel; 
GLabel blueLabel; 
GLabel charLimitIndicator; 
GLabel displayTime; 
GLabel rgbIndicator; 
GLabel timerValue; 
