class Position{
  int x;
  int y;

  // Constructor
  Position(this.x, this.y);
  changePosition(int x,int y){
    this.x += x;
    this.y += y;
  }
}