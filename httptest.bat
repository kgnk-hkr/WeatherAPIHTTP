:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	API����m�F�o�b�`                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�ύX����
::1.0 ����
::

@echo off

echo %time%
set time2=%time: =0%
 
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%

:: ID����
set id=%date:/=%-%hh%%mn%%ss%

SET BAT_LOG=%~dp0\%id%_GET���s����.txt

::���͏��
rem ������
set postnum=100-0005
rem ���͗v��
set /P postnum="�X�֔ԍ�����͂��Ă�������[�f�t�H���g:100-0005]: "

rem ������
set appid=
rem ���͗v��
set /P appid="API�L�[����͂��Ă�������: "

::���������Ή�
@REM UTF-8
chcp 65001

::GET
echo "GET TEST" >> %BAT_LOG%
curl -X GET "http://api.openweathermap.org/data/2.5/weather?zip="%postnum%",jp&units=metric&lang=ja&APPID="%appid% -I >> %BAT_LOG%
curl -X GET "http://api.openweathermap.org/data/2.5/weather?zip="%postnum%",jp&units=metric&lang=ja&APPID="%appid% | jq >> %BAT_LOG%

pause



