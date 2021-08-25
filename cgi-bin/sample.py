#!/usr/bin/python3

print("content-type: text/html")
print()

import cgi
import subprocess

data = cgi.FieldStorage()
command = data.getvalue("cmd")

output = subprocess.getoutput("sudo " + command)
print(output)
