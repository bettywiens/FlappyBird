class Knopf {
  PImage knopfBild;
  float positionX;
  float positionY;
  float bildBreite;
  float bildHoehe;
  float faktor;
  boolean mausIstGedrueckt = false;

  Knopf(String bildPfad, float faktor) {
    knopfBild = loadImage(bildPfad);
    bildBreite = knopfBild.width * faktor;
    bildHoehe = knopfBild.height * faktor;
  }
  
  void setzeBildGroesse(float bildBreite, float bildHoehe){
    this.bildBreite = bildBreite;
    this.bildHoehe = bildHoehe;
  }

  void setzePosition(float positionX, float positionY) {
    this.positionX = positionX;
    this.positionY = positionY;
  }

  void zeichne() {
    image(knopfBild, positionX, positionY, bildBreite, bildHoehe);
  }

  boolean angeklickt() {
    if (!mausIstGedrueckt) {
      if (mousePressed && istMausAufKnopf()) {
        mausIstGedrueckt = true;
      }
    } else {
      if (!mousePressed) {
        mausIstGedrueckt = false;
        return true;
      }
    }
    return false;
  }

  boolean istMausAufKnopf() {
    if (mouseX > positionX && mouseX < (positionX + bildBreite) && mouseY > positionY && mouseY < (positionY + bildHoehe)) {
      return true;
    }
    return false;
  }
}
