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
  text("2 - \" 3Pi signature? \"", 20, 60); // 
  text("3 - \" LCD APSC1299 \"", 20, 80); //
  text("4 - \" LCD   KPU  APSC1299 \"", 20, 100); //
  text("5 - \" Auto Calibrate \"", 20, 120); //
  text("6 - \" Line Position \"", 20, 140); //
  while (myPort.available() > 0) {
    int inByte = myPort.read();
    println(inByte);
  }
}

void keyPressed() {
    if (key == '1') {
      println("** Battery Millivolts: **");
      myPort.write(0xB1);
    } else if (key == '2') {
      println("** 3Pi signature? **");
      myPort.write(0x81);
    } else if (key == '3') {
      println("** PrintAPSC1299 **");
      myPort.write(0xB7);
      myPort.write(0xB8);
      myPort.write(8);
      myPort.write("APSC1299");
    } else if (key == '4') {
      println("** Print KPU APSC1299 **");
      myPort.write(0xB7);
      myPort.write(0xB8);
      myPort.write(8);
      myPort.write("  KPU   ");
      myPort.write(0xB9);
      myPort.write(0);
      myPort.write(1);
      myPort.write(0xB8);
      myPort.write(8);
      myPort.write("APSC1299");
    } else if (key == '5') {
      println("** Auto Calibrate **");
      myPort.write(0xBA);
    } else if (key == '6') {
      println("** Line Position **");
      myPort.write(0xB6);
    } else if (key == ' ') {
      myPort.write(0x20);
    } else if (key == CODED) 
    {
          
    } else
    {
       myPort.write(key);
    }
}