#!/bin/bash


      ompthreads=2
      
      project=test_50_50
      path_fullwave=/home/kajetan/software/FULLWAVE3D/rev690/bin/fullwave3D.exe
      
      make -C /home/kajetan/software/FULLWAVE3D/rev690/
      
      echo 'current dir: '
      pwd
      
      work_dir=.//test_50_50//out/
      # CAVEAT it is assumed $work_dir = proj/out/  
      rm .//test_50_50//out//*

      ln .//test_50_50//inp//* $work_dir 
      cd $work_dir # !!!
      export SCHEDULER_ERRSTREAM=stderr
export SCHEDULER_SHOWLEVEL=2
export SCHEDULER_SHOWTIMESTAMP=yes
export SCHEDULER_SLAVESHAVEDATA=yes
export SCHEDULER_SLAVESHAVEMODEL=yes
export SLAVES_DUMPCOMPARE=test_50_50-SLAVES_DUMPCOMPARE
export SLAVES_ERRSTREAM=stderr
export SLAVES_LOCALSTORE=$work_dir
export SLAVES_LOCALSTORETRIGGER=40
export SLAVES_SHOWLEVEL=2
export SLAVES_SHOWTIMESTAMP=yes
export SLAVES_WAVEFIELDSVTR=-100
rm test_50_50-*fw*vtr
rm test_50_50-Observed-Time.tt?
rm test_50_50-Synthetic.*
rm test_50_50-Observed.*


mpiexec -n 2 $path_fullwave test_50_50 1> test_50_50-Out0.log 2> test_50_50-Err0.log

for f in fw*iter*vtr bw*iter*vtr
do
  mv $f ${project}-$f
done

