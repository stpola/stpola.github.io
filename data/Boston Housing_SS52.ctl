{"parameters":{"code":"/* Generated Code (IMPORT) */\n/* Source File: Boston Housing.jmp */\n/* Source Path: /r/sanyo.unx.sas.com/vol/vol310/u31/stpola/3.8testing/Boston Housing.jmp */\n/* Code generated on: 6/4/2019, 11:37:34 AM */\n\nproc sql;\n%if %sysfunc(exist(WORK.IMPORT)) %then %do;\n    drop table WORK.IMPORT;\n%end;\n%if %sysfunc(exist(WORK.IMPORT,VIEW)) %then %do;\n    drop view WORK.IMPORT;\n%end;\nquit;\n\n\n\nFILENAME REFFILE DISK '/r/sanyo.unx.sas.com/vol/vol310/u31/stpola/3.8testing/Boston Housing.jmp';\n\nPROC IMPORT DATAFILE=REFFILE\n\tDBMS=JMP\n\tOUT=WORK.IMPORT;\nRUN;\n\nPROC CONTENTS DATA=WORK.IMPORT; RUN;\n\n\n","outputType":"TABLE","outputName":"IMPORT","outputLocation":"WORK","fileName":"Boston Housing.jmp","filePath":"/r/sanyo.unx.sas.com/vol/vol310/u31/stpola/3.8testing/Boston Housing.jmp","pathLabel":"/r/sanyo.unx.sas.com/vol/vol310/u31/stpola/3.8testing/Boston Housing.jmp","fileType":"","fileSheet":"","fileTable":"","eolDelimiterOption":"","colDelimiterOption":""},"type":"importObject","version":5.2}