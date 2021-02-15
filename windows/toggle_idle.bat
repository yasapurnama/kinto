@echo off

IF "%1"=="prevent" goto prevent
IF "%1"=="allow" goto allow

echo Not found.
goto commonexit

:prevent
C:\Strawberry\perl\bin\perl.exe -pi -e "s/(; )(.*)(; PreventIdle)/$2$3/g" "%userprofile%\.kinto\kinto.ahk"
C:\Strawberry\perl\bin\perl.exe -pi -e "s/Prevet Screen Idle, prevent_idle/Prevet Screen Idle, allow_idle/g" "%userprofile%\.kinto\kinto.ahk"
"%userprofile%\.kinto\kinto-start.vbs"
goto commonexit

:allow
C:\Strawberry\perl\bin\perl.exe -pi -e "s/^(?!;)(.*)(; PreventIdle)/; $1$2/gm" "%userprofile%\.kinto\kinto.ahk"
C:\Strawberry\perl\bin\perl.exe -pi -e "s/Prevet Screen Idle, allow_idle/Prevet Screen Idle, prevent_idle/g" "%userprofile%\.kinto\kinto.ahk"
"%userprofile%\.kinto\kinto-start.vbs"
goto commonexit

:commonexit
exit