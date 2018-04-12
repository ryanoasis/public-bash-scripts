@echo off
:: Use cygwin bash to execute a bash script from batch file
:: Backups latest keyword_objects database

title Backing up database

::c:\Development\Cygwin\bin\bash.exe -l -c "mount --change-cygdrive-prefix / ;/c/Users/Ryan/public-bash-scripts/backup-database.sh"
c:\Development\Cygwin\bin\bash.exe -l -c "/c/Users/Ryan/public-bash-scripts/backup-database.sh"

pause
