int screenBreite = 800;
int screenHöhe = 600;
float startFlappyX = 200;
float startFlappyY = 100;
int punktzahl = 0;
int leben;
float geschwindigkeit = 6;
float luecke = 200;
int spitzenNummer = 2;
int jetzigeSpitze;
int punktCounter;
float herzenFaktor = 0.2;
// Faktoren:
float playFaktor = 0.5;
float menueknopfFaktor = 0.35;
float gameOverFaktor = 0.3;
float highscoreFaktor = 0.5;
float punkteFaktor = 0.2;
float logoFaktor = 0.3;
// Bildpfade:
String playKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/play.png";
String homeKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/home.png";
String weiterKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/weiterspielen.png";
String neustartKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/neustart.png";
String gameOverPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/gameOver.png";
String erneutVersuchenKnopfPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/erneutVersuchen.png";
String flappyBirdPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/flappyBird.png";
String highscorePfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/highscore.png";
String pausePfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/pause.png";
String schließenPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/schließen.png";
// Knopfpositionen:
float playKnopfX;
float playKnopfY;
float schließenX = screenBreite - 50;
float schließenY = 10;
float homeKnopfX = 10;
float homeKnopfY = 10;
float pauseX;
float pauseY;
float weiterKnopfX;
float weiterKnopfY;
float neustartKnopfX;
float neustartKnopfY;
float erneutVersuchenKnopfX;
float erneutVersuchenKnopfY;
float stelle1X;
float stelle2X;
float punkteY = 20;
float stelle1XEnde;
float stelle2XEnde;
float punkteYEnde;
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
boolean erfolgreicherDurchflug = false;
boolean spielGestartet = false;
boolean neueSpitze = false;
boolean warSchonLinksVorbei = false;

Punkte punkte;
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
Knopf highscore;
Knopf pause;
Knopf schließen;
Herzen herzen;


void setup() {
  //imageMode(CENTER);
  size(800, 600);
  punktCounter = 0;
  leben = 3;
  /// KNÖPFE ///
  // Play-Knopf:
  playKnopf = new Knopf(playKnopfPfad, playFaktor);
  playKnopf.setzePosition(mitteX(playKnopf.bildBreite), drittelY(playKnopf.bildHoehe, 1.7));
  // Home-Knopf:
  homeKnopf = new Knopf(homeKnopfPfad, menueknopfFaktor);
  homeKnopf.setzePosition(homeKnopfX, homeKnopfY);
  // Weiterspielen-Knopf:
  weiterKnopf = new Knopf(weiterKnopfPfad, menueknopfFaktor);
  weiterKnopf.setzePosition(viertelX(weiterKnopf.bildBreite, 1.25), drittelY(weiterKnopf.bildHoehe, 1.7));
  // Neustart-knopf:
  neustartKnopf = new Knopf(neustartKnopfPfad, menueknopfFaktor);
  neustartKnopf.setzePosition(viertelX(neustartKnopf.bildBreite, 2.75), drittelY(neustartKnopf.bildHoehe, 1.7));
  // Erneut-versuchen-Knopf:
  erneutVersuchenKnopf = new Knopf(erneutVersuchenKnopfPfad, menueknopfFaktor);
  erneutVersuchenKnopf.setzePosition(mitteX(erneutVersuchenKnopf.bildBreite), viertelY(erneutVersuchenKnopf.bildHoehe, 2.6));
  // Schließen Knopf:
  schließen = new Knopf(schließenPfad, 0.08);
  schließen.setzePosition(schließenX, schließenY);

  /// GRAFIKEN ///
  // Herzen:
  herzen = new Herzen(herzenFaktor, leben);
  herzen.setzePosition(mitteX(herzen.bildBreite), 20);
  // Punkte
  punkte = new Punkte(punkteFaktor, punktzahl);
  // Positionen von Punkten während des Spiels
  stelle1X = viertelX(punkte.bildBreiteStelle1, 3.25);
  stelle2X = viertelX(punkte.bildBreiteStelle1, 3.5);
  // Positionen von Punkten nach dem Spiel
  stelle1XEnde = viertelX(punkte.bildBreiteStelle1, 2.85);
  stelle2XEnde = viertelX(punkte.bildBreiteStelle2, 2.85) + 50;
  punkteYEnde = viertelY(punkte.bildHoeheStelle2, 1.8);

  punkte.setzePositionStelle1(stelle1X, punkteY);
  punkte.setzePositionStelle2(stelle2X, punkteY);
  // Logo:
  flappyBird = new Knopf(flappyBirdPfad, logoFaktor);
  flappyBird.setzePosition(mitteX(flappyBird.bildBreite), drittelY(flappyBird.bildHoehe, 1));
  // GameOVer Schrift:
  gameOver = new Knopf(gameOverPfad, gameOverFaktor);
  gameOver.setzePosition(mitteX(gameOver.bildBreite), viertelY(gameOver.bildHoehe, 1));
  // Highscore Schrift:
  highscore = new Knopf(highscorePfad, highscoreFaktor);
  highscore.setzePosition(viertelX(highscore.bildBreite, 1.6), viertelY(highscore.bildHoehe, 1.8));
  // Pause Schrift:
  pause = new Knopf(pausePfad, 0.3);
  pause.setzePosition(mitteX(pause.bildBreite), drittelY(pause.bildHoehe, 1));

  hintergrund = new Hintergrund();
  boden = new Boden();
  flappy = new Flappy();

  spitze = new Spitze[spitzenNummer];
  for (int i = 0; i < spitzenNummer; i++) {
    spitze[i] = new Spitze(i);
  }
}

