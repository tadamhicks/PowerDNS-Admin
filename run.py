#!/usr/bin/env python
from app import app
from config import PORT
import socket
import sys

try:
    BIND_ADDRESS = socket.gethostbyname(socket.gethostname())
    #from config import BIND_ADDRESS
except:
	BIND_ADDRESS = '127.0.0.1'

if __name__ == '__main__':
    app.run(debug = True, host=BIND_ADDRESS, port=PORT)
