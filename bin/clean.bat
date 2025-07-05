@echo off

setlocal EnableDelayedExpansion

set "DOTFILES_DIR=%~dp0..\files"

pushd "%DOTFILES_DIR%"

for %%a in (.??*) do (
  set "target=%USERPROFILE%\%%a"
  if exist "!target!" (
    del /q "!target!"
    echo Deleted "!target!".
  )
)

for /d %%a in (.??*) do (
  set "target=%USERPROFILE%\%%a"
  if exist "!target!" (
    rd /S /Q "!target!"
    echo Deleted "!target!".
  )
)

popd

endlocal

call %~dp0..\config\.vscode\bin\clean.bat
