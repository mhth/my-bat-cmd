for /l %%i in (5000,1,5006) do (
    C:\"Program Files"\Automiq\Alpha.Server.%%i\Server\Alpha.ServerInstaller.exe /uninstall
)
pause