#!/bin/bash
# Untars the ClearLabs bulk download and converts it to a single FASTA suitable
# for online sequence analyzers

# Pull in the tarball name
FASTAFILE=${1}

# Determine what the nasty name is
FASTANAME=$(basename -s .fastas.tar "$FASTAFILE")

# Make a new folder to put everything in
mkdir "$FASTANAME"

# Untar the tarball
tar -xf "$FASTAFILE" -C "$FASTANAME" --force-local

# Smash all of the FASTAs together into a single file
cat "$FASTANAME"/*.fasta > "$FASTANAME"/"$FASTANAME".fasta
