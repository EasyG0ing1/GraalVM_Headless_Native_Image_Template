@echo off
REM Move all files from "win" folder to current directory
move /Y win\* .

REM Remove the "win" and "nix" directories and all contents
rmdir /S /Q win
rmdir /S /Q nix

del .\setwin.bat
del .\setnix.sh
