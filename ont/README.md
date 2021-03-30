# Oxford Nanopore Technologies

These scripts are for use with a GridION, to make the files and folder structures correspond more closely to those required by downstream bioinformatics programs.
Note that at the time of writing, the GridION runs Ubuntu 16.04 LTS, and mounts USB drives in the `/data` folder, and these scripts contain some "faults" to work around these idiosyncrasies.

## File Descriptors

### `ont-demux`

```bash
$ ont-demux FAP_FOLDER
```

Consolidates all FAST5s into a single gzipped FASTQ using ONT's `guppy_barcoder`. Note that this is for MinKNOW's default settings of 4000 reads/file. It is _highly_ recommended to set the "Number of Reads per File" entry in MinKNOW to 0, and checking "Compress FASTQs" to produce nearly the same results.

### `ont-transfer`

```bash
$ ont-transfer [-s 1|6|12] FAP_FOLDER
```

Transfers all of the passing FAST5 and FASTQ files to the first available USB drive, skipping empty barcodes based on the number of the first skip passed through the `-s` parameter, consolidating all files of the same type into one folder for easier sorting and uploading.

## Installation

### Requirements

- git
- guppy (Get from [ONT Community](https://nanoporetech.com/community)
- GNU Parallel

See ONT for guppy installation instructions. Others may be installed by opening a terminal and running

```bash
$ sudo apt-get install git parallel -y
```

### Instructions

Open a terminal (Ctrl+Alt+T), and use the following commands

```bash
git clone https://github.com/MillironX/wphl-bioinformatics
mkdir ~/bin
echo "export PATH=$PATH:$HOME/bin" >> ~/.bashrc
cp wphl-bioinformatics/ont/* ~/bin
chmod +x ~/bin/*
source ~/.bashrc
```
