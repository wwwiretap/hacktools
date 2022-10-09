#include "Keyboard.h"

byte byteRead;

void setup()
{
  Keyboard.begin();
  Serial.begin(4800); /* This allows the program to print the serial data to a serial monitor to help when testing */
  Serial1.begin(9600);
}

void loop() {
  if (Serial1.available()) {
    byteRead = Serial1.read();
    Serial.print("Read as: ");
    Serial.print(byteRead);
    Serial.print("As char: ");
    Serial.print(char(byteRead));
    Keyboard.print(char(byteRead));
    Keyboard.end();
  }
}
