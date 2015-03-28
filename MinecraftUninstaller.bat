@ECHO OFF
::    This program is free software: you can redistribute it and/or modify
::    it under the terms of the GNU General Public License as published by
::    the Free Software Foundation, either version 3 of the License, or
::    (at your option) any later version.
::
::    This program is distributed in the hope that it will be useful,
::    but WITHOUT ANY WARRANTY; without even the implied warranty of
::    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::    GNU General Public License for more details.
::
::    You should have received a copy of the GNU General Public License
::    along with this program.  If not, see <http://www.gnu.org/licenses/>
title Minecraft Uninstaller
echo This utility removes Minecraft completely.
echo.
echo Are you sure you want to remove Minecraft
echo (This will remove all files.)
:home
cls
echo.
echo Select a task:
echo =============
echo.
echo 1) Uninstall Minecraft
echo 2) Backup Minecraft save-game
echo 3) Exit
echo.
set /p x=Type option:
if "%x%%"=="1"
taskkill /im javaw.exe
rmdir /S /Q "%appdata%\.minecraft"
cd "%UserProfile%\Desktop"
if exist Minecraft.* del /q /s Minecraft.*
cls
echo Minecraft has been deleted.
echo.
pause >>nul
goto home
if "%x%%"=="2" goto backup
if "%x%%"=="3" exit
goto home
:backup
echo Copying your Minecraft folder to your desktop.
echo.
cd "%UserProfile%\Desktop"
mkdir MCSaveGame
xcopy /s "%appdata%\.minecraft"
echo. Minecraft has been copied.