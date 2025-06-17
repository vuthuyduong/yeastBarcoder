#!/bin/bash
../dnabarcoder/aidscripts/selectsequences.py -i filfungalITS2.fasta -c filfungalITS2.classification -rank species -o filfungalITS2.species.fasta
../dnabarcoder/aidscripts/selectsequences.py -i filfungalITS2.fasta -c filfungalITS2.classification -rank genus -o filfungalITS2.genus.fasta
../dnabarcoder/aidscripts/selectsequences.py -i filfungalITS2.fasta -c filfungalITS2.classification -rank family -o filfungalITS2.family.fasta
../dnabarcoder/aidscripts/selectsequences.py -i filfungalITS2.fasta -c filfungalITS2.classification -rank order -o filfungalITS2.order.fasta
../dnabarcoder/aidscripts/selectsequences.py -i filfungalITS2.fasta -c filfungalITS2.classification -rank class -o filfungalITS2.class.fasta
../dnabarcoder/dnabarcoder.py length -i filfungalITS2.fasta -l 50
../dnabarcoder/dnabarcoder.py overview -i filfungalITS2.fasta -c filfungalITS2.classification
../dnabarcoder/dnabarcoder.py sim -i filfungalITS2.fasta -ml 50
../dnabarcoder/dnabarcoder.py variation -i filfungalITS2.fasta -c filfungalITS2.classification -rank class,order,family,genus,species -ml 50 -sim dnabarcoder/filfungalITS2.sim
../dnabarcoder/dnabarcoder.py remove -i filfungalITS2.species.fasta -c filfungalITS2.classification -rank species -sim dnabarcoder/filfungalITS2.sim
../dnabarcoder/dnabarcoder.py predict -i dnabarcoder/filfungalITS2.species.diff.fasta -c filfungalITS2.classification -ml 50 -st 0.9 -et 1 -s 0.001 -rank species -prefix filfungalITS2 -sim dnabarcoder/filfungalITS2.sim
../dnabarcoder/dnabarcoder.py predict -i dnabarcoder/filfungalITS2.species.diff.fasta -c filfungalITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank species -prefix filfungalITS2 -higherrank genus,family,order,class,phylum -sim dnabarcoder/filfungalITS2.sim -mingroupno 10 -maxproportion 0.9 -mincutoff 0.7
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.genus.fasta -c filfungalITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -prefix filfungalITS2
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.genus.fasta -c filfungalITS2.classification -ml 50 -st 0.7 -et 1 -s 0.001 -rank genus -higherrank family,order,class,phylum -prefix filfungalITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.family.fasta -c filfungalITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -prefix filfungalITS2
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.family.fasta -c filfungalITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank family -higherrank order,class,phylum -prefix filfungalITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.order.fasta -c filfungalITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -prefix filfungalITS2
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.order.fasta -c filfungalITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank order -higherrank class,phylum -prefix filfungalITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.class.fasta -c filfungalITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -prefix filfungalITS2
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.class.fasta -c filfungalITS2.classification -ml 50 -st 0.5 -et 1 -s 0.001 -rank class -higherrank phylum -prefix filfungalITS2 -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.fasta -c filfungalITS2.classification -rank species,genus,family,order,class 
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.fasta -c filfungalITS2.classification -rank species -higherrank genus -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.fasta -c filfungalITS2.classification -rank genus -higherrank family -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.fasta -c filfungalITS2.classification -rank family -higherrank order -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.fasta -c filfungalITS2.classification -rank order -higherrank class -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py predict -i filfungalITS2.fasta -c filfungalITS2.classification -rank class -higherrank phylum -mingroupno 10 -maxproportion 0.9
../dnabarcoder/dnabarcoder.py visualize -i filfungalITS2.fasta  -c filfungalITS2.classification -rank class -n 8 -size 0.3
../dnabarcoder/dnabarcoder.py best -i dnabarcoder/filfungalITS2.cutoffs.json -c filfungalITS2.classification 

