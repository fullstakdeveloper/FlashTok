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
        square(x, y, 100);
    }
}