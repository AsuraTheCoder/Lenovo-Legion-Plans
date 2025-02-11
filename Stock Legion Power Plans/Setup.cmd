@ECHO ON
PUSHD %~dp0

:: IMPORT NEW POWER PLAN FROM EXPORTED PLAN.
rem ===== Legion Balance mode =============
powercfg -IMPORT %~dp0Legion_Balance.pow 85d583c5-cf2e-4197-80fd-3789a227a72c >> POWER.LOG
powercfg /changename 85d583c5-cf2e-4197-80fd-3789a227a72c "Legion Balance Mode "
ECHO.>> POWER.LOG

rem ===== Legion Performance mode =========
powercfg -IMPORT %~dp0Legion_Permance.pow 52521609-efc9-4268-b9ba-67dea73f18b2 >> POWER.LOG
powercfg /changename 52521609-efc9-4268-b9ba-67dea73f18b2 "Legion Performance Mode"
ECHO.>> POWER.LOG

rem ===== Legion Quiet mode ===============
powercfg -IMPORT %~dp0Legion_Quiet.pow 16edbccd-dee9-4ec4-ace5-2f0b5f2a8975 >> POWER.LOG
powercfg /changename 16edbccd-dee9-4ec4-ace5-2f0b5f2a8975 "Legion Quiet Mode"


:: SET AND ACTIVE NEW POWER PLAN.
powercfg -SETACTIVE 85d583c5-cf2e-4197-80fd-3789a227a72c


:: CHANGE CURRENT POWER PLAN VALUE.
powercfg /setacvalueindex 85d583c5-cf2e-4197-80fd-3789a227a72c 0012ee47-9041-4b5d-9b77-535fba8b1442 0b2d69d7-a2a1-449c-9680-f91c70521c60 2
powercfg /setdcvalueindex 85d583c5-cf2e-4197-80fd-3789a227a72c 0012ee47-9041-4b5d-9b77-535fba8b1442 0b2d69d7-a2a1-449c-9680-f91c70521c60 2

:: Translate CURRENT POWER PLAN NAME to CHINESE
for /f %%i in ('wmic path win32_operatingsystem get OSLANGUAGE /value ^| find /i "OSLANGUAGE"') do set %%i

echo %OSLANGUAGE%

if %OSLANGUAGE% EQU 2052 goto CHS

goto end

:CHS
echo CHS Zone
POWERCFG /CHANGENAME 52521609-efc9-4268-b9ba-67dea73f18b2  "野兽模式"
POWERCFG /CHANGENAME 85d583c5-cf2e-4197-80fd-3789a227a72c  "均衡模式"
POWERCFG /CHANGENAME 16edbccd-dee9-4ec4-ace5-2f0b5f2a8975  "安静模式"
goto end

:end
exit
popd