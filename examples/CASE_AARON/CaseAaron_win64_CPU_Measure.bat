@echo off

rem "name" and "dirout" are named according to the testcase

set name=CaseAaronMarrone0.005New
set dirout=%name%_out


set partvtk="../../EXECS/PartVTK4_win64.exe"
set partvtkout="../../EXECS/PartVTKOut4_win64.exe"
set measuretool="../../EXECS/MeasureTool4_win64.exe"


rem %measuretool% -dirin %dirout% -points CaseAaron_LengthPointsVelocity.txt -onlytype:-all,+fluid -vars:-all,+vel.x -savecsv %dirout%/LengthPointsVelocity
rem if not "%ERRORLEVEL%" == "0" goto fail

rem %measuretool% -dirin %dirout% -points CaseAaron_PointsVelocity.txt -onlytype:-all,+fluid -vars:-all,+vel.x -savecsv %dirout%/WidthPointsVelocity
rem if not "%ERRORLEVEL%" == "0" goto fail

%measuretool% -dirin %dirout% -points XcelData.txt -onlytype:-all,+fluid -vars:-all,+vel.x, -savecsv %dirout%/ExcelDataFluid
if not "%ERRORLEVEL%" == "0" goto fail


:success
echo All done
goto end

:fail
echo Execution aborted.

:end
pause

