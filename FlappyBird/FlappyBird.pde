int screenBreite = 800;
int screenHöhe = 600;
float geschwindigkeit = 4;
float luecke = 200;
int spitzenNummer = 2;
float startFlappyX = 100;
float startFlappyY = 100;
String playKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/play.png";
String homeKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/home.png";
float playKnopfX;
float playKnopfY;

boolean spielGestartet = false;


Hintergrund hintergrund;
Boden boden;
Spitze spitze[];
Flappy flappy;
Knopf playKnopf;
Knopf homeKnopf;


void setup() {
  //imageMode(CENTER);
  size(800, 600);
  
  // play Knopf:
  playKnopf = new Knopf(playKnopfPfad);
  playKnopfX = width / 2 - playKnopf.knopfBild.width / 2;
  playKnopfY = height / 2 - playKnopf.knopfBild.height / 2;
  playKnopf.setzePosition(playKnopfX, playKnopfY);
  playKnopf.setzeBildGroesse(playKnopf.knopfBild.width * 0.5,playKnopf.knopfBild.height * 0.5);
  
  
  homeKnopf = new Knopf(homeKnopfPfad);
  hintergrund = new Hintergrund();
  boden = new Boden();
  spitze = new Spitze[spitzenNummer];
  for (int i = 0; i < spitzenNummer; i++) {
    spitze[i] = new Spitze(i);
  }
  flappy = new Flappy();
  
}

void draw() {
  hintergrund.zeichne();
  spiel();
  
}

void spiel(){
  if (spielGestartet) {
    for (int i = 0; i < spitzenNummer; i++) {
      spitze[i].zeichne();
      spitze[i].bewege();
      if (spitze[i].kollision(flappy.flappyX, flappy.flappyY, flappy.flappyBreite, flappy.flappyHoehe)) {
        println("Aua");
      }
    }
    boden.bewege();
    flappy.bewege();
  }
  boden.zeichne();
  flappy.zeichne();

  if (!spielGestartet) {
    playKnopf.zeichne();
    if (playKnopf.angeklickt()) {
      println("starten...");
      spielGestartet = true;
    }
  }
}
