//based on this code https://github.com/Scrawk/Hull-Delaunay-Voronoi
//constrait have to be one ring, If you want to use many ring please use constrained delaunay text

float basehue = 0;
boolean modeDelaunay = false;
ArrayList<float[]> constraints = new ArrayList<float[]>();

int numVertices = 200;
float size = 200;

int heurType = 0;

Vertex current;
Vertex end;
ArrayList<Vertex> openSet = new ArrayList<Vertex>();
ArrayList<Vertex> closedSet = new ArrayList<Vertex>();
ArrayList<Vertex> path = new ArrayList<Vertex>();
boolean solving = false;
int startI = 0;//start index

ExampleConstrainedDelaunay ed2;
ExampleConstrainedVoronoi ev2;

void setup(){
  size(500, 500, P3D);
  //fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 100);
  constraints.add(set(-150, -100));//if clockwise withhole, if counterclockwise clipped delaunay
  constraints.add(set(0, 100));
  constraints.add(set(100, 0));
  constraints.add(set(0, 20));
  //constraints = changePolygonOrient(constraints);
  println(isPolygonOrientedClokwise(constraints));
  
  ed2 = new ExampleConstrainedDelaunay(constraints, true);
  ev2 = new ExampleConstrainedVoronoi(constraints, true);
  ortho();
  strokeWeight(5);
  background(360);
}

void keyPressed(){
}

void draw(){
  //
  stroke(0);
  strokeWeight(5);
  translate(width/2, height/2);
  if(modeDelaunay){
    ed2.show();
    
  }else{
    ev2.show();
  }
  noFill();
  beginShape();
  for(float[] c : constraints){
    vertex(c[0], c[1]);
  }
  endShape(CLOSE);
}
