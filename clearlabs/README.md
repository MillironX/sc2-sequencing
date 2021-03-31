# ClearLabs

This script converts the FASTA tarball that is downloaded through the ClearLabs web portal into individual and a collective FASTA file using Cygwin.

## Usage

To be run in Cygwin

```bash
$ convert-fastas.sh TARBALL
```

## Installation

This script requires [Cygwin](https://cygwin.com/install.html).

1. Download and install Cygwin
    1. Select "Just Me" when asked who to install for
    2. Find and add the latest version of the "git" package when prompted
    3. All other default options will work
2. Open the Cygwin console and use the following commands

```bash
$ git clone https://github.com/MillironX/wphl-bioinformatics.git
$ cp wphl-bioinformatics/clearlabs/convert-fastas.sh ~
$ chmod +x convert-fastas.sh
```

3. Press the Win+R on the keyboard
4. Type `shell:sendto` and press Enter
5. Right-click in the newly opened window, and click "New Shortcut"
