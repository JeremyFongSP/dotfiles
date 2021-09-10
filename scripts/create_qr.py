import segno
import subprocess

url = None

while(url is None):
    url = input("Enter URL:") or None

dark = input("Enter main dark color: ") or "black"
if dark == "None" or dark == "none":
    dark = None
light = input("Enter main light color: ") or None
finder_dark = input("Enter finder dark color: ") or "black"
if finder_dark == "None" or finder_dark == "none":
    finder_dark = None
finder_light = input("Enter finder light color: ") or None
data_dark = input("Enter data dark color: ") or None
if data_dark == "None" or data_dark == "none":
    data_dark = None
data_light = input("Enter data light color: ") or None
if data_light == "None" or data_light == "none":
    data_light = None

output = "qr_output.png"

qr = segno.make(url)
if not data_dark:
    qr.save(output,
            dark=dark,
            light=light,
            finder_dark=finder_dark,
            finder_light=finder_light,
            scale=200)
else:
    qr.save(output,
            dark=dark,
            light=light,
            data_dark=data_dark,
            data_light=data_light,
            scale=200)

print(f"Output: {output}")
subprocess.run(["viewnior", "./qr_output.png"])
