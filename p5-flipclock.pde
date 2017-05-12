import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam camera;

float noiseOffsX = 0.0;
float noiseOffsY = 0.0;

void setup() {
  size( 500, 500, P3D );
  background( 0 );
  
  camera = new PeasyCam(this, (width/2), 0, 0, 50);
  camera.rotateX( PI * 0.6 );
}

float noiseScale = 0.02;
float noiseHeight = 100.0;

float quadSize = 30.0;
int numQuads = 20;                                                                                                                                                                                                                                                                                                                                                                 

float znoise( float x, float y ) {
  return noise( (x+noiseOffsX)*noiseScale, (y+noiseOffsY)*noiseScale ) * noiseHeight;
}


void draw() {
   
  noiseOffsY += 0.01;
  noiseOffsX += 0.1;
  
  background( 0 );
  noFill();
  stroke( color(255) );
  
  for(int y=0; y<numQuads; y++){
    for(int x=0; x<numQuads; x++){
      float x1 = x * quadSize;
      float x2 = (x+1) * quadSize;
      float y1 = y * quadSize;
      float y2 = (y+1) * quadSize;
      beginShape( TRIANGLES );
      vertex( x1, y1, znoise(x1,y1) );
      vertex( x2, y1, znoise(x2,y1) );
      vertex( x1, y2, znoise(x1,y2) );
      
      vertex( x2, y2, znoise(x2,y2) );
      vertex( x2, y1, znoise(x2,y1) );
      vertex( x1, y2, znoise(x1,y2) );
      endShape();
    }
  }
}

/*
void draw() {
  for(int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      float n = noise( x * noiseScale, y * noiseScale);
      int bright = int( 255.0 * n );
      set( x, y, color(bright) );
    }
  }
} 
*/