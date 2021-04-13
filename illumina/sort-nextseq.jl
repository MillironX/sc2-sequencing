#!/usr/bin/julia
# Renames the FASTQ files in a directory by prepending the sample number based
# on the embedded sample number

# Activate the proper packages
using Tk

# Prompt for the folder containing the FASTQs
fastq_folder = ChooseDirectory()

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

    # Find the sample number in the filename
    startS = findfirst("_S", fastq)
    startL = findfirst("_L", fastq)

    # Extract the sample number
    sampleId = fastq[(startS[1]+1):(startL[1]-1)]

    # Convert the number to three digits, no matter what
    sampleNum = parse(Int64, sampleId[2:end])
    sampleId = string("S", lpad(sampleNum, 3, "0"))

    # Construct the new filename
    fastq_newname = string(sampleId, "_", fastq)

    # Rename the file
    mv(fastq_path, joinpath(fastq_folder, fastq_newname))
    println(string("Renaming ", fastq_path, " to ", joinpath(fastq_folder, fastq_newname)))

end
