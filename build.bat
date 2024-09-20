@echo off

set WAR_NAME=27A28#web.war
set BUILD_ENV=%1
if "%BUILD_ENV%"=="" (
    set BUILD_ENV=dev
)
if not "%BUILD_ENV%"=="dev" (
    set WAR_NAME="web.war"
)

npm install ^
&& call move ckeditor5-custom-editor node_modules\@ckeditor ^
&& npm run build-%BUILD_ENV% ^
&& call move war\* build\ ^
&& call cd build ^
&& call dir ^
&& jar -cvf %WAR_NAME% .
