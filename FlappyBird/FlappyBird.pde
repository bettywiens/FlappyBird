int screenBreite = 800;
int screenHöhe = 600;
float geschwindigkeit = 4;
float luecke = 200;
int spitzenNummer = 2;
float startFlappyX = 100;
float startFlappyY = 100;
String playKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/play.png";
float playKnopfX = width / 2 + 0.3 * width;
float playKnopfY = height / 2 + 0.6 * height;

boolean spielGestartet = false;


Hintergrund hintergrund;
Boden boden;
Spitze spitze[];
Flappy flappy;
Knopf knopf;


void setup() {
  size(800, 600);
  hintergrund = new Hintergrund();
  boden = new Boden();
  spitze = new Spitze[spitzenNummer];
  for (int i = 0; i < spitzenNummer; i++) {
    spitze[i] = new Spitze(i);
  }
  flappy = new Flappy();
  knopf = new Knopf(playKnopfPfad);
  knopf.setzePosition(playKnopfX, playKnopfY);
}

void draw() {
  hintergrund.zeichne();
  
  if (spielGestartet) {
    for (int i = 0; i < spitzenNummer; i++) {
      spitze[i].zeichne();
      spitze[i].bewege();
      if (spitze[i].kollision(flappy.flappyX, flappy.flappyY, flappy.flappyBreite, flappy.flappyHoehe)) {
        //println("Aua");
      }
    }
    boden.bewege();
    flappy.bewege();
  }
  boden.zeichne();
  flappy.zeichne();

  if (!spielGestartet) {
    knopf.zeichne();
    if (knopf.angeklickt()) {
      println("starten...");
      spielGestartet = true;
    }
  }
}
