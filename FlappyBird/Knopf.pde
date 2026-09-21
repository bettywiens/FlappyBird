class Knopf{
  PImage knopfBild;
  float positionX;
  float positionY;
  boolean mausIstGedrueckt = false;
  
  Knopf(String bildPfad){
    knopfBild = loadImage(bildPfad);
  }
  
  void setzePosition(float positionX, float positionY){
    this.positionX = positionX;
    this.positionY = positionY;
  }
  
  void zeichne(){
    image(knopfBild, positionX, positionY);
  }
  
  boolean angeklickt(){
    if(!mausIstGedrueckt){
      if(mousePressed && istMausAufKnopf()){
        mausIstGedrueckt = true;
      }
    } else {
      if(!mousePressed){
        mausIstGedrueckt = false;
        return true;
      }
    }
    return false;
  }
  
  boolean istMausAufKnopf(){
    if(mouseX > positionX && mouseX < (positionX + knopfBild.width) && mouseY > positionY && mouseY < (positionY + knopfBild.height)){
      return true;
    }
    return false;
  }
}
