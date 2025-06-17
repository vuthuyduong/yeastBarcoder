# yeastBarcoder

<b> Setting up the working environment </b>

git clone https://github.com/vuthuyduong/yeastBarcoder.git

cd yeastBarcoder

<i>download dnabarcoder</i>

git clone https://github.com/vuthuyduong/dnabarcoder.git

<i>install dnabarcoder dependencies following the instructions available at </i> [https://github.com/vuthuyduong/dnabarcoder](https://github.com/vuthuyduong/dnabarcoder) 

<i>Make all .py files in </i> dnabarcoder <i>executable if needed: </i>

find . -type f -name "*.py" -exec chmod +x {} \; -print

cd data

<b> Calculate similarity cutoffs for different yeast clades for different biomarkers </b>

<i>All the cut-off files (yeastITS.cutoffs.best.json, yeastLSU.cutoffs.best.json, yeastITS1.cutoffs.best.json, yeastITS2.cutoffs.best.json, etc.) are already available in the </i> data <i> folder. However, if we want to recalculate these files and all the figures made for the yeastBarcoder's manuscript, please perform the following bash files:</i>

./yeastITS.sh

./yeastLSU.sh

./yeastITS1.sh

./yeastITS2.sh

<b> Classify the gut microbiome sample </b>
<i>Download the rawdata of the human gut microbiome samples from the paper [The gut mycobiome of the Human Microbiome Project healthy cohort](10.1186/s40168-017-0373-4)</i>

