class Boden {

  String bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/background/layer_floor.jpg";

  PImage boden1;
  PImage boden2;

  float boden1X = 0;
  float boden1Y = 0;

  float boden2X = width;
  float boden2Y = 0;

  Boden() {
    boden1 =loadImage(bildPfad);
    boden2 =loadImage(bildPfad);
    boden1Y = height - 0.1 * height;
    boden2Y = height - 0.1 * height;
  }

  void zeichne() {
    image(boden1, boden1X, boden1Y, width, 0.1* height);
    image(boden2, boden2X, boden2Y, width, 0.1 *height);
  }

  void bewege() {
    boden1X -= geschwindigkeit;
    boden2X -= geschwindigkeit;

    if (boden1X <= -width) {
      boden1X = width + boden2X; // ?
    }

    if (boden2X <= -width) {
      boden2X = width + boden1X; // ?
    }
  }
  
 boolean kollision(float y, float hoehe) {
    if (y + hoehe > boden1Y + boden1.height || y + hoehe > boden2Y) {
      return true;
    } else {
      return false;
    }
  }
}
