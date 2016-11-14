rem %PATH%

set msbuildpath="C:\Windows\Microsoft.NET\Framework64\v4.0.30319"

cd "C:\Projects\GitHub\Anetre\SN.FreshDesk\Build\"

%msbuildpath%\MSBuild.exe /v:d "Build.proj" /p:WarningLevel=4 /p:VisualStudioVersion=14.0


cd "C:\Projects\GitHub\Anetre\SN.FreshDesk\SN.FreshDesk\"
"C:\Projects\IS\Tools\NuGet\NuGet.exe" pack SN.FreshDesk.nuspec -Prop Version=1.0.1.0

@echo off
echo Would you like to upload the build?(Y/N)
set INPUT=
set /p INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto yes 
If /I "%INPUT%"=="n" goto no

goto no
:yes
@echo on
cd "C:\Projects\IS\Products\IM\Libraries\Model\"
call upload.bat
@echo off
goto end
:no
echo No upload

:end
echo Hit enter to exit
pause

rem "C:\Projects\IS\Tools\NuGet\NuGet.exe" push IM.Libraries.Model.4.1.0.50.nupkg -Source https://integrationsoftware.pkgs.visualstudio.com/DefaultCollection/_packaging/IntegrationManagerInternalFeed/nuget/v3/index.json -ApiKey VSTS