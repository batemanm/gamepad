import bluetooth
import sys
import uinput
import struct
import binascii
#import bytearray
from evdev import UInput, ecodes as e

RIGHT_RIGHT = (1 << 0)
RIGHT_TOP = (1 << 1)
RIGHT_LEFT = (1 << 2)
RIGHT_DOWN = (1 << 3)
LEFT_RIGHT = (1 << 4)
LEFT_TOP = (1 << 5)
LEFT_LEFT = (1 << 6)
LEFT_DOWN = (1 << 7)
MIDDLE_RIGHT = (1 << 0)
MIDDLE_LEFT = (1 << 1)

ui = UInput ()

# change you your bluetooth device address
bd_addr = "98:D3:31:20:17:6E"

while 1:
  try:
    port = 1
    sock=bluetooth.BluetoothSocket( bluetooth.RFCOMM )

    sock.connect((bd_addr, port))
    print ('Connected')

    lastNum1 = 0
    lastNum2 = 0


    while 1:
      data1 = sock.recv(1)
      data2 = sock.recv(1)
      num1 = ord (data1)
      num2 = ord (data2)

      if ((num1 & RIGHT_RIGHT) and not(lastNum1 & RIGHT_RIGHT)):
        ui.write (e.EV_KEY, e.KEY_U, 1)
      if (not (num1 & RIGHT_RIGHT) and (lastNum1 & RIGHT_RIGHT)):
        ui.write (e.EV_KEY, e.KEY_U, 0)

      if ((num1 & RIGHT_TOP) and not (lastNum1 & RIGHT_TOP)):
        ui.write (e.EV_KEY, e.KEY_LEFTCTRL, 1)
      if (not (num1 & RIGHT_TOP) and (lastNum1 & RIGHT_TOP)):
        ui.write (e.EV_KEY, e.KEY_LEFTCTRL, 0)

      if ((num1 & RIGHT_LEFT) and not (lastNum1 & RIGHT_LEFT)):
        ui.write (e.EV_KEY, e.KEY_O, 1)
      if (not (num1 & RIGHT_LEFT) and (lastNum1 & RIGHT_LEFT)):
        ui.write (e.EV_KEY, e.KEY_O, 0)

      if ((num1 & RIGHT_DOWN) and not (lastNum1 & RIGHT_DOWN)):
        ui.write (e.EV_KEY, e.KEY_P, 1)
      if (not (num1 & RIGHT_DOWN) and (lastNum1 & RIGHT_DOWN)):
        ui.write (e.EV_KEY, e.KEY_P, 0)


      if ((num1 & LEFT_RIGHT) and not(lastNum1 & LEFT_RIGHT)):
        ui.write (e.EV_KEY, e.KEY_RIGHT, 1)
      if (not (num1 & LEFT_RIGHT) and (lastNum1 & LEFT_RIGHT)):
        ui.write (e.EV_KEY, e.KEY_RIGHT, 0)

      if ((num1 & LEFT_TOP) and not (lastNum1 & LEFT_TOP)):
        ui.write (e.EV_KEY, e.KEY_UP, 1)
      if (not (num1 & LEFT_TOP) and (lastNum1 & LEFT_TOP)):
        ui.write (e.EV_KEY, e.KEY_UP, 0)

      if ((num1 & LEFT_LEFT) and not (lastNum1 & LEFT_LEFT)):
        ui.write (e.EV_KEY, e.KEY_LEFT, 1)
      if (not (num1 & LEFT_LEFT) and (lastNum1 & LEFT_LEFT)):
        ui.write (e.EV_KEY, e.KEY_LEFT, 0)

      if ((num1 & LEFT_DOWN) and not (lastNum1 & LEFT_DOWN)):
        ui.write (e.EV_KEY, e.KEY_DOWN, 1)
      if (not (num1 & LEFT_DOWN) and (lastNum1 & LEFT_DOWN)):
        ui.write (e.EV_KEY, e.KEY_DOWN, 0)


      if ((num2 & MIDDLE_RIGHT) and not (lastNum2 & MIDDLE_RIGHT)):
        ui.write (e.EV_KEY, e.KEY_J, 1)
      if (not (num2 & MIDDLE_RIGHT) and (lastNum2 & MIDDLE_RIGHT)):
        ui.write (e.EV_KEY, e.KEY_J, 0)

      if ((num2 & MIDDLE_LEFT) and not (lastNum2 & MIDDLE_LEFT)):
        ui.write (e.EV_KEY, e.KEY_K, 1)
      if (not (num2 & MIDDLE_LEFT) and (lastNum2 & MIDDLE_LEFT)):
        ui.write (e.EV_KEY, e.KEY_K, 0)

      ui.syn ()
      lastNum1 = num1
      lastNum2 = num2

  except:
    sock.close()
