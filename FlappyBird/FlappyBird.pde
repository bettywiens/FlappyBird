int screenBreite = 800;
int screenHöhe = 600;
float geschwindigkeit = 2;
float luecke = 150;
int spitzenNummer = 3;


Hintergrund hintergrund;
Boden boden;
Spitze spitze[];
Flappy flappy;


void setup(){
  size(800,600);
  hintergrund = new Hintergrund();
  boden = new Boden();
  spitze = new Spitze[spitzenNummer];
  for (int i = 0; i < spitzenNummer; i++){
    spitze[i] = new Spitze(i);
  }
  flappy = new Flappy();
}

void draw(){
  hintergrund.zeichne();
  for (int i = 0; i < spitzenNummer; i++){
    spitze[i].zeichne();
    spitze[i].bewege();
  }
  boden.zeichne();
  boden.bewege();
  flappy.zeichne();
}
