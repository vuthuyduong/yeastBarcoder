# yeastBarcoder


git clone https://github.com/vuthuyduong/yeastBarcoder.git

cd yeastBarcoder

\#download dnabarcoder 

git clone https://github.com/vuthuyduong/dnabarcoder.git

\# install dnabarcoder dependencies following the instruction at [https://github.com/vuthuyduong/dnabarcoder](https://github.com/vuthuyduong/dnabarcoder)

\# add excutable modes for all the .py in dnabarcoder if needed:

find . -type f -name "*.py" -exec chmod +x {} \; -print

cd data

<it>All the cut-off files (yeastITS.cutoffs.best.json, yeastLSU.cutoffs.best.json, yeastITS1.cutoffs.best.json, yeastITS2.cutoffs.best.json, etc.) are already available in the data folder. However, if we want to recalculate these files and all the figures made for the yeastBarcoder's manuscript, please perform the following bash files:</it>

./yeastITS.sh

./yeastLSU.sh

./yeastITS1.sh

./yeastITS2.sh

