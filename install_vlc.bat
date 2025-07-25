@echo off
setlocal

REM Ruta del instalador y URL del repositorio GitHub
set "installerPath=C:\Windows\Temp\vlc-2.1.4-win64.exe"
set "downloadURL=https://github.com/mespinoza333/Installers/releases/download/vlc-2.1.4/vlc-2.1.4-win64.exe"

echo Descargando VLC desde GitHub...
powershell -Command "Invoke-WebRequest -Uri '%downloadURL%' -OutFile '%installerPath%'"

REM Verificar si el instalador fue descargado correctamente
if exist "%installerPath%" (
    echo Ejecutando instalador en modo silencioso...
    "%installerPath%" /S

    echo Esperando 10 segundos para completar la instalacion...
    timeout /t 10 /nobreak > nul

    echo Eliminando instalador...
    del /f /q "%installerPath%"

    echo Instalacion finalizada.
) else (
    echo ERROR: No se pudo descargar el instalador.
)

endlocal
exit /b
