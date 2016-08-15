#include <SoftwareSerial.h>

#define RXPIN 3
#define TXPIN 2

SoftwareSerial bt (RXPIN, TXPIN);

#define RIGHT_RIGHT_PIN A1
#define RIGHT_TOP_PIN A0
#define RIGHT_LEFT_PIN 8
#define RIGHT_DOWN_PIN 9

#define START_PIN 5
#define SELECT_PIN 4

#define LEFT_RIGHT_PIN 7
#define LEFT_TOP_PIN A2
#define LEFT_LEFT_PIN 6
#define LEFT_DOWN_PIN A3

#define RIGHT_RIGHT 1
#define RIGHT_TOP 2
#define RIGHT_LEFT 3
#define RIGHT_DOWN 4

#define LEFT_RIGHT 5
#define LEFT_TOP 6
#define LEFT_LEFT 7
#define LEFT_DOWN 8

#define START 9
#define SELECT 10

#define DEBOUNCE 50


long lastButtonTime[16];

int buttonState = 0;
int lastButtonState = 0;

int lastSent = 0;

void setup() {
// bluetooth
    pinMode (RXPIN, INPUT);
    pinMode (TXPIN, OUTPUT);
    bt.begin(9600);
  
//button
//right 4
    pinMode(RIGHT_RIGHT_PIN, INPUT_PULLUP);     
    pinMode(RIGHT_TOP_PIN, INPUT_PULLUP);
    pinMode(RIGHT_LEFT_PIN, INPUT_PULLUP);     
    pinMode(RIGHT_DOWN_PIN, INPUT_PULLUP);

// middle 2
    pinMode(START_PIN, INPUT_PULLUP);     
    pinMode(SELECT_PIN, INPUT_PULLUP);

//left 4
    pinMode(LEFT_RIGHT_PIN, INPUT_PULLUP);     
    pinMode(LEFT_TOP_PIN, INPUT_PULLUP);
    pinMode(LEFT_LEFT_PIN, INPUT_PULLUP);     
    pinMode(LEFT_DOWN_PIN, INPUT_PULLUP);
}


void setButtonOn (int BUTTON, long time) {

  if (((lastButtonState & (1<<(BUTTON-1))) != (1<<(BUTTON - 1)))) {
    lastButtonTime[BUTTON] = time;
  }
  if ((time - lastButtonTime[BUTTON]) > DEBOUNCE) {
    if (((buttonState & (1<<(BUTTON-1))) != (1 << (BUTTON - 1)))){
      buttonState = buttonState | (1 << (BUTTON - 1));
    }
  }
  
  lastButtonState = lastButtonState | (1 << (BUTTON - 1));
}

void setButtonOff (int BUTTON, long time) {
  
  if (((lastButtonState & (1<<(BUTTON-1))) !=  !(1<<(BUTTON - 1)))) {
        lastButtonTime[BUTTON] = time;
  }
  
  if ((time - lastButtonTime[BUTTON]) > DEBOUNCE) {
    if (((lastButtonState & (1<<(BUTTON-1))) != (1 << (BUTTON - 1)))){
       buttonState = buttonState & ~(1 << (BUTTON - 1));
    }
  }
  
  lastButtonState = lastButtonState & ~(1 << (BUTTON - 1));

}

void getButtonStateToSend (int buttonState) {
  int toSend = 0;
  int toSend2 = 0;
  byte send1 = 0;
  byte send2 = 0;
  boolean changed = 0;
  for (int i = 0; i < sizeof (buttonState) *8; i ++) {
    if ((lastSent & (1 << i)) != (buttonState & (1 << i))) {
      changed = 1;
    }
  }
  if (changed == 1) {
    toSend = buttonState;
     send1 = byte (toSend);
     toSend2 = toSend >> 8;
     send2 = byte (toSend2);
    bt.write (send1);
    bt.write (send2);

    lastSent = toSend;
  }
}

void loop(){
  long time = millis ();
  if (digitalRead (RIGHT_RIGHT_PIN) == LOW) {
    setButtonOn (RIGHT_RIGHT, time);
  } else {
    setButtonOff (RIGHT_RIGHT, time);
  }
  if (digitalRead (RIGHT_TOP_PIN) == LOW) {
    setButtonOn (RIGHT_TOP, time);
  } else {
    setButtonOff (RIGHT_TOP, time);
  }
  if (digitalRead (RIGHT_LEFT_PIN) == LOW) {
    setButtonOn (RIGHT_LEFT, time);
  } else {
    setButtonOff (RIGHT_LEFT, time);
  }
  if (digitalRead (RIGHT_DOWN_PIN) == LOW) {
    setButtonOn (RIGHT_DOWN, time);
  } else {
    setButtonOff (RIGHT_DOWN, time);
  }


  if (digitalRead(SELECT_PIN) == LOW) {
    setButtonOn (SELECT, time);
  } else {
    setButtonOff (SELECT, time);
  }
  if (digitalRead (START_PIN) == LOW) {
    setButtonOn (START, time);
  } else {
    setButtonOff (START, time);
  }

  if (digitalRead (LEFT_RIGHT_PIN) == LOW) {
    setButtonOn (LEFT_RIGHT, time);
  } else {
    setButtonOff (LEFT_RIGHT, time);
  }
  if (digitalRead (LEFT_TOP_PIN) == LOW) {
    setButtonOn (LEFT_TOP, time);
  } else {
    setButtonOff (LEFT_TOP, time);
  }
  if (digitalRead(LEFT_LEFT_PIN) == LOW) {
    setButtonOn (LEFT_LEFT, time);
  } else {
    setButtonOff (LEFT_LEFT, time);
  }
  if (digitalRead (LEFT_DOWN_PIN) == LOW) {
    setButtonOn (LEFT_DOWN, time);
  } else {
    setButtonOff (LEFT_DOWN, time);
  }
  getButtonStateToSend (buttonState);
}
