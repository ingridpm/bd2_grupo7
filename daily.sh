#!/bin/bash
#Created 17 June 2014
#Author : Jignesh Jethwa
#Version 1.0
#Set Environment Variabl
#export ORACLE_BASE=/u01/app/oracle
#export ORACLE_SID=ORCL18
#export ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1
#export PATH=$ORACLE_HOME/bin:$PATH
#export PATH=$PATH:$ORACLE_HOME/bin
/u01/app/oracle/product/18.0.0/dbhome_1/bin/rman target / @/home/scripts/bd2_grupo7/script.rcv
