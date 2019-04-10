@echo off

rem "name" and "dirout" are named according to the testcase

set name=CaseAaron
set dirout=%name%_out


set partvtk="../../EXECS/PartVTK4_win64.exe"
set partvtkout="../../EXECS/PartVTKOut4_win64.exe"
set measuretool="../../EXECS/MeasureTool4_win64.exe"

%partvtk% -dirin %dirout% -savevtk %dirout%/PartFluid -onlytype:-all,fluid
if not "%ERRORLEVEL%" == "0" goto fail

%partvtk% -dirin %dirout% -savevtk %dirout%/PartBound -onlytype:-all,bound
if not "%ERRORLEVEL%" == "0" goto fail

%partvtkout% -dirin %dirout% -filexml %dirout%/%name%.xml -savevtk %dirout%/PartFluidOut -SaveResume %dirout%/ResumeFluidOut
if not "%ERRORLEVEL%" == "0" goto fail

rem %measuretool% -dirin %dirout% -points CaseAaron_LengthPointsVelocity.txt -onlytype:-all,+fluid -vars:-all,+vel.x -savecsv %dirout%/LengthPointsVelocity
rem if not "%ERRORLEVEL%" == "0" goto fail

rem %measuretool% -dirin %dirout% -points CaseAaron_PointsVelocity.txt -onlytype:-all,+fluid -vars:-all,+vel.x -savecsv %dirout%/WidthPointsVelocity
rem if not "%ERRORLEVEL%" == "0" goto fail

rem %measuretool% -dirin %dirout% -points XcelData.txt -onlytype:-all,+fluid -vars:-all,+vel.x, -savecsv %dirout%/ExcelData
rem if not "%ERRORLEVEL%" == "0" goto fail


:success
echo All done
goto end

:fail
echo Execution aborted.

:end
pause

