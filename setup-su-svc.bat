@echo off

REM start as a Local Administrator
REM Start Stable Diffusion UI already downloaded and extracted to C:\stable-diffusion-ui

REM Download and install 7-zip
echo Downloading 7-zip...
bitsadmin /transfer 7zipDownload /download /priority foreground http://www.7-zip.org/a/7z1900-x64.exe C:\7z1900-x64.exe
echo Installing 7-zip...
start /wait C:\7z1900-x64.exe /S

REM Download and install NSSM
echo Downloading NSSM...
bitsadmin /transfer NSSMDownload /download /priority foreground https://nssm.cc/release/nssm-2.24.zip C:\nssm-2.24.zip
echo Installing NSSM...
"C:\Program Files\7-Zip\7z.exe" x C:\nssm-2.24.zip -oC:\nssm
copy "C:\nssm\win64\nssm.exe" "C:\Windows\System32\nssm.exe"

REM Add NSSM to system environment variable
echo Adding NSSM to system environment variable...
setx PATH "%PATH%;C:\Windows\System32"

REM Enable Windows OpenSSH server
echo Enabling Windows OpenSSH server...
dism.exe /Online /Enable-Feature /FeatureName:OpenSSH.Server

REM Install sample service using NSSM
echo Installing sample service using NSSM...
nssm install "Stable Diffusion UI" "C:\stable-diffusion-ui\Start Stable Diffusion UI.cmd"

echo All processes completed successfully!
