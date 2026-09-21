int screenBreite = 800;
int screenHöhe = 600;
float geschwindigkeit = 4;
float luecke = 150;
int spitzenNummer = 2;
float startFlappyX = 100;
float startFlappyY = 100;

boolean spielGestartet = false;


Hintergrund hintergrund;
Boden boden;
Spitze spitze[];
Flappy flappy;


void setup() {
  size(800, 600);
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

  flappy.zeichne();
  boden.zeichne();
}
