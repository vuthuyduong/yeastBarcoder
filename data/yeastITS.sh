#!/bin/bash
cd /home/dvu/data/data2/cephstorage/ProgLang/Python/dnabarcoder/alldata/yeastITS_2023
../../aidscripts/selectsequences.py -i yeastITS.fasta -c yeastITS.classification -rank species -o yeastITS.species.fasta
../../aidscripts/selectsequences.py -i yeastITS.fasta -c yeastITS.classification -rank genus -o yeastITS.genus.fasta
../../aidscripts/selectsequences.py -i yeastITS.fasta -c yeastITS.classification -rank family -o yeastITS.family.fasta
../../aidscripts/selectsequences.py -i yeastITS.fasta -c yeastITS.classification -rank order -o yeastITS.order.fasta
../../aidscripts/selectsequences.py -i yeastITS.fasta -c yeastITS.classification -rank class -o yeastITS.class.fasta
../../dnabarcoder.py length -i yeastITS.fasta -l 100
../../dnabarcoder.py overview -i yeastITS.fasta -c yeastITS.classification
../../dnabarcoder.py krona -i yeastITS.classification
../../dnabarcoder.py sim -i yeastITS.fasta -ml 400
../../dnabarcoder.py variation -i yeastITS.fasta -c yeastITS.classification -rank class,order,family,genus,species -ml 400 -sim dnabarcoder/yeastITS.sim
../../dnabarcoder.py remove -i yeastITS.species.fasta -c yeastITS.classification -rank species -sim dnabarcoder/yeastITS.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastITS.species.diff.fasta -c yeastITS.classification -st 0.9 -et 1 -s 0.001 -rank species -prefix yeastITS -sim dnabarcoder/yeastITS.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastITS.species.diff.fasta -c yeastITS.classification -st 0.7 -et 1 -s 0.001 -rank species -prefix yeastITS -higherrank genus,family,order,class,phylum -sim dnabarcoder/yeastITS.sim  -mingroupno 5 -maxproportion 0.7 -mincutoff 0.7
../../dnabarcoder.py predict -i yeastITS.genus.fasta -c yeastITS.classification -st 0.7 -et 1 -s 0.001 -rank genus -prefix yeastITS 
../../dnabarcoder.py predict -i yeastITS.genus.fasta -c yeastITS.classification -st 0.7 -et 1 -s 0.001 -rank genus -higherrank family,order,class,phylum -prefix yeastITS -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS.family.fasta -c yeastITS.classification -st 0.6 -et 1 -s 0.001 -rank family -prefix yeastITS
../../dnabarcoder.py predict -i yeastITS.family.fasta -c yeastITS.classification -st 0.6 -et 1 -s 0.001 -rank family -higherrank order,class,phylum -prefix yeastITS -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS.order.fasta -c yeastITS.classification -st 0.5 -et 1 -s 0.001 -rank order -prefix yeastITS
../../dnabarcoder.py predict -i yeastITS.order.fasta -c yeastITS.classification -st 0.5 -et 1 -s 0.001 -rank order -higherrank class,phylum -prefix yeastITS -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS.class.fasta -c yeastITS.classification -st 0.5 -et 1 -s 0.001 -rank class -prefix yeastITS
../../dnabarcoder.py predict -i yeastITS.class.fasta -c yeastITS.classification -st 0.5 -et 1 -s 0.001 -rank class -higherrank phylum -prefix yeastITS -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS.fasta -c yeastITS.classification -rank genus,family,order,class 
../../dnabarcoder.py predict -i yeastITS.fasta -c yeastITS.classification -rank species -higherrank genus -mingroupno 10 -maxproportion 0.7 -mincutoff 0.7
../../dnabarcoder.py predict -i yeastITS.fasta -c yeastITS.classification -rank genus -higherrank family -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS.fasta -c yeastITS.classification -rank family -higherrank order -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS.fasta -c yeastITS.classification -rank order -higherrank class -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py predict -i yeastITS.fasta -c yeastITS.classification -rank class -higherrank phylum -mingroupno 5 -maxproportion 0.7
../../dnabarcoder.py visualize -i yeastITS.fasta  -c yeastITS.classification -rank class -n 8 -size 0.3
../../dnabarcoder.py best -i dnabarcoder/yeastITS.cutoffs.json -c yeastITS.classification -mincutoff 0.7 
