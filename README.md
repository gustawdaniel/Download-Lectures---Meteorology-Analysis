# Download-Lectures---Meteorology-Analysis
This script download lectures from Analysis of Meteorogical Information.

To open:

    mkdir lectures && cd lectures
    git clone https://github.com/gustawdaniel/Download-Lectures---Meteorology-Analysis.git
    chmod a+x wget_aim.sh
    ./wget_aim.sh
    
It's all.

**warning!**

Do not use script in folder with your own `ppt` files

### Explanation

Firstly, we clear catalogue to avoid duplication of files 

    rm *.ppt

Next download all ppt files from website

    wget -r -np -l 1 -A ppt -nd http://www.igf.fuw.edu.pl/meteo/stacja/wyklady/AnalizaInformacjiMeteo/

```
-r,  --recursive          specify recursive download.
-np, --no-parent          don't ascend to the parent directory.
-l,  --level=NUMBER       maximum recursion depth (inf or 0 for infinite).
-A,  --accept=LIST        comma-separated list of accepted extensions.
-nd                       no directories flag, ommit any extra directories
```

### Sources:
>http://stackoverflow.com/questions/13533217/how-to-download-all-links-to-zip-files-on-a-given-web-page-using-wget-curl
