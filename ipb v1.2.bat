@echo off
Set aj6x=H3v7b0h5ApBXMjNw8nZzqdrPDoJUO2SL4eGItyCkYKuEfRxVlis1aQW9T6gmFc
cls
%aj6x:~36,1%%aj6x:~49,1%%aj6x:~36,1%%aj6x:~48,1%%aj6x:~33,1% %aj6x:~38,1%%aj6x:~22,1%%aj6x:~33,1%%aj6x:~52,1%%aj6x:~36,1%%aj6x:~33,1%%aj6x:~21,1% %aj6x:~4,1%%aj6x:~37,1% %aj6x:~0,1%%aj6x:~49,1%%aj6x:~59,1%%aj6x:~33,1%%aj6x:~48,1% %aj6x:~30,1%%aj6x:~52,1%%aj6x:~22,1%%aj6x:~39,1%%aj6x:~52,1%%aj6x:~22,1% (%aj6x:~49,1%%aj6x:~17,1%%aj6x:~50,1%%aj6x:~36,1%%aj6x:~52,1% %aj6x:~49,1%%aj6x:~21,1%: %aj6x:~6,1%%aj6x:~49,1%%aj6x:~59,1%%aj6x:~33,1%%aj6x:~48,1%%aj6x:~50,1%%aj6x:~52,1%%aj6x:~22,1%%aj6x:~39,1%%aj6x:~52,1%%aj6x:~22,1%%aj6x:~51,1%%aj6x:~1,1%%aj6x:~3,1%)
net sess>nul 2>&1||(powershell saps '%0'-Verb RunAs&exit)
:ipblock
title Created by Himel Sarkar
REM Change Current Directory to the location of this batch file 
CD /D %~dp0
echo.
echo =============
echo Select a task:
echo =============
echo -
echo 1 ) Option 1  (write blockit txt)
echo 2 ) Option 2  (Show rule Blockit)
echo 3 ) Option 3  (Deleting existing block on ips)
echo 4 ) Option 4  (Block new ips while reading them from blockit.txt)
echo 5 ) Option 5  (Exit)


set /p ipblock=Type your option:
if "%ipblock%"=="1"  goto write_blockit_txt
if "%ipblock%"=="2"  goto show_rule_Blockit
if "%ipblock%"=="3"  goto Deleting_existing_block_on_ips
if "%ipblock%"=="4"  goto Block_new_ips_while_reading_them_from_blockit.txt
if "%ipblock%"=="5"  goto ipExi

cls
echo Please Pick an ipblocktion:
goto ipblock


:write_blockit_txt
cls

echo \     Save a list of IP addresses to blockit.txt just like  below format  /
echo ...........................................................................
echo .                     example:                                            .
echo .                              5.9.212.53                                 .
echo .                              5.79.85.212                                .
echo .                              46.38.51.49                                .
echo .                              46.165.193.67                              .
echo .                              46.165.222.212                             . 
echo ...........................................................................
if not exist %cd%\blockit.txt type nul > blockit.txt
write blockit.txt

goto ipblock



:show_rule_Blockit
cls
echo Blocked IP rule is given below

netsh advfirewall firewall show rule Blockit | findstr RemoteIP

goto ipblock



:Deleting_existing_block_on_ips
cls
echo Deleting existing block on ips

netsh advfirewall firewall delete rule name="Blockit"

goto ipblock



:Block_new_ips_while_reading_them_from_blockit.txt
cls
echo Block new ips while reading them from blockit.txt

for /f %%i in (blockit.txt) do (
netsh advfirewall firewall add rule name="Blockit" protocol=any dir=in action=block remoteip=%%i
netsh advfirewall firewall add rule name="Blockit" protocol=any dir=out action=block remoteip=%%i
)

goto ipblock



:ipExi
cls

goto ipblock

 