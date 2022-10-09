import serial
import logging
from pynput import keyboard


def main_loop():
    print("Starting mainloop")
    while True:
        with keyboard.Listener(
                on_press=on_press,
                on_release=on_release) as listener:
            listener.join()


def on_press(key):
    try:
        arduino_serial.write(bytes(key.char, 'utf-8'))
        print("This is the actual char press: " + str(key.char))
        print("This is the encoded char press: " + str(key.char.encode()))
    except AttributeError:
        arduino_serial.write(bytes(special_key(key), 'utf-8'))
        print("DIDNT SEND ANYTHING!!!")
        print("This is the special char press: " + str(key))
        print("This is the encoded char special press: " + str(str(key).encode()))


def on_release(key):
    try:
        convert_to_log(key)
    except AttributeError:
        convert_to_log(key)
    if key == keyboard.KeyCode.from_char('p'):
        return False


def convert_to_log(key):
    #     if ord(char) ==
    #         char = "Enter"
    #     elif ord(char) == 127:
    #         char = "Backspace"
    #     elif ord(char) == 218:
    #         char = "UpArrow"
    #     elif ord(char) == 217:
    #         char = "DownArrow"
    #     elif ord(char) == 216:
    #         char = "LeftArrow"
    #     elif ord(char) == 215:
    #         char = "RightArrow"
    logging.info(key)


def arrow(char):
    print("Dealing with char: " + str(char) + " or: " + str(ord(char)))
    converted = 0
    if ord(char) == 65:
        converted = 218
    elif ord(char) == 66:
        converted = 217
    elif ord(char) == 67:
        converted = 215
    elif ord(char) == 68:
        converted = 216
    print("Converted: " + chr(converted))
    return chr(converted)


def special_key(key):
    converted = 0
    if key == keyboard.Key.enter:
        converted = 176
    elif key == keyboard.Key.shift_l:
        converted = 129
    elif key == keyboard.Key.alt_l:
        converted = 130
    elif key == keyboard.Key.cmd_l:
        converted = 131
    elif key == keyboard.Key.tab:
        converted = 179
    elif key == keyboard.Key.esc:
        converted = 177
    print(converted)
    return chr(converted)


print("Starting keylogger")
logging.basicConfig(filename='keys.log', level=logging.DEBUG,
                    format='%(asctime)s |%(levelname)s| %(message)s')
print("Starting keylogger")
arduino_serial = serial.Serial("/dev/ttyAMA0", 9600, timeout=2, write_timeout=5)
print("Opened serial port successfully")
main_loop()
