@echo off

rem "name" and "dirout" are named according to the testcase

set name=CaseAaron
set dirout=%name%_out

rem "executables" are renamed and called from their directory

set dirbin=../../bin/windows
set gencase="%dirbin%/GenCase4_win64.exe"
set dualsphysicscpu="%dirbin%/DualSPHysics4.2CPU_win64.exe"
set dualsphysicsgpu="%dirbin%/DualSPHysics4.2_win64.exe"
set boundaryvtk="%dirbin%/BoundaryVTK4_win64.exe"
set partvtk="%dirbin%/PartVTK4_win64.exe"
set partvtkout="%dirbin%/PartVTKOut4_win64.exe"
set measuretool="%dirbin%/MeasureTool4_win64.exe"
set computeforces="%dirbin%/ComputeForces4_win64.exe"
set isosurface="%dirbin%/IsoSurface4_win64.exe"
set flowtool="%dirbin%/FlowTool4_win64.exe"
set floatinginfo="%dirbin%/FloatingInfo4_win64.exe"

rem "dirout" is created to store results or it is removed if it already exists

if exist %dirout% del /Q %dirout%\*.*
if not exist %dirout% mkdir %dirout%

copy .\DtFixedMarslip0005.dat .\%dirout% 


rem CODES are executed according the selected parameters of execution in this testcase

%gencase% %name%_Def %dirout%/%name% -save:all
if not "%ERRORLEVEL%" == "0" goto fail

%dualsphysicscpu% %dirout%/%name% %dirout% -svres -cpu
if not "%ERRORLEVEL%" == "0" goto fail

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

%measuretool% -dirin %dirout% -points XcelData.txt -onlytype:-all,+fluid,+bound -vars:-all,+vel.x, -savecsv %dirout%/ExcelData
if not "%ERRORLEVEL%" == "0" goto fail


:success
echo All done
goto end

:fail
echo Execution aborted.

:end
pause

