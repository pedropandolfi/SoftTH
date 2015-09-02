@echo off

:: Set up the Visual Studio command prompt environment variables
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\vsvars32.bat"

:: Set the System32 folder location
set sys32=C:\Windows\System32
set sdk=C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x86
set sth=..\bin\win\x86\dxgi\debug

echo.
echo Dumping relevant Direct3D exports
echo.
echo Dumping ...

:: Loop through and grab the exports
for /L %%f in (9,1,11) do (
  echo   d3d%%f_SDK
  dumpbin /exports "%sdk%\d3d%%f*.lib" > d3d%%f_dll_exports.txt
  )
  ::echo   d3dx%%f_SDK
  ::dumpbin /exports "%sdk%\d3dx%%f*.lib" > d3dx%%f_dll_exports.txt
  ::)

echo   dxgi_SDK
dumpbin /exports "%sdk%\dxgi.lib" > dxgi_dll_exports.txt

echo   dxgi_debug_SYS32
dumpbin /exports "%sys32%\dxgidebug.dll" > dxgidebug_dll_exports.txt

echo   SoftTH_dxgi
dumpbin /exports "%sth%\dxgi.lib" > sth_dxgi_dll_exports.txt

echo.
echo FINISHED!
echo.

pause

:DONE