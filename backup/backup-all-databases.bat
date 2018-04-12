@echo off
:: Use cygwin bash to execute a bash script from batch file
:: Backups latest keyword_objects database

setLocal EnableDelayedExpansion

title Backing up ALL databases

echo "Enter post fix name for archive (enter for none):"

set /p postfix=

:menu
echo 1 for 7Zip (does not work)
echo 2 for Gzip

set /p pr=

if %pr% == 1 goto 7zip

if %pr% == 2 goto Gzip

if %pr% neq 2 if %pr% neq 1 goto menu

:gzip
echo Archiving with Gzip
c:\Development\Cygwin\bin\bash.exe -l -c "/cygdrive/c/Users/Ryan/public-bash-scripts/backup-all-databases.sh %postfix%"
goto done

:7zip
echo Archiving with 7zip
c:\Development\Cygwin\bin\bash.exe -l -c "/cygdrive/c/Users/Ryan/public-bash-scripts/backup-all-databases-7zip.sh"
goto done


:done
echo Archive complete

pause


:: sources
:: http://www.computing.net/answers/programming/user-choice-in-batch/17003.html
