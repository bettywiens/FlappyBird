int screenBreite = 800;
int screenHöhe = 600;
float startFlappyX = 200;
float startFlappyY = 100;
int punkte = 0;
int leben;
float geschwindigkeit = 2;
float luecke = 200;
int spitzenNummer = 2;
int jetzigeSpitze;
float herzenFaktor = 0.2;
// Bildpfade:
String playKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/play.png";
String homeKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/home.png";
String weiterKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/weiterspielen.png";
String neustartKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/neustart.png";
String gameOverPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/gameOver.png";
String erneutVersuchenKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/erneutVersuchen.png";
String flappyBirdPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/flappyBird.png";
// Knopfpositionen:
float playKnopfX;
float playKnopfY;
float homeKnopfX;
float homeKnopfY;
float weiterKnopfX;
float weiterKnopfY;
float neustartKnopfX;
float neustartKnopfY;
float erneutVersuchenKnopfX;
float erneutVersuchenKnopfY;
// Grafikpositionen:
float flappyBirdX;
float flappyBirdY;
float gameOverX;
float gameOverY;
float herzenPositionX;
float herzenPositionY;
// Wahrheitswerte:
boolean istErsterStart = true;
boolean habenKollidiert = false;
boolean bodenGetroffen = false;
boolean istGameOver = false;
boolean erfolgreicherDurchflug = true;
boolean spielGestartet = false;
boolean neueSpitze = false;

Hintergrund hintergrund;
Boden boden;
Spitze spitze[];
Flappy flappy;
Knopf playKnopf;
Knopf homeKnopf;
Knopf weiterKnopf;
Knopf neustartKnopf;
Knopf erneutVersuchenKnopf;
Knopf gameOver;
Knopf flappyBird;
Herzen herzen;


void setup() {
  //imageMode(CENTER);
  size(800, 600);
  leben = 3;
  /// KNÖPFE ///
  // Play-Knopf:
  playKnopf = new Knopf(playKnopfPfad, 0.5);
  playKnopf.setzePosition(mitteX(playKnopf.bildBreite), 2 * drittelY(playKnopf.bildHoehe));
  // Home-Knopf:
  homeKnopf = new Knopf(homeKnopfPfad, 0.35);
  homeKnopf.setzePosition(20, 20);
  // Weiterspielen-Knopf:
  weiterKnopf = new Knopf(weiterKnopfPfad, 0.35);
  weiterKnopfX = width / 4 - weiterKnopf.bildBreite / 2;
  weiterKnopf.setzePosition(weiterKnopfX, mitteY(weiterKnopf.bildHoehe));
  // Neustart-knopf:
  neustartKnopf = new Knopf(neustartKnopfPfad, 0.35);
  neustartKnopfX = (width / 4) * 3 - neustartKnopf.bildBreite / 2;
  neustartKnopf.setzePosition(neustartKnopfX, mitteY(neustartKnopf.bildHoehe));
  // Erneut-versuchen-Knopf:
  erneutVersuchenKnopf = new Knopf(erneutVersuchenKnopfPfad, 0.35);
  erneutVersuchenKnopfY = 2 * (height / 3) - erneutVersuchenKnopf.bildHoehe;
  erneutVersuchenKnopf.setzePosition(mitteX(erneutVersuchenKnopf.bildBreite), erneutVersuchenKnopfY);
  // GameOVer Schrift:
  gameOver = new Knopf(gameOverPfad, 0.3);
  gameOver.setzePosition(mitteX(gameOver.bildBreite), drittelY(gameOver.bildHoehe));

  /// GRAFIKEN ///
  // Logo:
  flappyBird = new Knopf(flappyBirdPfad, 0.3);
  flappyBird.setzePosition(mitteX(flappyBird.bildBreite), drittelY(flappyBird.bildHoehe));
  // Herzen:
  herzen = new Herzen(herzenFaktor, leben);
  herzen.setzePosition(mitteX(herzen.bildBreite), 20);

  hintergrund = new Hintergrund();
  boden = new Boden();
  flappy = new Flappy();

  spitze = new Spitze[spitzenNummer];
  for (int i = 0; i < spitzenNummer; i++) {
    spitze[i] = new Spitze(i);
  }
}

