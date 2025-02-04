import java.util.Arrays;

class Polygon{
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  color col;
  
  Polygon(color col){this.col = col;}
  
  Polygon(Simplex simplex){
    this.vertices = new ArrayList(Arrays.asList(simplex.vertices));
  }
  
  boolean checkDisable(){
    for(int i=0; i<vertices.size()-1; i++){
      float[] a = vertices.get(i).pos;
      float[] b = vertices.get(i+1).pos;
      float l = dist(a, b);
      if(l > polyMaxLength)return true;
    }
    return false;
  }
  
  void show(){
    if(checkDisable())return;
    fill(col);
    beginShape();
    for(Vertex v : vertices){
      vertex(v.pos);
    }
    endShape(CLOSE);
  }
}
