class Spitze {
  String bildPfadOben = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/spikes/spike.png";
  String bildPfadUnten = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/spikes/spike_f.png";

  PImage spitzeOben;
  PImage spitzeUnten;
  float spitzeBreite;
  float spitzeHoehe;
  float spitzeX;
  float spitzeY;

  Spitze(int nummer) {
    spitzeOben = loadImage(bildPfadOben);
    spitzeUnten = loadImage(bildPfadUnten);
    spitzeX = (width / spitzenNummer * (nummer + 1));
    randomYHoehe(); // ?
  }

  void zeichne() {
    spitzeBreite = spitzeUnten.width * width / hintergrund.hintergrund.width; // ?
    spitzeHoehe = spitzeUnten.height *  height / hintergrund.hintergrund.height; // ?
    image(spitzeOben, spitzeX, spitzeY + luecke/2, spitzeBreite, spitzeHoehe);
    image(spitzeUnten, spitzeX, spitzeY - spitzeHoehe - luecke/2, spitzeBreite, spitzeHoehe);
  }

  void bewege() {
    spitzeX -= geschwindigkeit;

    if (spitzeX <= 0 - spitzeBreite) {
      spitzeX = width;
      randomYHoehe();
    }
  }

  void randomYHoehe() {
    spitzeY = random(height / 7, height / 10 * 6);
  }

  boolean kollision(float x, float y, float breite, float hoehe) {

    // obere Spitze
    if (x < spitzeX + spitzeBreite &&
      x + breite > spitzeX &&
      y < spitzeY - luecke/2 &&
      y + hoehe > spitzeY - luecke/2 - spitzeHoehe) {
      
      return true;
      // untere Spitze
    } else if (x < spitzeX + spitzeBreite && // ?
      x + breite > spitzeX &&
      y < spitzeY + luecke/2 + spitzeHoehe &&
      y + hoehe > spitzeY + luecke/2) {
      
      return true;
    } else {
      return false;
    }
  }

  boolean binVorbeiRechts(float x) {
    if (x > spitzeX + spitzeBreite) {
      //println("bin vorbei rechts");
      return true;
    } else {
      return false;
    }
  }
  
    boolean treffeRechts(float x) {
    if (x == spitzeX + spitzeBreite) {
      println("treffe rechts");
      return true;
    } else {
      return false;
    }
  }

  boolean binVorbeiLinks(float x) {
    if (x > spitzeX) {
      //println("Bin vorbei links");
      return true;
    } else {
      return false;
    }
  }
  
  boolean stoßeObenAn(float y){
    if(y < spitzeY + spitzeHoehe){
      
      return true;
    } else {
      return false;
    }
  }
  
  boolean stoßeUntenAn(float y){
    if(y > spitzeY){
      return true;
    } else {
      return false;
    }
  }
}
