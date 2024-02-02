@echo off
cls
:menu
cls
color 80

date /t

echo PORTO: %computername%

echo            MENU TAREFAS
echo  ==================================
echo * 1. start API                     * 
echo * 2. stop  API                     *
echo * 3. sair  API                     *
echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3


:opcao1
cls
start javaw -Dspring.config.location=D:\api-abrangencia\caps-consulta-abrangencia-api.yml -jar caps-consulta-abrangencia-api.jar
timeout 10 > NUL
echo ==================================
echo *      Api INICIADA          *
echo ==================================
pause
goto menu

:opcao2
cls
setlocal
IF EXIST app.pid FOR /F %%i in ('type app.pid') do TASKKILL /F /PID %%i
IF EXIST app.pid DEL app.pid
timeout 5 > NUL 
endlocal
goto menu

:opcao3
cls
exit