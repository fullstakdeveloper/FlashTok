class Flashcard {
    String question; // The question displayed on the flashcard
    String answer;   // The answer associated with the flashcard
    int x, y;        // Coordinates for the position of the flashcard
    Boolean showAns = false; // Flag to toggle displaying the answer
    Boolean hardEasy = false; // Placeholder flag for difficulty (not used in logic)

    // Constructor to initialize a flashcard with position and text
    Flashcard(int coorX, int coorY, String q, String a) {
        this.question = q; // Set the question text
        this.answer = a;   // Set the answer text
        this.x = coorX;    // Set the x-coordinate
        this.y = coorY;    // Set the y-coordinate
    }

    // Method to display the flashcard
    void display() {
        fill(255); // Set fill color to white for the card background
        textFont(f, 16); // Use the specified font for text
        rect(this.x, this.y, this.x + 450, this.y + 450, 30); // Draw the flashcard with rounded corners

        fill(0); // Set text color to black
        text(this.question, this.x + 100, this.y + 100, 300, 200); // Display the question text

        // Display the answer text if the showAns flag is true
        if (showAns) {
            text(this.answer, this.x + 100, this.y + 250, 300, 200);
        }
    }
}
