PShape fatur;
float pitch = 0;
float yaw = 0;
float roll = 0;
boolean upPressed, downPressed, leftPressed, rightPressed, ltPressed, gtPressed;

void setup() {
  size(1000, 1000, P3D);
  fatur = createShape(GROUP);
  
  // Sisi depan
  PShape front = createShape();
  front.beginShape();
  front.vertex(100, 900, 0);
  front.vertex(100, 400, 0);
  front.vertex(350, 400, 0);
  front.vertex(350, 500, 0);
  front.vertex(200, 500, 0);
  front.vertex(200, 600, 0);
  front.vertex(350, 600, 0);
  front.vertex(350, 700, 0);
  front.vertex(200, 700, 0);
  front.vertex(200, 900, 0);
  front.endShape(CLOSE);
  fatur.addChild(front);
  
  // Sisi belakang
  PShape back = createShape();
  back.beginShape();
  back.vertex(100, 900, 100);
  back.vertex(100, 400, 100);
  back.vertex(350, 400, 100);
  back.vertex(350, 500, 100);
  back.vertex(200, 500, 100);
  back.vertex(200, 600, 100);
  back.vertex(350, 600, 100);
  back.vertex(350, 700, 100);
  back.vertex(200, 700, 100);
  back.vertex(200, 900, 100);
  back.endShape(CLOSE);
  fatur.addChild(back);
  
  // Sisi samping kiri
  PShape left = createShape();
  left.beginShape();
  left.vertex(100, 900, 0);
  left.vertex(100, 900, 100);
  left.vertex(100, 400, 100);
  left.vertex(100, 400, 0);
  left.endShape(CLOSE);
  fatur.addChild(left);
  
  // Sisi atas
  PShape top = createShape();
  top.beginShape();
  top.vertex(100, 400, 0);
  top.vertex(350, 400, 0);
  top.vertex(350, 400, 100);
  top.vertex(100, 400, 100);
  top.endShape(CLOSE);
  fatur.addChild(top);
  
  // Sisi bawah
  PShape bottom = createShape();
  bottom.beginShape();
  bottom.vertex(100, 900, 0);
  bottom.vertex(100, 900, 100);
  bottom.vertex(200, 900, 100);
  bottom.vertex(200, 900, 0);
  bottom.endShape(CLOSE);
  fatur.addChild(bottom);
  
  // Sisi samping kanan
  PShape right = createShape();
  right.beginShape();
  right.vertex(200, 900, 0);
  right.vertex(200, 900, 100);
  right.vertex(200, 700, 100);
  right.vertex(200, 700, 0);
  right.endShape(CLOSE);
  fatur.addChild(right);
  
  PShape rightTop1 = createShape();
  rightTop1.beginShape();
  rightTop1.vertex(200, 700, 0);
  rightTop1.vertex(350, 700, 0);
  rightTop1.vertex(350, 700, 100);
  rightTop1.vertex(200, 700, 100);
  rightTop1.endShape(CLOSE);
  fatur.addChild(rightTop1);
  
  PShape rightBottom = createShape();
  rightBottom.beginShape();
  rightBottom.vertex(350, 700, 0);
  rightBottom.vertex(350, 700, 100);
  rightBottom.vertex(350, 600, 100);
  rightBottom.vertex(350, 600, 0);
  rightBottom.endShape(CLOSE);
  fatur.addChild(rightBottom);
  
  PShape rightBottomBack = createShape();
  rightBottomBack.beginShape();
  rightBottomBack.vertex(200, 600, 0);
  rightBottomBack.vertex(350, 600, 0);
  rightBottomBack.vertex(350, 600, 100);
  rightBottomBack.vertex(200, 600, 100);
  rightBottomBack.endShape(CLOSE);
  fatur.addChild(rightBottomBack);
  
  PShape leftBottomBack = createShape();
  leftBottomBack.beginShape();
  leftBottomBack.vertex(200, 600, 0);
  leftBottomBack.vertex(200, 600, 100);
  leftBottomBack.vertex(200, 500, 100);
  leftBottomBack.vertex(200, 500, 0);
  leftBottomBack.endShape(CLOSE);
  fatur.addChild(leftBottomBack);
  
  PShape leftBottom = createShape();
  leftBottom.beginShape();
  leftBottom.vertex(200, 500, 0);
  leftBottom.vertex(350, 500, 0);
  leftBottom.vertex(350, 500, 100);
  leftBottom.vertex(200, 500, 100);
  leftBottom.endShape();
  fatur.addChild(leftBottom);
  
  PShape rightTopBack = createShape();
  rightTopBack.beginShape();
  rightTopBack.vertex(100, 400, 0);
  rightTopBack.vertex(350, 400, 0);
  rightTopBack.vertex(350, 400, 100);
  rightTopBack.vertex(100, 400, 100);
  rightTopBack.endShape();
  fatur.addChild(rightTopBack);
  
  PShape rightTop2 = createShape();
  rightTop2.beginShape();
  rightTop2.vertex(350, 500, 0);
  rightTop2.vertex(350, 500, 100);
  rightTop2.vertex(350, 400, 100);
  rightTop2.vertex(350, 400, 0);
  rightTop2.endShape();
  fatur.addChild(rightTop2);
  
  // Pusatkan huruf "F"
  centerObject(fatur);
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  
  if (upPressed) {
    pitch -= radians(1);
  }
  if (downPressed) {
    pitch += radians(1);
  }
  if (leftPressed) {
    yaw -= radians(1);
  }
  if (rightPressed) {
    yaw += radians(1);
  }
  
  if (ltPressed) {
    roll -= radians(1);
  }
  if (gtPressed) {
    roll += radians(1);
  }

  pitch = pitch % TWO_PI;
  yaw = yaw % TWO_PI;
  roll = roll % TWO_PI;
  
  pushMatrix();
  rotateX(pitch);
  rotateY(yaw);
  rotateZ(roll);
  shape(fatur);
  popMatrix();
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == DOWN) {
    downPressed = true;
  }
  if (keyCode == LEFT) {
    leftPressed = true;
  }
  if (keyCode == RIGHT) {
    rightPressed = true;
  }
  if (key == '<') {
    ltPressed = true;
  }
  if (key == '>') {
    gtPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  }
  if (keyCode == DOWN) {
    downPressed = false;
  }
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  if (keyCode == RIGHT) {
    rightPressed = false;
  }
  if (key == '<') {
    ltPressed = false;
  }
  if (key == '>') {
    gtPressed = false;
  }
}

void centerObject(PShape obj) {
  float minX = Float.MAX_VALUE;
  float minY = Float.MAX_VALUE;
  float minZ = Float.MAX_VALUE;
  float maxX = Float.MIN_VALUE;
  float maxY = Float.MIN_VALUE;
  float maxZ = Float.MIN_VALUE;
  
  for (int i = 0; i < obj.getChildCount(); i++) {
    PShape child = obj.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++) {
      PVector v = child.getVertex(j);
      minX = min(minX, v.x);
      minY = min(minY, v.y);
      minZ = min(minZ, v.z);
      maxX = max(maxX, v.x);
      maxY = max(maxY, v.y);
      maxZ = max(maxZ, v.z);
    }
  }
  
  float centerX = (minX + maxX) / 2;
  float centerY = (minY + maxY) / 2;
  float centerZ = (minZ + maxZ) / 2;
  
  obj.resetMatrix();
  obj.translate(-centerX, -centerY, -centerZ);
}
