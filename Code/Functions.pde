class Flashcard {
    String question;
    String answer;
    int x, y;

    Flashcard(int coorX, int coorY, String q, String a){
        this.question  = q;
        this.answer = a;
        this.x = coorX;
        this.y = coorY;
    }

    void display(){
        fill(255);
        textFont(f, 16);
        square(this.x, this.y, 500);

        fill(0);
        text(this.question, this.x + 100, this.y + 100);
        text(this.answer, this.x + 100, this.y + 150);

        //Answer button
        rect(this.x + 200, this.y + 200, 120, 50);

        fill(255);
        text("Display Answer", this.x + 200, this.y + 230);
    }
}
