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
  //println("showAnswer - GButton >> GEvent." + event + " @ " + millis());
  
  //locates the chard using the card index and then show the answer.
  if (cardHistory.get(cardIndex).showAns == true) {cardHistory.get(cardIndex).showAns = false;}
  else {cardHistory.get(cardIndex).showAns = true;}
  
} //_CODE_:showAnswer:736547:

public void nextClick(GButton source, GEvent event) { //_CODE_:next:681460:
  if (scrollBoolean == false & cardHistory.size() > 1){
      cardIndex += 1;

    if (float(cardIndex) > (cardHistory.size()-1)) {
      Flashcard value = cardProbabilityList.get(int(random(cardProbabilityList.size()-1)));
      cardHistory.add(new Flashcard(50, 650, value.question, value.answer));
    }
    scrollBoolean = true;
  }
} //_CODE_:next:681460:

public void previousClick(GButton source, GEvent event) { //_CODE_:previous:422535:
  if (scrollBoolean == false & cardIndex != 0) {
    scrollBoolean = true; scroll_speed = -20;cardIndex -=1;
  }
} //_CODE_:previous:422535:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:965333:
  appc.background(230);
} //_CODE_:window1:965333:

public void questionFieldChange(GTextArea source, GEvent event) { //_CODE_:questionField:268747:

} //_CODE_:questionField:268747:

public void answerFieldChange(GTextArea source, GEvent event) { //_CODE_:answerField:296875:
  //println("answerField - GTextArea >> GEvent." + event + " @ " + millis());
} //_CODE_:answerField:296875:

public void submitClick(GButton source, GEvent event) { //_CODE_:submit:405464:
  //println("submit - GButton >> GEvent." + event + " @ " + millis());
   if (questionField.getText().length() > questionCharLimit) {
     charLimitIndicator.setText("Question Character Limit of " + questionCharLimit + " passed");
     return;
   }
   else if (answerField.getText().length() > answerCharLimit) {
     charLimitIndicator.setText("Answer Character Limit of " + answerCharLimit + " passed");
     return;
   }


  if (cardHistory.size() < 1) {
    Flashcard newFlashcard = new Flashcard(50, 50, questionField.getText(), answerField.getText());
    cardHistory.add(newFlashcard);
    cardProbabilityList.add(newFlashcard);
  
  }

  else {
    Flashcard newFlashcard = new Flashcard(50, 650, questionField.getText(), answerField.getText());

    cardHistory.add(newFlashcard);

    if (cardProbabilityList.contains(newFlashcard) != true) {cardProbabilityList.add(newFlashcard);}
    println(cardProbabilityList.contains(newFlashcard));
    println(cardProbabilityList);
    
    }

  
  answerField.setText("");
  questionField.setText("");
  
  
  
} //_CODE_:submit:405464:

public void charLimitChange(GTextField source, GEvent event) { //_CODE_:charLimitIndicator:410328:
  //println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:charLimitIndicator:410328:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  showAnswer = new GButton(this, 370, 560, 90, 30);
  showAnswer.setText("Show Answer");
  showAnswer.addEventHandler(this, "showAnswerClick");
  next = new GButton(this, 470, 560, 120, 30);
  next.setText("Next Flashcard");
  next.addEventHandler(this, "nextClick");
  previous = new GButton(this, 470, 10, 120, 30);
  previous.setText("Previous Flashcard");
  previous.addEventHandler(this, "previousClick");
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
  charLimitIndicator = new GTextField(window1, 310, 30, 270, 30, G4P.SCROLLBARS_NONE);
  charLimitIndicator.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  charLimitIndicator.setOpaque(true);
  charLimitIndicator.addEventHandler(this, "charLimitChange");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton showAnswer; 
GButton next; 
GButton previous; 
GWindow window1;
GTextArea questionField; 
GTextArea answerField; 
GLabel label1; 
GLabel label2; 
GButton submit; 
GTextField charLimitIndicator; 
