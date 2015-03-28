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
echo It is recommended that you make a backup first.
:home
cls
echo.
echo Select a task:
echo =============
echo.
echo 1) Backup Minecraft save-game
echo 2) Uninstall Minecraft
echo 3) Exit
echo.
set /p x=Type option:
if "%x%%"=="1"
echo Copying your Minecraft folder to your desktop.
echo.
cd "%UserProfile%\Desktop"
mkdir MCSaveGame
xcopy /s "%appdata%\.minecraft"
echo. Minecraft has been copied.
goto home
if "%x%%"=="2" goto :uninstall
if "%x%%"=="3" exit
:uninstall
taskkill /im javaw.exe
rmdir /S /Q "%appdata%\.minecraft"
cd "%UserProfile%\Desktop"
if exist Minecraft.* del /q /s Minecraft.*
cls
echo Minecraft has been deleted.
echo.
pause >>nul
goto home