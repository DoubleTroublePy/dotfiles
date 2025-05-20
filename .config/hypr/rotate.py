import subprocess as sp
from sys import argv
import re

if len(argv) < 2: quit()

ret = sp.check_output(['hyprctl', 'activeworkspace'])
mat = re.findall(r"monitor (.*?):", ret.decode('utf-8'))

if len(mat) < 1: quit()
sp.run(['hyprctl', 'keyword', 'monitor', f"{mat[0]}, preferred, auto, auto, transform, {argv[1]}"])
print(f"{mat[0]}, preferred, auto, auto, transform, {argv[1]}")

