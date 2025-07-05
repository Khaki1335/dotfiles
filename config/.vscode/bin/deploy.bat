@echo off

set "CONFIG_DIR=%~dp0.."
pushd "%CONFIG_DIR%"
set "CONFIG_DIR=%cd%"
popd
set "VSCODE_SETTING_DIR=%APPDATA%\Code\User"

mklink "%VSCODE_SETTING_DIR%\settings.json" "%CONFIG_DIR%\settings.json"
if %errorlevel% neq 0 (
  echo Failed to create symbolic link for ".vscode\settings.json".
  exit \b 1
)

mklink "%VSCODE_SETTING_DIR%\keybindings.json" "%CONFIG_DIR%\keybindings.json"
if %errorlevel% neq 0 (
  echo Failed to create symbolic link for ".vscode\keybindings.json".
  exit \b 1
)

for /f "usebackq delims=" %%i in ("%CONFIG_DIR%\extensions") do (
    code --install-extension %%i
)
