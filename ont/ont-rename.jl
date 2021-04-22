#!/usr/bin/julia
# Renames the FASTQ files in a directory by prepending the well number based on
# a MiSeq run workbook

# Activate the proper packages
using Tk
import XLSX
using DataFrames
using Missings

# Prompt for the folder containing the FASTQs
fastq_folder = ChooseDirectory()

# Prompt for the Illumina workbook containing the well info
ont_workbook = GetOpenFile()

# Read in the excel file
xf = XLSX.readdata(ont_workbook, "Run Worksheet!B9:D56")
fastq_ids = DataFrame(xf, :auto)
rename!(fastq_ids, Symbol.(["SampleId", "Taxa", "Barcode"]))
dropmissing!(fastq_ids)
fastq_ids = string.(fastq_ids)

# Truncate the barcode number
fastq_ids.Barcode = last.(fastq_ids.Barcode, 2)

# Get all of the files
fastqs = readdir(fastq_folder)

# Find the FAP number somewhere in the excel workbook
# (The workbooks are not very uniform, so we need to go hunting)
fap_search = XLSX.readdata(ont_workbook, 1, "D1:K20")
fap_search = string.(skipmissing(fap_search))
fap_xl = ""
for fap in fap_search
    global fap_xl
    if first(fap, 3) == "FAP"
        fap_xl = fap
        continue
    end
end

# Check if the FAP numbers from the directory and the Excel workbook match
fap_fl = split(fastqs[1], "_")[1]
if fap_fl != fap_xl
    # Yikes! They don't match! Check if the user is ok with that
    proceed = Messagebox(message=string(fap_fl,
                                        " from the file system doesn't match ",
                                        fap_xl,
                                        " from the workbook. ",
                                        "You might be renaming the wrong files. ",
                                        "Rename anyway?"))

    # The user clicked "cancel"
    if proceed == "cancel"
        exit()
    end

end

# Iterate through each file
for fastq in fastqs
    # Get the full path
    fastq_path = joinpath(fastq_folder, fastq)

    # Pull the barcode number and FAP number based on the file name
    # The file name is divided into 5 chucks separated by underscores,
    # The barcode number is the last two characters of the third chunk
    FAP = split(fastq, "_")[1]
    bc = last(split(fastq, "_")[3], 2)

    # Find this id in the workbook
    id_row = fastq_ids[fastq_ids.Barcode .== bc,:]

    # If there are no matches, keep going
    if size(id_row)[1] < 1
        continue
    end

    # Construct the new filename
    fastq_newname = string(FAP, "_pass_", id_row.SampleId[1], ".fastq.gz")

    # Rename the file
    mv(fastq_path, joinpath(fastq_folder, fastq_newname))
    println(string("Renaming ", fastq_path, " to ", joinpath(fastq_folder, fastq_newname)))

end
