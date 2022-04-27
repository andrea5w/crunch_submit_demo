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

# Name of job (and output files)
#$ -N Ampl
# Join standard error and output
#$ -j y

# Set priority (default is 0, smaller values give lower priority to job)
# #$ -p -10

##### Shell that is used
#$ -S /bin/bash

#### Number of threads
#  If you have a multi-threaded application, you need to specify here how many
#  cores your process uses.
#  Note: You explicitly have to tell you program how many threads to use
#$ -pe smp 1

#### Run time limit
#  Specify maximum CPU time after which job is to be killed (format HH:MM:SS).
#$ -l h_rt=04:10:00    # in this example, we set 10 minutes

#### Memory limit
#  specifies the maximum amount of memory this job can take
#  This is per thread, so the total amount is this number times the number
#  of threads. The default value is 2g.
#$ -l h_vmem=4g  # here we choose 4g, so that overall we reserve up to 8*4g=32g total

# #$ -V

#########################
##### Your commands #####
#########################

# For example, run AMPL here (with gurobi threads limit to 1 to match your specification above)
ampl ampl.run
