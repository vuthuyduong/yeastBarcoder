#!/bin/bash
cd /home/dvu/data/data2/cephstorage/ProgLang/Python/dnabarcoder/alldata/yeastLSU_2023
../../aidscripts/selectsequences.py -i yeastLSU.fasta -c yeastLSU.classification -rank species -o yeastLSU.species.fasta
../../aidscripts/selectsequences.py -i yeastLSU.fasta -c yeastLSU.classification -rank genus -o yeastLSU.genus.fasta
../../aidscripts/selectsequences.py -i yeastLSU.fasta -c yeastLSU.classification -rank family -o yeastLSU.family.fasta
../../aidscripts/selectsequences.py -i yeastLSU.fasta -c yeastLSU.classification -rank order -o yeastLSU.order.fasta
../../aidscripts/selectsequences.py -i yeastLSU.fasta -c yeastLSU.classification -rank class -o yeastLSU.class.fasta
../../dnabarcoder.py length -i yeastLSU.fasta -l 100
../../dnabarcoder.py overview -i yeastLSU.fasta -c yeastLSU.classification
../../dnabarcoder.py krona -i yeastLSU.classification
../../dnabarcoder.py sim -i yeastLSU.fasta -ml 400
../../dnabarcoder.py variation -i yeastLSU.fasta -c yeastLSU.classification -rank class,order,family,genus,species -ml 400 -sim dnabarcoder/yeastLSU.sim
../../dnabarcoder.py remove -i yeastLSU.species.fasta -c yeastLSU.classification -rank species -sim dnabarcoder/yeastLSU.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastLSU.species.diff.fasta -c yeastLSU.classification -st 0.9 -et 1 -s 0.001 -rank species -prefix yeastLSU -sim dnabarcoder/yeastLSU.sim
../../dnabarcoder.py predict -i dnabarcoder/yeastLSU.species.diff.fasta -c yeastLSU.classification -st 0.7 -et 1 -s 0.001 -rank species -prefix yeastLSU -higherrank genus,family,order,class,phylum -sim dnabarcoder/yeastLSU.sim  -mingroupno 10 -maxproportion 0.9 -mincutoff 0.7
../../dnabarcoder.py predict -i yeastLSU.genus.fasta -c yeastLSU.classification -st 0.7 -et 1 -s 0.001 -rank genus -prefix yeastLSU -mingroupno 5
../../dnabarcoder.py predict -i yeastLSU.genus.fasta -c yeastLSU.classification -st 0.7 -et 1 -s 0.001 -rank genus -higherrank family,order,class,phylum -prefix yeastLSU -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastLSU.family.fasta -c yeastLSU.classification -st 0.5 -et 1 -s 0.001 -rank family -prefix yeastLSU
../../dnabarcoder.py predict -i yeastLSU.family.fasta -c yeastLSU.classification -st 0.5 -et 1 -s 0.001 -rank family -higherrank order,class,phylum -prefix yeastLSU -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastLSU.order.fasta -c yeastLSU.classification -st 0.5 -et 1 -s 0.001 -rank order -prefix yeastLSU
../../dnabarcoder.py predict -i yeastLSU.order.fasta -c yeastLSU.classification -st 0.5 -et 1 -s 0.001 -rank order -higherrank class,phylum -prefix yeastLSU -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastLSU.class.fasta -c yeastLSU.classification -st 0.5 -et 1 -s 0.001 -rank class -prefix yeastLSU
../../dnabarcoder.py predict -i yeastLSU.class.fasta -c yeastLSU.classification -st 0.5 -et 1 -s 0.001 -rank class -higherrank phylum -prefix yeastLSU -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastLSU.fasta -c yeastLSU.classification -rank species,genus,family,order,class 
../../dnabarcoder.py predict -i yeastLSU.fasta -c yeastLSU.classification -rank species -higherrank genus -mingroupno 10 -maxproportion 0.9 -mincutoff 0.7
../../dnabarcoder.py predict -i yeastLSU.fasta -c yeastLSU.classification -rank genus -higherrank family -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastLSU.fasta -c yeastLSU.classification -rank family -higherrank order -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastLSU.fasta -c yeastLSU.classification -rank order -higherrank class -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py predict -i yeastLSU.fasta -c yeastLSU.classification -rank class -higherrank phylum -mingroupno 5 -maxproportion 0.9
../../dnabarcoder.py visualize -i yeastLSU.fasta  -c yeastLSU.classification -rank class -n 8 -size 0.3
../../dnabarcoder.py best -i dnabarcoder/yeastLSU.cutoffs.json -c yeastLSU.classification 

