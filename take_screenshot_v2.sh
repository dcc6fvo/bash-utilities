#!/bin/bash
ssh -i /home/john/id_rsa user@192.168.0.1 "DISPLAY=:0 import -window root -" | display
