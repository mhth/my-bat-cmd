for /l %%i in (5000,1,5006) do (
    net stop  Alpha.Server.%%i
    net start  Alpha.Server.%%i
)
pause