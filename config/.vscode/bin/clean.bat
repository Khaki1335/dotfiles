@echo off

set "VSCODE_SETTING_DIR=%APPDATA%\Code\User"

set "SETTINGS_FILE=%VSCODE_SETTING_DIR%\settings.json"
set "KEYBINDINGS_FILE=%VSCODE_SETTING_DIR%\keybindings.json"

if exist "%SETTINGS_FILE%" (
  del /q "%SETTINGS_FILE%"
  echo Deleted "%SETTINGS_FILE%".
)

if exist "%KEYBINDINGS_FILE%" (
  del /q "%KEYBINDINGS_FILE%"
  echo Deleted "%KEYBINDINGS_FILE%".
)