void draw() {
  hintergrund.zeichne();
  spiel();
}

void spiel() {
  spielStarten();

  boden();

  kontrolliereObVerloren();

  spielNichtGestartet();
}

void spielStarten() {
  if (spielGestartet) {
    // Punkte Zeichnen
    flappy.zeichne();
    homeKnopf.zeichne();
    herzen.zeichne();
    if (homeKnopf.angeklickt()) {
      spielGestartet = false;
    }
    spitzen();
    boden.bewege();
    flappy.bewege();
  }
}

void boden() {
  boden.zeichne();
  if (boden.kollision(flappy.flappyY, flappy.flappyHoehe)) {
    if (!bodenGetroffen) {
      leben--;
      setzeHerzen(leben, herzenFaktor);
      bodenGetroffen = true;
    }
    flappy.flappyY= boden.boden1Y - flappy.flappyHoehe;
  } else {
    bodenGetroffen = false;
  }
}

void kontrolliereObVerloren() {
  if (flappy.flappyX + flappy.flappyBreite < 0 || leben < 0) { // Außerhalb des Bildschirms
    spielGestartet = false;
    istGameOver = true;
  }
}

void spielNichtGestartet() {
  if (!spielGestartet) {
    if (istErsterStart) { // Flappy-Bird wird erst beim ersten Start gezeichnet
      flappyBird.zeichne();
      playKnopf.zeichne();

      if (playKnopf.angeklickt()) {
        spielGestartet = true;
        istErsterStart = false;
      }
    } else if (istGameOver) {
      gameOver.zeichne();
      erneutVersuchenKnopf.zeichne();
      if (erneutVersuchenKnopf.angeklickt()) {
        zuruecksetzen();
        spielGestartet = true;
        istGameOver = false;
      }
    } else {
      weiterKnopf.zeichne();
      neustartKnopf.zeichne();
      if (weiterKnopf.angeklickt()) {
        spielGestartet = true;
      } else if (neustartKnopf.angeklickt()) {
        zuruecksetzen();
        spielGestartet = true;
      }
    }
  }
}

void spitzen() {
  for (int i = 0; i < spitzenNummer; i++) {
    spitze[i].zeichne();
    spitze[i].bewege();
    //println("flappyX = "+ flappy.flappyX);
    

    homeKnopf.zeichne();
    herzen.zeichne();

    if (spitze[i].kollision(flappy.flappyX, flappy.flappyY, flappy.flappyBreite, flappy.flappyHoehe)) {
      if (!habenKollidiert) {
        leben--;
        setzeHerzen(leben, herzenFaktor);
        habenKollidiert = true;
        erfolgreicherDurchflug = false;
      }
      if (!spitze[i].binVorbeiLinks(flappy.flappyX + (flappy.flappyBreite / 2))) {
        flappy.flappyX = spitze[i].spitzeX - flappy.flappyBreite;
      }
    }

    if ((spitze[i].spitzeX) == flappy.flappyX) {
      println("treffe rechts");
      println(spitze[i].spitzeX);
      if (erfolgreicherDurchflug) {
        punkte++;
        println(punkte);
      } else {
        erfolgreicherDurchflug = true;
      }
    }
    if (spitze[i].binVorbeiRechts(flappy.flappyX)){      
      habenKollidiert = false;
    }
  }
}

void setzeHerzen(int leben, float faktor) {
  herzen = new Herzen(faktor, leben);
  herzen.setzePosition(mitteX(herzen.bildBreite), 20);
}

void zuruecksetzen() {
  flappy.flappyX = startFlappyX;
  flappy.flappyY = startFlappyY;
  boden = new Boden();
  for (int i = 0; i < spitzenNummer; i++) {
    spitze[i] = new Spitze(i);
  }
  leben = 3;
  setzeHerzen(leben, herzenFaktor);
}

float mitteX(float bildBreite) {
  return width / 2 - bildBreite / 2;
}

float mitteY(float bildHoehe) {
  return height / 2 - bildHoehe / 2;
}

float drittelY(float bildHoehe) {
  return height / 3 - bildHoehe / 2;
}
