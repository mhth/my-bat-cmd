::%1 - ip(172.24.4.70) %2 - user(ALPHA@TNSV.TN) %3 - pass(UHT_Active_47) %4 - name(AS_USA_UHT) %5 - flow(start/stop/kill)
@net use \\%1 /user:%2 %3
@if "%5" == "start" (
    sc \\%1 queryex %4 | find "STOPPED">nul&&(
    echo RUNNING
    sc \\%1 start %4
    )
)
@if "%5" == "stop" (
    sc \\%1 queryex %4 | find "RUNNING">nul&&(
    echo STOPPING
    sc \\%1 stop %4
    )
)
@if "%5" == "kill" (
    For /F "tokens=3" %%A In ('SC \\%1 queryex %4^|Find "ID"')Do (
	    @TaskKill /S %1 /U %2 /P %3 /F /PID %%A
    )
)
@net use \\%1 /delete
@pause