#!/bin/bash
cd /home/dvu/data/data2/cephstorage/ProgLang/Python/dnabarcoder/alldata/yeastITS1_2023
../../aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank species -o yeastITS1.species.fasta
../../aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank genus -o yeastITS1.genus.fasta
../../aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank family -o yeastITS1.family.fasta
../../aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank order -o yeastITS1.order.fasta
../../aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank class -o yeastITS1.class.fasta
../../dnabarcoder.py length -i yeastITS1.fasta -l 50
../../dnabarcoder.py krona -i yeastITS1.classification
../../dnabarcoder.py overview -i yeastITS1.fasta -c yeastITS1.classification
../../dnabarcoder.py sim -i yeastITS1.fasta -ml 50
../../dnabarcoder.py variation -i yeastITS1.fasta -c yeastITS1.classification -rank class,order,family,genus,species -ml 50 -sim dnabarcoder/yeastITS1.sim 
../../dnabarcoder.py remove -i yeastITS1.species.fasta -c yeastITS1.classification -rank species -sim dnabarcoder/yeastITS1.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastITS1.species.diff.fasta -c yeastITS1.classification -ml 50 -st 0.9 -et 1 -s 0.001 -rank species -prefix yeastITS1 -sim dnabarcoder/yeastITS1.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastITS1.species.diff.fasta -c yeastITS1.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank species -prefix yeastITS1 -higherrank genus,family,order,class,phylum -sim dnabarcoder/yeastITS1.sim -mingroupno 5 -maxproportion 0.7 -mincutoff 0.7
../../dnabarcoder.py predict -i yeastITS1.genus.fasta -c yeastITS1.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -prefix yeastITS1
../../dnabarcoder.py predict -i yeastITS1.genus.fasta -c yeastITS1.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -higherrank family,order,class,phylum -prefix yeastITS1 -mingroupno 5  -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.family.fasta -c yeastITS1.classification -ml 50 -st 0.6 -et 1 -s 0.001 -rank family -prefix yeastITS1
../../dnabarcoder.py predict -i yeastITS1.family.fasta -c yeastITS1.classification -ml 50 -st 0.6 -et 1 -s 0.001 -rank family -higherrank order,class,phylum -prefix yeastITS1 -mingroupno 5  -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.order.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -prefix yeastITS1
../../dnabarcoder.py predict -i yeastITS1.order.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -higherrank class,phylum -prefix yeastITS1 -mingroupno 5  -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.class.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -prefix yeastITS1
../../dnabarcoder.py predict -i yeastITS1.class.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -higherrank phylum -prefix yeastITS1 -mingroupno 5  -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank genus,family,order,class 
../../dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank species -higherrank genus -mingroupno 10 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank genus -higherrank family -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank family -higherrank order -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank order -higherrank class -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank class -higherrank phylum -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py visualize -i yeastITS1.fasta  -c yeastITS1.classification -rank class -n 8 -size 0.3
../../dnabarcoder.py best -i dnabarcoder/yeastITS1.cutoffs.json -c yeastITS1.classification -mincutoff 0.5


