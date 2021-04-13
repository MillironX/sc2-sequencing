# StarLIMS Data Pull

Pulls positive SC2 sample IDs and relevant dates from StarLIMS.

**NOTE:** These scripts are encrypted, but are generally intended for use on
Windows machines. Decrypt them on a Linux/Mac machine using the [entire repo
instructions](https://github.com/MillironX/wphl-bioinformatics/blob/master/README.md),
then copy over using a secure flash drive or similar method.

## Usage

Double-click `refresh-lims-data.bat` in any location.

## Installation

This script requires
[Miniconda](https://conda.io/en/master/miniconda.html#windows-installers).

1. Download and install Miniconda
    1. Select "Just Me" when asked who to install for
    2. All other default options will work
2. Press `Win+R`, type `%USERPROFILE%` and press Enter
3. Create a new folder called `limsdatapull`
4. Copy all of the decrypted files to `limsdatapull`
5. Open Anaconda console (not PowerShell) from the Start Menu
6. Run `conda create -n limsdatapull -f
   %USERPROFILE%\limsdatapull\limsdatapull.yaml`
7. Answer `y` to all the prompts
8. Close the console
9. (Optional) Copy `refresh-lims-data.bat` to the Desktop
10. (Optional) Set up a scheduled task to run `refresh-lims-data.bat` regularly

When `refresh-lims-data.bat` is run, a new file called `SequenceDatabase.xlsx`
will be added to `limsdatapull`. This file can be referenced by other
spreadsheets for efficient and timely lookup data from StarLIMS.
