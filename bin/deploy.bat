@echo off

setlocal EnableDelayedExpansion

set "DOTFILES_DIR=%~dp0..\files"

pushd "%DOTFILES_DIR%"

for %%a in (.??*) do (
  set "dotfile=%DOTFILES_DIR%\%%a"
  set "link=%USERPROFILE%\%%a"

  mklink "!link!" "!dotfile!"
  if !errorlevel! neq 0 (
    echo Failed to create symbolic link for "%%a".
    exit \b 1
  )
)

for /d %%a in (.??*) do (
  set "dotdir=%DOTFILES_DIR%\%%a"
  set "link=%USERPROFILE%\%%a"

  mklink /d "!link!" "!dotdir!"
  if !errorlevel! neq 0 (
    echo Failed to create symbolic link for "%%a".
    exit \b 1
  )
)

popd

endlocal
