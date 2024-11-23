// Import the G4P GUI library
import g4p_controls.*;

// Lists to manage flashcard history and probability 
ArrayList<Flashcard> cardHistory;
ArrayList<Flashcard> cardProbabilityList;

// Timer variables for controlling countdown functionality
int timerVar;
float timeLeft;
int currentTime;
int secondTime;
int answerDelay = 5;
int scrollDelay = 1;

// Toggles to start/stop and enable/disable the timer
boolean timeBool = false;
boolean timeToggle = true;

// Maximum character limits for text in flashcard input boxes
int questionCharLimit = 300;
int answerCharLimit = 300;

// Variables for scroll speed and animation frames
int scroll_speed = 20;
int frames = 0;
boolean scrollBoolean = false; // Tracks if scrolling is active

// Index to track the current flashcard
int cardIndex = 0;

// Font used to display text
PFont f;

//RGB variables
int redRGB;
int greenRGB;
int blueRGB;

void setup() {
  // Set up GUI components
  createGUI();
  
  // Load Arial font for text rendering
  f = createFont("Arial", 16, true);

  // Initialize flashcard lists
  cardHistory = new ArrayList<>();
  cardProbabilityList = new ArrayList<>();

  // Set initial slider value for the timer
  timerSlider.setValue(36);

  // Set the application window size
  size(600, 600);
}

void draw() {
  // Handle scrolling of flashcards in the history
  if (frames <= 30 && frames != 0) {
    for (Flashcard card : cardHistory) {
      card.y -= scroll_speed; // Move flashcards up
    }
  }

  // Reset scrolling parameters after 30 frames
  if (frames > 30) {
    frames = 0;
    scrollBoolean = false;
    scroll_speed = 20;
  }

  // Set background color to black
  background(redRGB, greenRGB, blueRGB);

  // Display all flashcards in the history
  for (Flashcard card : cardHistory) {
    card.display();
  }

  // Increment frame count while scrolling is active
  if (scrollBoolean) {
    frames++;
  }

  // Timer logic to update time left and manage flashcard display
  if (timeBool && timeToggle) {
    secondTime = millis(); // Get the current system time
    timeLeft = timerVar - (secondTime - currentTime) / 1000; // Calculate time left
    
    if (timeLeft - 6 <= 0) {
      displayTime.setText("Time left: 0");
    }
    
    else {
      displayTime.setText("Time left: " + str(timeLeft - answerDelay - scrollDelay)); // Update the timer text
    }
    
    println(timeLeft);
    if (timeLeft == answerDelay) {
        cardHistory.get(cardIndex).showAns = true;
    }

    // Handle timer expiration
    
    if (timeLeft == 0) {
      timeBool = false;   // Stop the timer
      // Add a new flashcard if scrolling is inactive and history is not empty
      if (!scrollBoolean && !cardHistory.isEmpty()) {
        cardIndex++;
        timeBool = true; // Restart the timer
        currentTime = millis(); // Reset the current time

        // Add a random flashcard from the probability list if at the end
        if (cardIndex > cardHistory.size() - 1) {
          Flashcard value = cardProbabilityList.get(int(random(cardProbabilityList.size())));
          cardHistory.add(new Flashcard(50, 650, value.question, value.answer));
        }
        scrollBoolean = true; // Enable scrolling
      }
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    // Move to the next flashcard
    if (keyCode == DOWN && !scrollBoolean && cardHistory.size() > 1) {
      cardIndex++; // Increment flashcard index
      currentTime = millis(); // Reset the current time

      // Add a random flashcard if at the end of history
      if (cardIndex > cardHistory.size() - 1) {
        Flashcard value = cardHistory.get(int(random(cardHistory.size() - 1)));
        cardHistory.add(new Flashcard(50, 650, value.question, value.answer));
      }
      scrollBoolean = true; // Enable scrolling
    }

    // Move to the previous flashcard
    if (keyCode == UP && !scrollBoolean && cardIndex != 0) {
      currentTime = millis(); // Reset the current time
      scrollBoolean = true; // Enable scrolling
      scroll_speed = -20; // Set scroll direction to upward
      cardIndex--; // Decrement flashcard index
    }
  }
}
