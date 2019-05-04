@        ECHO OFF

rem      FILE:  RUNAERMET.BAT

rem      This is a DOS utility program for use in running the meteorological
rem      preprocessor, AERMET.  The program is run from the DOS prompt using
rem      the following syntax:

rem           RUNAERMET   filename

rem      where:   RUNAERMET is entered 'as is'
rem               filename is the name of the input file


         :START
            IF '%1' == ''  GOTO END
            IF EXIST %1  GOTO COPY
            ECHO Error locating input file
            GOTO STOP

            :COPY
               COPY %1  AERMET.INP
               ECHO Proceed with processing
               PAUSE
               AERMET
               GOTO STOP

         :END

ECHO ..
ECHO ..
ECHO     AERMET is run from the DOS prompt using the following syntax
ECHO ..
ECHO          RUNAERMET   filename
ECHO ..
ECHO     where:   RUNAERMET is entered 'as is'
ECHO              filename is the name of the input file
ECHO ..
ECHO ..
               PAUSE

         :STOP
