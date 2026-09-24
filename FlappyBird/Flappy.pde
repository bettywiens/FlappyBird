class Flappy {

  String bildPfad[] = {
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-1.png",
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-2.png",
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-3.png",
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-4.png"
  };

  float size = 0.4f;
  float animationsZeit = 80f;
  float fallGeschwindigkeit = 0.4;
  float sprung = 1.5;

  PImage[] flappy;
  float flappyX;
  float flappyY;
  float flappyBreite;
  float flappyHoehe;
  int animation;
  float deltaZeit;
  float zeit;
  float diffZeit;
  float yGeschwindigkeit;


  Flappy() {
    animation = 0;
    zeit = 0;
    flappy = new PImage[bildPfad.length];
    for (int i = 0; i < bildPfad.length; i++) {
      flappy[i] = loadImage(bildPfad[i]);
    }
    yGeschwindigkeit = 0;
    flappyX = startFlappyX;
    flappyY = startFlappyY;
  }

  void zeichne() {
    flappyBreite = flappy[0].width * width / hintergrund.hintergrund.width *  size;
    flappyHoehe = flappy[0].height * height / hintergrund.hintergrund.height * size;
    image(flappy[animation], flappyX, flappyY, flappyBreite, flappyHoehe);
  }

  void bewege() {
    yGeschwindigkeit += fallGeschwindigkeit;
    flappyY += yGeschwindigkeit;

    deltaZeit = millis();
    diffZeit = deltaZeit - zeit; 

    if (diffZeit >= animationsZeit) {
      animation++;
      zeit += diffZeit;
      if (animation >= bildPfad.length) {
        animation = 0;
      }
    }

    if (keyPressed) {
      if (key == ' ') {
        yGeschwindigkeit -= sprung;
      }
    }
  }
}
