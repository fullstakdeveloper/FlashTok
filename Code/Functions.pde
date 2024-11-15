class Flashcard {
    String question;
    String answer;
    int x, y;

    Flashcard(int coorX, int coorY, String q, String a){
        this.question  = q;
        this.answer = a;
        this.x = coorX;
        this.y = coorY;
        cardList.add(this);
    }

    void display(){
        textFont(f, 16);
        square(x, y, 500);
        text(this.question, 100, 100);

    }
}