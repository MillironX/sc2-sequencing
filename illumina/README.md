# Illumina

This script downloads all FASTQs associated with a specific Run ID from Illumina's Basespace.

## Usage

To be run in Cygwin

```bash
$ dl-fastqs.sh
```

The script will prompt for a Run ID. Copy the Run ID from the URL in Illumina Basespace.

![Illumina Basespace](https://user-images.githubusercontent.com/25492070/113320967-59a88000-92d0-11eb-967c-6b338e247ca5.png)

Note that Ctrl+V does not paste in either Cygwin or Windows terminals. Use right-click, instead.

## Installation

This script requires [Cygwin](https://cygwin.com/install.html). The install process is complicated thanks to requiring native features of both Windows and Cygwin.

1. Download and install Cygwin
    1. Select "Just Me" when asked who to install for
    2. Find and add the latest version of the "git" and "xargs" packages
    3. All other default options will work
2. Press `Win+X`, then `I` to open a new PowerShell window
3. Run `wget  "https://api.bintray.com/content/basespace/BaseSpaceCLI-EarlyAccess-BIN/latest/\$latest/amd64-windows/bs.exe?bt_package=latest" -O $env:LOCALAPPDATA\Microsoft\WindowsApps\bs.exe`
4. Close PowerShell
5. Open Cygwin Console and run

```bash
$ BS=$(cygpath "C:\Users\\$USER\AppData\Local\Microsoft\WindowsApps\bs.exe")
$ $BS auth
```
6. Copy the given link, navigate to it in a browser, and login to Illumina Basespace
7. In Cygwin console now run

```bash
$ git clone https://github.com/MillironX/wphl-bioinformatics.git
$ cp wphl-bioinformatics/illumina/dl-fastqs.sh ~
$ chmod +x dl-fastqs.sh
```

8. Right-click the Windows desktop, and click "New | Shortcut..."
9. Type `C:\cygwin64\bin\bash.exe` and click Next
10. Type `Download Illumina Run` or something else memorable and click "Finish"
11. Right-click the newly created shortcut and click Properties
12. In the Target textbox, add ` --login dl-fastqs.sh` (including the space) to the existing text
13. Click OK



