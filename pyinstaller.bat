 @echo off
chcp 65001 >nul
echo ========================================
echo        Building M88GDBTool...
echo ========================================

rmdir /s /q build 2>nul
rmdir /s /q dist 2>nul

pyinstaller --onefile --noconsole --clean --name="M88GDBTool" --icon=M88.ico --paths src --add-data "res;res" UIMain.py

echo.
echo ========================================
echo Build finished! Check the "dist" folder.
echo ========================================

pause