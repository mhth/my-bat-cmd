@echo off
chcp 866 >nul
set t=2
:loop
echo -----------------#RUN#-----------------
echo ###BEFO %time%###
@w32tm /resync
echo ###AFTER %time%###
echo -----------------#END#-----------------
ping 127.0.0.1 -n %t% >nul
Goto :loop