# yeastBarcoder

<b> Setting up the working environment </b>

git clone https://github.com/vuthuyduong/yeastBarcoder.git

cd yeastBarcoder

<i>download dnabarcoder</i>

git clone https://github.com/vuthuyduong/dnabarcoder.git

<i>install dnabarcoder dependencies following the instructions available at </i> [https://github.com/vuthuyduong/dnabarcoder](https://github.com/vuthuyduong/dnabarcoder) 

<i>Make all .py files in </i> dnabarcoder <i>executable if needed: </i>

find . -type f -name "*.py" -exec chmod +x {} \\; -print

cd data

<b> Calculate similarity cutoffs for different yeast clades for different biomarkers </b>

<i>All the cut-off files (yeastITS.cutoffs.best.json, yeastLSU.cutoffs.best.json, yeastITS1.cutoffs.best.json, yeastITS2.cutoffs.best.json, etc.) are already available in the </i> data <i> folder. However, if we want to recalculate these files and all the figures made for the yeastBarcoder's manuscript, please perform the following bash files:</i>

./yeastITS.sh

./yeastLSU.sh

./yeastITS1.sh

./yeastITS2.sh

<b> Classify the gut microbiome sample </b>

<i>Download the raw data of the human gut microbiome samples from the paper [The gut mycobiome of the Human Microbiome Project healthy cohort](10.1186/s40168-017-0373-4)</i>

<i>Perform [Dada2](https://benjjneb.github.io/dada2/)  on the raw data to obtain asvnochim.fasta file </i>

<i>Classify asvnochim.fasta against yeastITS2:</i>

../dnabarcoder/dnabarcoder.py search -i asvnochim.fasta -r yeastITS2.fasta

../dnabarcoder/dnabarcoder.py classify -i dnabarcoder/asvnochim.yeastITS2_BLAST.bestmatch -c yeastITS2.classification -cutoffs yeastITS2.cutoffs.best.json 

<i>Classify asvnochim.fasta against filfungalITS2:</i>

../dnabarcoder/dnabarcoder.py search -i asvnochim.fasta -r filfungalITS2.fasta

../dnabarcoder/dnabarcoder.py classify -i dnabarcoder/asvnochim.filfungalITS2_BLAST.bestmatch -c filfungalITS2.classification -cutoffs filfungalITS2.cutoffs.best.json 

<i>Merge classification outputs:</i>

../dnabarcoder/aidscripts/mergeClassifications.py -i dnabarcoder/asvnochim.yeastITS2_BLAST.classification,dnabarcoder/asvnochim.moldITS2_BLAST.classification -o dnabarcoder/asvnochim.merged.classification


<i>Alternatively, we can also classify asvnochim.fasta against CBSITS2:</i>

../dnabarcoder/dnabarcoder.py search -i asvnochim.fasta -r CBSITS2.fasta

../dnabarcoder/dnabarcoder.py classify -i dnabarcoder/asvnochim.CBSITS2_BLAST.bestmatch -c CBSITS2.classification -cutoffs CBSITS2.cutoffs.best.json 




