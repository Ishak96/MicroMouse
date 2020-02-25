public class Cell 
{  
  // Cell constants height and width
  static final int h = (int) BackTracking.wallHeight;
  static final int w = (int) BackTracking.wallWidth;
  
  // Cell position
  int iCell,jCell;
  
  // Cell visited or not yet
  boolean visited;
  
  // Cell walls
  // Do we get over those fucking booleans and use directly the null value for of the walls ? Need more time/testing to decide
  public boolean haut,bas,droite,gauche;
  public Wall wallHaut, wallBas, wallDroite, wallGauche;
  
  // Getters 
  public int getiCell() {return this.iCell;}
  public int getjCell() {return this.jCell;}
  
  public boolean getVisited() { return this.visited;} 
  public boolean getHaut() { return this.haut;} 
  public boolean getBas() { return this.bas;} 
  public boolean getGauche() { return this.gauche;} 
  public boolean getDroite() { return this.droite;} 
  
  public Wall getWallHaut () { return this.wallHaut;}
  public Wall getWallBas () { return this.wallBas;}
  public Wall getWallGauche () { return this.wallGauche;}
  public Wall getWallDroite () { return this.wallDroite;}
  
  
  // Setters
  public void setiCell(int x) { this.iCell = x;}
  public void setjCell(int y) { this.jCell = y;}
  
  public void setVisited(boolean visited) { this.visited = visited;} 
  public void setHaut(boolean haut) { this.haut = haut;} 
  public void setBas(boolean bas) { this.bas = bas;} 
  public void setDroite(boolean gauche) { this.gauche = gauche;} 
  public void setGauche(boolean droite) { this.droite = droite;}
  
  public void setWallHaut (Wall wallHaut) { this.wallHaut = wallHaut;}
  public void setWallBas (Wall wallBas) { this.wallBas = wallBas;}
  public void setWallGauche (Wall wallGauche) { this.wallGauche = wallGauche;}
  public void setWallDroite (Wall wallDroite) { this.wallDroite = wallDroite;}
  
  
  
  // Constructor
  public Cell(int x, int y, boolean haut,boolean bas,boolean droite,boolean gauche)
  {   
    // Only god know why this works 
    // edit : know why but flemme to recode it now
    this.jCell = x*w;
    this.iCell = y*w;
    
    this.visited = false;
    this.haut = haut;
    this.bas = bas;
    this.gauche = gauche;
    this.droite = droite;
    
    this.wallHaut= null;
    this.wallBas = null;
    this.wallGauche = null;
    this.wallDroite = null;
    
    if(haut) { 
    wallHaut = new Wall(this.iCell+w/2,   this.jCell+h/2,   w, h, 0);
    }
    if(bas) {
    wallBas = new Wall(this.iCell+w/2,   this.jCell+w+h/2-h, w, h, 0);
    }
    if(gauche){
    wallGauche = new Wall(this.iCell+h/2,   this.jCell+w/2,   w, h, HALF_PI) ;
    }
    if(droite){
    wallDroite = new Wall(this.iCell+w+h/2, this.jCell+w/2,   w, h, HALF_PI);;
    }
  }

  // Modifie les murs de la cellules selon les valeurs qu'on lui passe en arguments
  public void setCellWalls(boolean haut, boolean bas, boolean gauche, boolean droite)
  {  
    this.setHaut(haut);
    this.setBas(bas);
    this.setGauche(gauche);
    this.setDroite(droite);
  }

  public void showWallTerminal()
  {
  System.out.println("haut : "+this.haut);
  System.out.println("bas : "+this.bas);
  // hyes
  System.out.println("gauche : "+this.gauche);
  System.out.println("droite : "+this.droite);
  }
    
  public void display()
  {
  if(haut) {this.wallHaut.display();}
  if(bas) {this.wallBas.display();}
  if(gauche) {this.wallGauche.display();}
  if(droite) {this.wallDroite.display();}
  }

}