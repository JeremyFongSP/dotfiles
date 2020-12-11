import segno
import clipboard
import subprocess
import tempfile
import time
import os

# copy from clipboard
text = clipboard.paste()

# create temp file
f = tempfile.mkstemp(suffix='.png')
f = f[1]

# create and save qr code
qr = segno.make(text)
qr.save(f, scale=15)

# open with viewnior
p = subprocess.Popen(["viewnior", f])

# wait 2 seconds for viewnior to open
time.sleep(2)

# delete file (doesn't do it automatically in this case)
os.remove(f)
