# Oxford Nanopore Technologies

These scripts are for use with a GridION or its output file, to make the files
and folder structures correspond more closely to those required by downstream
bioinformatics programs. Note that at the time of writing, the GridION runs
Ubuntu 16.04 LTS, and mounts USB drives in the `/data` folder, and these scripts
contain some "faults" to work around these idiosyncrasies (i.e. they will not
pass in [ShellCheck]).

## Usage

### `ont-transfer`

```bash
ont-transfer [-s 1|6|12] FAP_FOLDER
```

Transfers all of the passing FAST5 and FASTQ files to the first available USB
drive, skipping empty barcodes based on the number of the first skip passed
through the `-s` parameter, consolidating all files of the same type into one
folder for easier sorting and uploading, and concatenating and compressing FASTQ
files into one per barcode.

### `ont-rename.jl`

To be run with Julia.

```powershell
julia --project=PATH_TO_ONT_FOLDER PATH_TO_ONT-RENAME.jl
```

In practice, this looks like

```powershell
julia --project=C:\Users\MillironX\ont C:\Users\MillironX\ont\ont-rename.jl
```

### `ont-demux` (deprecated)

```bash
ont-demux FAP_FOLDER
```

**This functionality is now wrapped into `ont-Transfer`, which can produce the
same results using far fewer resources and in far less time.**

Consolidates all FAST5s into a single gzipped FASTQ using ONT's
`guppy_barcoder`. Note that this is for MinKNOW's default settings of 4000
reads/file. ~~It is _highly_ recommended to set the "Number of Reads per File"
entry in MinKNOW to 0, and checking "Compress FASTQs" to produce nearly the same
results~~ (this functionality has been taken out of recent updates to MinKNOW).

## Installation

### `ont-transfer` and `ont-demux`

#### Requirements

- git
- guppy (Get from [ONT Community])
- GNU Parallel

See ONT for guppy installation instructions. Others may be installed by opening
a terminal and running

```bash
sudo apt-get install git parallel -y
```

#### Instructions

Open a terminal (Ctrl+Alt+T), and use the following commands

```bash
git clone https://github.com/MillironX/sc2-sequencing
mkdir ~/bin
echo "export PATH=$PATH:$HOME/bin" >> ~/.bashrc
cp sc2-sequending/ont/* ~/bin
chmod +x ~/bin/*
source ~/.bashrc
```

### `ont-rename`

These scripts require [Julia].

Windows install instructions (I will assume Linux users can adapt):

1. Download and install Julia
    1. Select "Add Julia to PATH" as an option
    2. All other default options will work
2. Download the Repo's ZIP file (click green button on upper-right)
3. Press `Win+R`, type `%USERPROFILE%` and press Enter
4. Copy the ont folder from the ZIP file into the newly opened folder
5. Press `Win+X`, then `I` to open a new PowerShell window
6. Type `julia --project=$env:USERPROFILE\ont` and press Enter
7. Press the `]` key, the prompt should change to say `(ONTRename) pkg>`
8. Run `instantiate`
9. Press the backspace key to return to the `julia>` prompt
10. Run `exit()`
11. Close PowerShell
12. Right-click the Windows desktop, and click "New | Shortcut..."
13. Type `julia --project=%USERPROFILE%\ont %USERPROFILE%\ont\ont-rename.jl` and
    click Next
14. Type `Rename ONT FASTQs` or something else memorable and click "Finish"

[ShellCheck]: https://shellcheck.net
[ONT Community]: https://nanoporetech.com/community
[Julia]: https://julialang.org
