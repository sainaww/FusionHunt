#!/bin/bash
# usage: 
# First, load modules using the following command: (in your terminal)
# source project/src/load_module.sh
# Second, run this file in the format:
# source YOUR_DIR_TO_THIS_FILE/run.sh YOUR_DIR_TO_GENOME/GENOME_FILE YOUR_DIR_TO_FASTA/FASTA_FILE
# The result will be in result.psl.

# TODO: the repeat masker hasn't been implemented

# ----------------------------------------------------------
GENOME_FILE=$1
FASTA_FILE=$2
echo "Hello my dear teammates in 03713! You are running tandem finder -- > GMAP, using genome file: $GENOME_FILE, fasta file: $FASTA_FILE"
printf "\n\nLet's run the tests --------------------------------------\n\n"
source ./project/src/load_module.sh

trf $FASTA_FILE 2 7 7 80 10 50 500 -f -d -m

printf "\n\nTandem Repeat Find for $FASTA_FILE Complete.\n\n"

EXTENSION=".2.7.7.80.10.50.500.mask"
FASTA_FILE="$FASTA_FILE$EXTENSION"
# RepeatMasker -pa 10000 -q -a $FASTA_FILE
# echo "Interspersed Repeat Find for $FASTA_FILE Complete."

gmap -g $GENOME_FILE -f 1 $FASTA_FILE > result.psl
printf "\n\nGMAP finishes. The result is in result.psl.\n\n"
