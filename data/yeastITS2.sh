#!/bin/bash
cd /home/dvu/data/data2/cephstorage/ProgLang/Python/dnabarcoder/alldata/yeastITS2_2023
../../aidscripts/selectsequences.py -i yeastITS2.fasta -c yeastITS2.classification -rank species -o yeastITS2.species.fasta
../../aidscripts/selectsequences.py -i yeastITS2.fasta -c yeastITS2.classification -rank genus -o yeastITS2.genus.fasta
../../aidscripts/selectsequences.py -i yeastITS2.fasta -c yeastITS2.classification -rank family -o yeastITS2.family.fasta
../../aidscripts/selectsequences.py -i yeastITS2.fasta -c yeastITS2.classification -rank order -o yeastITS2.order.fasta
../../aidscripts/selectsequences.py -i yeastITS2.fasta -c yeastITS2.classification -rank class -o yeastITS2.class.fasta
../../dnabarcoder.py length -i yeastITS2.fasta -l 50
../../dnabarcoder.py overview -i yeastITS2.fasta -c yeastITS2.classification
../../dnabarcoder.py sim -i yeastITS2.fasta -ml 50
../../dnabarcoder.py variation -i yeastITS2.fasta -c yeastITS2.classification -rank class,order,family,genus,species -ml 50 -sim dnabarcoder/yeastITS2.sim
../../dnabarcoder.py remove -i yeastITS2.species.fasta -c yeastITS2.classification -rank species -sim dnabarcoder/yeastITS2.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastITS2.species.diff.fasta -c yeastITS2.classification -ml 50 -st 0.9 -et 1 -s 0.001 -rank species -prefix yeastITS2 -sim dnabarcoder/yeastITS2.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastITS2.species.diff.fasta -c yeastITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank species -prefix yeastITS2 -higherrank genus,family,order,class,phylum -sim dnabarcoder/yeastITS2.sim -mingroupno 10 -maxproportion 0.9 -mincutoff 0.7
../../dnabarcoder.py predict -i yeastITS2.genus.fasta -c yeastITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -prefix yeastITS2
../../dnabarcoder.py predict -i yeastITS2.genus.fasta -c yeastITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -higherrank family,order,class,phylum -prefix yeastITS2 -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.family.fasta -c yeastITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -prefix yeastITS2
../../dnabarcoder.py predict -i yeastITS2.family.fasta -c yeastITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -higherrank order,class,phylum -prefix yeastITS2 -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.order.fasta -c yeastITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -prefix yeastITS2
../../dnabarcoder.py predict -i yeastITS2.order.fasta -c yeastITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -higherrank class,phylum -prefix yeastITS2 -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.class.fasta -c yeastITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -prefix yeastITS2
../../dnabarcoder.py predict -i yeastITS2.class.fasta -c yeastITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -higherrank phylum -prefix yeastITS2 -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.fasta -c yeastITS2.classification -rank species,genus,family,order,class 
../../dnabarcoder.py predict -i yeastITS2.fasta -c yeastITS2.classification -rank species -higherrank genus -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.fasta -c yeastITS2.classification -rank genus -higherrank family -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.fasta -c yeastITS2.classification -rank family -higherrank order -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.fasta -c yeastITS2.classification -rank order -higherrank class -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastITS2.fasta -c yeastITS2.classification -rank class -higherrank phylum -mingroupno 10 -maxproportion 0.9
../../dnabarcoder.py visualize -i yeastITS2.fasta  -c yeastITS2.classification -rank class -n 8 -size 0.3
../../dnabarcoder.py best -i dnabarcoder/yeastITS2.cutoffs.json -c yeastITS2.classification 