void draw() {
  spiel();
}

void spiel() {
  hintergrund.zeichne();

  spielStarten();

  boden();

  kontrolliereObVerloren();

  spielNichtGestartet();
}

void spielStarten() {
  if (spielGestartet) {
    schließen();
    punkte.zeichneStelle1();
    punkte.zeichneStelle2();
    flappy.zeichne();
    homeKnopf.zeichne();
    // Wenn man auf den HomeButton drückt kommt man auf einen Pause Bildschirm
    if (homeKnopf.angeklickt()) {
      spielGestartet = false;
    }
    herzen.zeichne();
    spitzen();
    boden.bewege();
    flappy.bewege();
  }
}

void boden() {
  boden.zeichne();
  // Wenn flappy auf den Boden trifft verliert er ein Leben
  if (boden.kollision(flappy.flappyY, flappy.flappyHoehe)) {
    if (!bodenGetroffen) {
      leben--;
      setzeHerzen(leben, herzenFaktor);
      bodenGetroffen = true;
    }
    // flappy kann nicht durch den Boden fallen
    flappy.flappyY= boden.boden1Y - flappy.flappyHoehe;
  } else {
    bodenGetroffen = false;
  }
}

void kontrolliereObVerloren() {
  // Wenn Flappy außerhalb des Bildschirms ist, oder keine Leben mehr hat, ist das Spiel verloren
  if (flappy.flappyX + flappy.flappyBreite < 0 || leben < 0) {
    spielGestartet = false;
    istGameOver = true;
  }
}

