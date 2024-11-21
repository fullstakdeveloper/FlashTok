class Flashcard {
    String question;
    String answer;
    int x, y;
    Boolean showAns = false;

    Flashcard(int coorX, int coorY, String q, String a){
        this.question  = q;
        this.answer = a;
        this.x = coorX;
        this.y = coorY;
    }

    void display(){
        fill(255);
        textFont(f, 16);
        rect(this.x, this.y, this.x + 450, this.y + 450, 30);

        fill(0);
        text(this.question, this.x + 100, this.y + 100, 300, 200);

        //show answer functionality
        if (showAns == true) {text(this.answer, this.x + 100, this.y + 150, 300, 200);}
            

    }
}
