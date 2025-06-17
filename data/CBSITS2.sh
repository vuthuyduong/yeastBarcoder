#!/bin/bash
../dnabarcoder/aidscripts/selectsequences.py -i CBSITS2.fasta -c CBSITS2.classification -rank species -o CBSITS2.species.fasta
../dnabarcoder/aidscripts/selectsequences.py -i CBSITS2.fasta -c CBSITS2.classification -rank genus -o CBSITS2.genus.fasta
../dnabarcoder/aidscripts/selectsequences.py -i CBSITS2.fasta -c CBSITS2.classification -rank family -o CBSITS2.family.fasta
../dnabarcoder/aidscripts/selectsequences.py -i CBSITS2.fasta -c CBSITS2.classification -rank order -o CBSITS2.order.fasta
../dnabarcoder/aidscripts/selectsequences.py -i CBSITS2.fasta -c CBSITS2.classification -rank class -o CBSITS2.class.fasta
../dnabarcoder/dnabarcoder.py length -i CBSITS2.fasta -l 50
../dnabarcoder/dnabarcoder.py overview -i CBSITS2.fasta -c CBSITS2.classification
../dnabarcoder/dnabarcoder.py sim -i CBSITS2.fasta -ml 50
../dnabarcoder/dnabarcoder.py variation -i CBSITS2.fasta -c CBSITS2.classification -rank class,order,family,genus,species -ml 50 -sim dnabarcoder/CBSITS2.sim
../dnabarcoder/dnabarcoder.py remove -i CBSITS2.species.fasta -c CBSITS2.classification -rank species -sim dnabarcoder/CBSITS2.sim
../dnabarcoder/dnabarcoder.py predict -i dnabarcoder/CBSITS2.species.diff.fasta -c CBSITS2.classification -ml 50 -st 0.9 -et 1 -s 0.001 -rank species -prefix CBSITS2 -sim dnabarcoder/CBSITS2.sim
../dnabarcoder/dnabarcoder.py predict -i dnabarcoder/CBSITS2.species.diff.fasta -c CBSITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank species -prefix CBSITS2 -higherrank genus,family,order,class,phylum -sim dnabarcoder/CBSITS2.sim -mingroupno 10 -maxproportion 0.9 -mincutoff 0.7
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.genus.fasta -c CBSITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -prefix CBSITS2
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.genus.fasta -c CBSITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -higherrank family,order,class,phylum -prefix CBSITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.family.fasta -c CBSITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -prefix CBSITS2
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.family.fasta -c CBSITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -higherrank order,class,phylum -prefix CBSITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.order.fasta -c CBSITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -prefix CBSITS2
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.order.fasta -c CBSITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -higherrank class,phylum -prefix CBSITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.class.fasta -c CBSITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -prefix CBSITS2
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.class.fasta -c CBSITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -higherrank phylum -prefix CBSITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.fasta -c CBSITS2.classification -rank species,genus,family,order,class 
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.fasta -c CBSITS2.classification -rank species -higherrank genus -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.fasta -c CBSITS2.classification -rank genus -higherrank family -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.fasta -c CBSITS2.classification -rank family -higherrank order -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.fasta -c CBSITS2.classification -rank order -higherrank class -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i CBSITS2.fasta -c CBSITS2.classification -rank class -higherrank phylum -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py visualize -i CBSITS2.fasta  -c CBSITS2.classification -rank class -n 8 -size 0.3
../dnabarcoder/dnabarcoder.py best -i dnabarcoder/CBSITS2.cutoffs.json -c CBSITS2.classification 

