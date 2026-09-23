class Knopf {
  PImage knopfBild;
  float positionX;
  float positionY;
  float bildBreite;
  float bildHoehe;
  boolean mausIstGedrueckt = false;

  Knopf(String bildPfad) {
    knopfBild = loadImage(bildPfad);
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
    if (mouseX > positionX && mouseX < (positionX + knopfBild.width) && mouseY > positionY && mouseY < (positionY + knopfBild.height)) {
      return true;
    }
    return false;
  }
}
