import processing.serial.*;

Serial myPort;  // The serial port

void setup() {
  size(230, 270);
  // List all the available serial ports
  printArray(Serial.list());
  println(Serial.list().length);
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[Serial.list().length-1], 115200);
  textSize(12);
}


void draw() {
  background(100);
  text(key, 10, 20); // Draw "key" at coordinate (10,20)
  text("1 - \" Battery millivolts \"", 20, 40); // start of Menu
  while (myPort.available() > 0) {
    int inByte = myPort.read();
    println(inByte);
  }
}

void keyPressed() {
    if (key == '1') {
      println("** Battery Millivolts: **");
      myPort.write(0xB0);
    } else if (key == ' ') {
      myPort.write(0x20);
    } else if (key == CODED) 
    {
          
    } else
    {
       myPort.write(key);
    }
}
