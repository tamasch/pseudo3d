class Brick{
  //location of the vertex A
  int height;
  int width;
  PVector location, vpa, vpb, A, B, C, D, E, F, G, H;

  
  Brick(int height, int width, int depth, PVector vpa, PVector vpb){
    this.height = height;
    this.width = width;
    this.vpa = vpa;
    this.vpb = vpb;
     
  }
  
  void show(int x, int y){
    A = new PVector(x, y);
    B = new PVector(x, y).add(vpb).div(2);
    C = new PVector(x, y + this.height).add(vpb).div(2);
    D = new PVector(x, y + this.height);
    E = new PVector(x, y + this.height).add(vpa).div(2);
    F = new PVector(x, y).add(vpa).div(2);
    G = Intersection(F, vpb, B, vpa);
    H = Intersection(E, vpb, C, vpa);
    
    text("A", A.x + 10, A.y - 10);
    
    
    text("D", D.x + 10, D.y - 10);
    text("E", E.x + 10, E.y - 10);
    text("F", F.x + 10, F.y - 10);
    
    
    
    if (A.y > G.y){
      //Draw BG
      line(B.x, B.y, G.x, G.y);
      //Draw FG
      line(F.x, F.y, G.x, G.y);
      text("G", G.x + 10, G.y - 10);
    }
    
    if (H.y > D.y){
      ///Draw CH
      line(C.x, C.y, H.x, H.y);
      //Draw EH
      line(E.x, E.y, H.x, H.y);
      text("H", H.x + 10, H.y - 10);
    }
    
    if (A.x < B.x){
      //Draw BC
      line(B.x, B.y, C.x, C.y);
    }
    
    if (C.x > A.x || C.y > D.y){
      //Draw CD
      line(C.x, C.y, D.x, D.y);
      text("C", C.x + 10, C.y - 10);
    }
    
    if (A.y > B.y || A.x < B.x){
      //Draw AB
      line(A.x, A.y, B.x, B.y);
      text("B", B.x + 10, B.y - 10);
    }
    
    
    //Draw AD
    line(A.x, A.y, D.x, D.y);
    //Draw AF
    line(A.x, A.y, F.x, F.y);
    
    
    
    
    //Draw GH
    //line(G.x, G.y, H.x, H.y);
    //Draw DE
    line(D.x, D.y, E.x, E.y);
    //Draw DE
    line(D.x, D.y, E.x, E.y);
    //Draw EF
    line(E.x, E.y, F.x, F.y);

  }
  
  void drawVectors(){
    
    line(0, 0, A.x, A.y);
    line(0, 0, B.x, B.y);
    line(0, 0, C.x, C.y);
    line(0, 0, D.x, D.y);
    line(0, 0, E.x, E.y);
    line(0, 0, F.x, F.y);
    
  }
  
  PVector Intersection(PVector A, PVector B, PVector C, PVector D){
    PVector E = PVector.sub(B, A);
    PVector F = PVector.sub(D, C);
    PVector P = new PVector(-1 * E.y, E.x);
    float h = PVector.dot((PVector.sub(A, C)), P) / PVector.dot(F, P);

    return PVector.add(PVector.mult(F, h), C);
  }
  
  int getHeight(){
   return this.height; 
  }
}