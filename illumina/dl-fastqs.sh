#!/bin/bash
# Downloads all FASTQs from a given run in cygwin

# Get a cygwin-compatible reference to the basespace executable
BS=$(cygpath "C:\Users\\$USER\AppData\Local\Microsoft\WindowsApps\bs.exe")

# Prompt the user for the run id
read -p 'Illumina Run id (not run name): ' RUNID

# Make sure the path we want to download to exists
mkdir -p /cygdrive/c/basespace-dl

# Download the files
# This monster started off from https://groups.google.com/g/basespace-developers/c/akQ0LVxxuR8/m/DhkA_4dBBAAJ
$BS list dataset --input-run $RUNID --terse | \
  xargs -n1 -I{} $BS dataset download --id {} -o $(cygpath -w /cygdrive/c/basespace-dl/$RUNID)

# Keep things open, in case we want to read the logs
read -p 'Downloads completed. Press ENTER to close. ' FOO
