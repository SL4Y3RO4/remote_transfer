@echo off
title remote_transfer
color a

mode con cols=40 lines=40

:login_ssh

echo enter our username. If you write "!", exit from program
set /p username="username: "

if %username% == ! ( exit )

echo enter our ip address
set /p ip_addr="ip address: "

ping localhost 2 

echo selecting if our resource is a directory or file

::here where is possible do two choice, one of two, you carry to direction that have choices

set /p mkchoice="make our choice[file/directory]: "

if %mkchoice% == "file" ( goto file_ssh )

if %mkchoice% == "directory" ( goto dir_ssh )


:file_ssh

set /p filename="filename: "

::scp need to transfer any resource that want to other machine, if have an ssh server

scp %filename% %username%@%ip_addr%:/home/%username%/Desktop

goto login_ssh


:file_ssh

set /p directory="directory: "

scp -r %directory% %username%@%ip_addr%:/home/%username%/Desktop

goto login_ssh