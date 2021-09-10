from pyzbar.pyzbar import decode
from PIL import Image

try:
    file = "/tmp/screenshot_clip.png"
    img = Image.open(file)
    result = decode(img)
    if result:
        for i in result:
            print(i.data.decode("utf-8"))
    else:
        print("Could not find QR, try again")
except:
    print("An error occured, does the file exist?")



