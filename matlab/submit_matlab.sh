#!/bin/bash
#

########################
##### qsub options #####
########################
#
# Any line starting with #$ is interpreted as command line option for qsub

#### Working directory
#  These options specify the directory where the job is to be executed.
#  The default is your home directory (which you don't want).
#  If you use the -wd option, you need to make sure that directory exists.
#
#$ -cwd                           # Current working directory (where you run qsub)
# #$ -wd /home/me/CoolStuffIsHere # Run job /home/me/CoolStuffIsHere

# Join standard error and output
#$ -j y

# Name of job (and output files)
#$ -N SolveSystem

##### Shell that is used
#$ -S /bin/bash

#### Number of threads
#  If you have a multi-threaded application, you need to specify here how many
#  cores your process uses.
#  Note: You explicitly have to tell you program how many threads to use
#$ -pe smp 1

#### Run time limit
#  Specify maximum CPU time after which job is to be killed (format HH:MM:SS).
#$ -l h_rt=01:00:00

#### Memory limit
#  specifies the maximum amount of memory this job can take
#  This is per thread, so the total amount is this number times the number
#  of threads. The default value is 2g.
#$ -l h_vmem=4g

#########################
##### Your commands #####
#########################

# speficy the name of your matlab batch script
MATLAB_SCRIPT="solve_system.m"

# This is an example how your run matlab code with a single thread.
# Do not change the line below.

matlab -nojvm -nodisplay -singleCompThread -r "try; run('$MATLAB_SCRIPT'); catch me; display(me); end; quit;"

