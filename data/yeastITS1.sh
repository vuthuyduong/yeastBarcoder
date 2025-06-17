#!/bin/bash
../dnabarcoder/aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank species -o yeastITS1.species.fasta
../dnabarcoder/aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank genus -o yeastITS1.genus.fasta
../dnabarcoder/aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank family -o yeastITS1.family.fasta
../dnabarcoder/aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank order -o yeastITS1.order.fasta
../dnabarcoder/aidscripts/selectsequences.py -i yeastITS1.fasta -c yeastITS1.classification -rank class -o yeastITS1.class.fasta
../dnabarcoder/dnabarcoder.py length -i yeastITS1.fasta -l 50
../dnabarcoder/dnabarcoder.py krona -i yeastITS1.classification
../dnabarcoder/dnabarcoder.py overview -i yeastITS1.fasta -c yeastITS1.classification
../dnabarcoder/dnabarcoder.py sim -i yeastITS1.fasta -ml 50
../dnabarcoder/dnabarcoder.py variation -i yeastITS1.fasta -c yeastITS1.classification -rank class,order,family,genus,species -ml 50 -sim dnabarcoder/yeastITS1.sim 
../dnabarcoder/dnabarcoder.py remove -i yeastITS1.species.fasta -c yeastITS1.classification -rank species -sim dnabarcoder/yeastITS1.sim
../dnabarcoder/dnabarcoder.py predict -i dnabarcoder/yeastITS1.species.diff.fasta -c yeastITS1.classification -ml 50 -st 0.9 -et 1 -s 0.001 -rank species -prefix yeastITS1 -sim dnabarcoder/yeastITS1.sim
../dnabarcoder/dnabarcoder.py predict -i dnabarcoder/yeastITS1.species.diff.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank species -prefix yeastITS1 -higherrank genus,family,order,class,phylum -sim dnabarcoder/yeastITS1.sim -mingroupno 10 -maxproportion 0.9 -mincutoff 0.7
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.genus.fasta -c yeastITS1.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -prefix yeastITS1
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.genus.fasta -c yeastITS1.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -higherrank family,order,class,phylum -prefix yeastITS1 -mingroupno 10  -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.family.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -prefix yeastITS1
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.family.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -higherrank order,class,phylum -prefix yeastITS1 -mingroupno 10  -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.order.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -prefix yeastITS1
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.order.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -higherrank class,phylum -prefix yeastITS1 -mingroupno 10  -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.class.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -prefix yeastITS1
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.class.fasta -c yeastITS1.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -higherrank phylum -prefix yeastITS1 -mingroupno 10  -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank species,genus,family,order,class 
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank species -higherrank genus -mingroupno 10 -maxproportion 0.9 -mincutoff 0.7
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank genus -higherrank family -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank family -higherrank order -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank order -higherrank class -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i yeastITS1.fasta -c yeastITS1.classification -rank class -higherrank phylum -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py visualize -i yeastITS1.fasta  -c yeastITS1.classification -rank class -n 8 -size 0.3
../dnabarcoder/dnabarcoder.py best -i dnabarcoder/yeastITS1.cutoffs.json -c yeastITS1.classification

