#!/usr/bin/julia
# Renames the FASTQ files in a directory by prepending the well number

# Activate the proper packages
using Tk
import XLSX
using DataFrames
using Missings

# Prompt for the folder containing the FASTQs
fastq_folder = ChooseDirectory()

# Prompt for the Illumina workbook containing the well info
illumina_workbook = GetOpenFile()

# Read in the excel file
xf = XLSX.readdata(illumina_workbook, "IEM_SampleSheet!B19:D300")
fastq_ids = DataFrame(xf, :auto)
rename!(fastq_ids, Symbol.(["SampleId", "RunName", "WellNum"]))
dropmissing!(fastq_ids)
fastq_ids = string.(fastq_ids)

# Get all of the files
fastqs = readdir(fastq_folder)

# Iterate through each file
for fastq in fastqs
    # Get the full path
    fastq_path = joinpath(fastq_folder, fastq)

    # Delete if this is a JSON file
    if last(fastq,5) == ".json"
        rm(fastq_path)
        println(string("Deleting ", fastq_path))
        continue
    end

    # Pull the id based on the file name
    id = first(fastq,21)

    # Find this id in the workbook
    id_row = fastq_ids[fastq_ids.SampleId .== id,:]

    # If there are no matches, keep going
    if size(id_row)[1] < 1
        continue
    end

    # Swap the column and row
    well_num = string(last(id_row.WellNum[1],1), first(id_row.WellNum[1],1))

    # Construct the new filename
    fastq_newname = string(well_num, "_", fastq)

    # Rename the file
    mv(fastq_path, joinpath(fastq_folder, fastq_newname))
    println(string("Renaming ", fastq_path, " to ", joinpath(fastq_folder, fastq_newname)))

end
