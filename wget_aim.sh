#!/bin/bash
rm *.ppt
wget -r -np -l 1 -A ppt -nd http://www.igf.fuw.edu.pl/meteo/stacja/wyklady/AnalizaInformacjiMeteo/