void spielNichtGestartet() {
  // Wenn das Spiel noch nicht gestartet ist befinden, wir uns auf dem Startbildschirm
  if (!spielGestartet) {
    // Nur beim ersten Start wird da Logo und der Play Button gezeigt
    if (istErsterStart) {
      schließen();
      flappyBird.zeichne();
      playKnopf.zeichne();
      if (playKnopf.angeklickt()) {
        spielGestartet = true;
        istErsterStart = false;
      }
      // Wenn GameOver ist werden die Punkte gezeigt und die Möglichkeit nochmal zu spielen
    } else if (istGameOver) {
      schließen();
      gameOver.zeichne();
      highscore.zeichne();
      // Punkte müssen neu positioniert werden, neben dem Highscore:
      punkte.setzePositionStelle1(stelle1XEnde, punkteYEnde);
      punkte.setzePositionStelle2(stelle2XEnde, punkteYEnde);
      punkte.zeichneStelle1();
      punkte.zeichneStelle2();
      erneutVersuchenKnopf.zeichne();
      if (erneutVersuchenKnopf.angeklickt()) {
        zuruecksetzen();
        spielGestartet = true;
        istGameOver = false;
      }
      // Dieser Fall trift ein, wenn man auf den HomeButton drückt, da das Spiel
      // nicht gestartet ist, aber auch nicht GameOver ist:
    } else {
      schließen();
      pause.zeichne();
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
    punkte.zeichneStelle1();
    punkte.zeichneStelle2();
    homeKnopf.zeichne();
    herzen.zeichne();

    // Überprüft Kollision (momentan nur eine Kollision pro Spitze möglich):
    if (spitze[i].kollision(flappy.flappyX, flappy.flappyY, flappy.flappyBreite, flappy.flappyHoehe)) {
      if (!habenKollidiert) {
        leben--;
        setzeHerzen(leben, herzenFaktor);
        habenKollidiert = true;
      }
      // sorgt dafür, dass Flappy links bei den SPitzen "abprallt":
      if (!spitze[i].binVorbeiLinks(flappy.flappyX + (flappy.flappyBreite / 2))) {
        flappy.flappyX = spitze[i].spitzeX - flappy.flappyBreite;
      }
    }
    // Sobald man an der jetzigen Spitze vorbei ist wird Kollision wieder zurückgesetzt
    if (spitze[i].binVorbeiRechts(flappy.flappyX)) {
      habenKollidiert = false;
    }

    // Kontrolliert ob man durch die Lücke geflogen ist
    if (spitze[i].binVorbeiRechts(flappy.flappyX)) { // Wenn man rechts vorbei ist bekommt man einen Punkt
      punktCounter++;
      if (punktCounter == 1) {
        punktzahl++;
        setzePunkte(punktzahl, 0.2);
      }
    }
    if (spitze[i].binVorbeiLinksGrenze(flappy.flappyX)) { 
      punktCounter = 0;
    }
  }
}

void setzeHerzen(int leben, float faktor) {
  herzen = new Herzen(faktor, leben);
  herzen.setzePosition(mitteX(herzen.bildBreite), 20);
}

void setzePunkte(int neuePunkte, float faktor) {
  punkte = new Punkte(faktor, neuePunkte);
  stelle1X = viertelX(punkte.bildBreiteStelle1, 3.25);
  stelle2X = viertelX(punkte.bildBreiteStelle1, 3.5);
  punkte.setzePositionStelle1(stelle1X, punkteY);
  punkte.setzePositionStelle2(stelle2X, punkteY);
}

void zuruecksetzen() {
  punktzahl = 0;
  flappy.flappyX = startFlappyX;
  flappy.flappyY = startFlappyY;
  boden = new Boden();
  for (int i = 0; i < spitzenNummer; i++) {
    spitze[i] = new Spitze(i);
  }
  leben = 3;
  setzeHerzen(leben, herzenFaktor);
  setzePunkte(punktzahl, 0.2);
}

void schließen() {
  schließen.zeichne();
  if (schließen.angeklickt()) {
    exit();
  }
}

float mitteX(float bildBreite) {
  return width / 2 - bildBreite / 2;
}

float viertelX(float bildBreite, float faktor) {
  return (faktor * width / 4) - bildBreite / 2;
}

float mitteY(float bildHoehe) {
  return height / 2 - bildHoehe / 2;
}

float drittelY(float bildHoehe, float faktor) {
  return (faktor * height / 3) - bildHoehe / 2;
}

float viertelY(float bildHoehe, float faktor) {
  return (faktor * height / 4)  - bildHoehe / 2;
}
