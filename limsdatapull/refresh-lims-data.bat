rem Set Conda environment stuff up
set CONDAPATH=%USERPROFILE%\miniconda3
set ENVNAME=limsdatapull
set ENVPATH=%CONDAPATH%\envs\%ENVNAME%
set DATAPATH=%USERPROFILE%\limsdatapull

rem Activate the Conda environment
call %CONDAPATH%\Scripts\activate.bat %ENVPATH%

rem Go to the remote drive
cd /D %DATAPATH%

rem Perform the data pull using Python
python updatedata.py

rem Deactivate Conda just in case
call conda deactivate

rem Cleanup all of the temp files
del "Aliquoted Samples.xlsx" "Already Shipped Samples for Sequencing.xlsx" coverage.xlsx df_full.pkl Discarded.xlsx merge.xlsx
