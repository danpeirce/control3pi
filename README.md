# Control 3Pi Robot

This processing code to be used to test control of a Pololu 3Pi robot.
It is assumed the robot is running the serial slave program from Pololu.
This will allow the 3Pi robot to be controlled from a PC.

* [10.a. Serial slave program](https://www.pololu.com/docs/0J21/all#10.a)

This image shows the 3Pi connected to a PC via a USB to serial adaptor.

![](image/pc-control.png)

This is still in just a very early stage of development.

## Command Test Results

### Battery Voltage

A hex 0xB1 was sent to the 3Pi slave and the following was displayed in the Processing 
response window:

~~~~
** Battery Millivolts: **
232
19
~~~~

This can be interpreted by plugging the decimal values into an equation:

~~~~python
value1 = 232
value2 = 19
milivolts = value1 + value2 * 256
~~~~

![](image/battery-volt.png)

### 3Pi Signature

![](image/3pi-signature.png)