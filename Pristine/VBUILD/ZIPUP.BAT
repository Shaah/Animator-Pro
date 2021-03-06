@pushdir
@if "%1"=="" goto USAGE
md %1
copy *.bat %1
copy c:\bin\pkunzip.exe %1
copy read.me %1
cd ..\v
if ERRORLEVEL 1 goto ERROR 
pkzip -es -P %1\v *.c *.str *.h *.asm linkit makefile backup.bat *.doc utils\makefile utils\*.c
if ERRORLEVEL 1 goto ERROR 
cd ..\crop
pkzip -es -P %1\crop *.c *.str *.h *.asm makefile linkit crop.doc crop.lnk overlay.lib
if ERRORLEVEL 1 goto ERROR 
cd ..\play
pkzip -es -P %1\play *.c *.str *.h *.asm makefile linkit *.doc
if ERRORLEVEL 1 goto ERROR 
c:
cd \tc
pkzip -es -P -r %1\tc *.*
if ERRORLEVEL 1 goto ERROR 
cd \bin
pkzip -es %1\bin make.* z.* ls.* grep.* masm.* plink86.* beep.* pkunzip.* pkzip.* pushdir.* popdir.*
if ERRORLEVEL 1 goto ERROR 
@echo Everything zipped up ok.
goto OUT
:USAGE
@echo ZIPUP.BAT
@echo This batch file creates a backup of aa, aaplay, and convert source and
@echo the compilers linkers etc. needed to create the executables.
@echo usage: zipup dest-dir
@echo example: zipup i:\aa385
@goto OUT
:ERROR
@echo Couldn't ZIPUP fully!
@beep 1
:OUT
@popdir
