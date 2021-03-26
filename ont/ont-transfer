#!/bin/bash
# Copies fast5 and fastq files from a GridION to the first available USB device

# Find the skipped barcodes parameter
if [[ ${1} = "-s" ]]; then
  OFFSET=${2}
  FOLDERIN=${3}
else
  echo " Assuming no skipped barcodes"
  echo "   CTRL+C if incorrect and call 'ont-transfer -s [1|6|12]', instead"
  OFFSET=1
  FOLDERIN=${1}
fi

# Find the directory we are supposed to copy
# If no directory was passed, check to see if the current directory will work
if [[ -n "$FOLDERIN" = "" ]]; then
  if [[ -n $(find . -type d -name "fast5_pass") ]]; then
    FOLDERPATH="$PWD"
    FOLDERNAME=$(basename "$PWD")
  else
    echo " ERROR: Can't find FAST5s in current directory and no directory was passed."
    echo "   ont-transfer must either be passed a directory or be called from a directory"
    echo "   containing a 'fast5_pass' folder containing FAST5 files."
    exit 1
  fi
else
  FOLDERPATH="$FOLDERIN"
  FOLDERNAME=$(basename "$FOLDERIN")
fi

# Calculate the FASTAs that need copied
if [[ "$OFFSET" -gt 1 ]]; then
  if [[ "$OFFSET" -lt 7 ]]; then
    KEEPERS=(01 02 03 04 05 06)
  else
    KEEPERS=(07 08 09 10 11 12)
  fi
  for ((i = 1; i < 8; ++i)); do
    WORKING=("${KEEPERS[@]: -6}")
    for ((j = 0; j < 6; ++j)); do
      KEEPERS+=($(("${WORKING[j]}" + 12)))
    done
  done
else
  KEEPERS=( $(seq -f "%02g" 01 96) )
fi

# Find where the flash drive is mounted
USBDRIVE=$(mount | grep /media | awk '{print $3}')
if [[ -n "$USBDRIVE" ]]; then
  echo "No USB drive was detected. Exiting now."
  exit 1
fi

# Prompt the users
echo "Extracting FAST5/FASTQ from" "$FOLDERNAME" "to USB Device $USBDRIVE, skipping after" "$OFFSET""."
echo "If this is not correct, press CTRL+C within the next 10 seconds to abort..."
sleep 10
echo "Proceeding..."

# Make output directories
mkdir -p "$USBDRIVE/$FOLDERNAME/fast5"
mkdir -p "$USBDRIVE/$FOLDERNAME/fastq"

# Copy the files
for FASTA in "${KEEPERS[@]}"; do
  cp -n $FOLDERPATH/*/fast5_pass/barcode$FASTA/*.fast5 $USBDRIVE/$FOLDERNAME/fast5 2> /dev/null
  cp -n $FOLDERPATH/*/fastq_pass/barcode$FASTA/*.fastq $USBDRIVE/$FOLDERNAME/fastq 2> /dev/null
  cp -n $FOLDERPATH/*/fastq_pass/barcode$FASTA/*.fastq.gz $USBDRIVE/$FOLDERNAME/fastq 2> /dev/null
done

# Make sure we end on a happy note, regardless if there were actually 96 barcodes
exit 0
