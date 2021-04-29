# ClearLabs

This script converts the FASTA tarball that is downloaded through the ClearLabs
web portal into individual and a collective FASTA file using Cygwin.

## Usage

To be run in Cygwin

```bash
convert-fastas.sh TARBALL
```

## Installation

This script requires [Cygwin](https://cygwin.com/install.html).

1. Download and install Cygwin
    1. Select "Just Me" when asked who to install for
    2. Find and add the latest version of the "git" package when prompted
    3. All other default options will work
2. Open the Cygwin console and use the following commands

    ```bash
    git clone https://github.com/MillironX/sc2-sequencing.git
    cp sc2-sequencing/clearlabs/convert-fastas.sh ~
    chmod +x convert-fastas.sh
    ```

3. Press the Win+R on the keyboard
4. Type `shell:sendto` and press Enter
5. Right-click in the newly opened window, and click "New | Shortcut..."
6. Type `C:\cygwin64\bin\bash.exe` and click Next
7. Type `Convert FASTA Tarball` or something else memorable and click Finish
8. Right-click the newly created shortcut and click Properties
9. In the Target textbox, add a space and `--login convert-fastas.sh` to the
   existing text
10. Click OK

An item will now be added to the Right click | Send to menu for FASTA tarballs.
Once clicked, the extracted tarballs can be found in
`C:\cygwin64\home\<USERNAME>`.
