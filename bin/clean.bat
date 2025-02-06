@echo off

setlocal EnableDelayedExpansion

set "DOTFILES_DIR=%~dp0..\files"

pushd "%DOTFILES_DIR%"

for %%a in (.??*) do (
  set "link=%USERPROFILE%\%%a"
  dir /l /a:al "!link!" 2>nul | findstr /i "SYMLINK" >nul 
  if !errorlevel! == 0 (
    del /q "!link!"
    echo Deleted "!link!".
  )
)

for /d %%a in (.??*) do (
  set "link=%USERPROFILE%\%%a"
  dir /l /a "%USERPROFILE%" 2>nul | findstr /i "SYMLINKD" | findstr "%%a" >nul
  if !errorlevel! == 0 (
    rd "!link!"
    echo Deleted "!link!".
  )
)

popd

endlocal
