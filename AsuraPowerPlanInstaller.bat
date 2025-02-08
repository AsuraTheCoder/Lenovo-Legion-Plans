@echo off

echo Adding Power Plans

powercfg -import %~dp0LegionBalance.pow 1d949fed-9593-464f-9158-58ca3b8b38c7

powercfg -import %~dp0LegionQuiet.pow 9f47f895-74d8-4146-b6f4-ad03b5737ed1

powercfg -import %~dp0LegionPerformance.pow 80bba9a0-4a73-447c-8a25-f71c8586ad49

powercfg -import %~dp0LegionUltimatePerformance.pow b4fbffc4-358f-4314-8049-24db4a306cb0

powercfg -SETACTIVE 1d949fed-9593-464f-9158-58ca3b8b38c7

powercfg delete 381b4222-f694-41f0-9685-ff5bb260df2e

pause

Property of @AsuraTheCoder