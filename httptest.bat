:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	API動作確認バッチ                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::変更履歴
::1.0 初版
::

@echo off

echo %time%
set time2=%time: =0%
 
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%

:: ID生成
set id=%date:/=%-%hh%%mn%%ss%

SET BAT_LOG=%~dp0\%id%_GET実行結果.txt

::入力情報
rem 初期化
set postnum=100-0005
rem 入力要求
set /P postnum="郵便番号を入力してください[デフォルト:100-0005]: "

rem 初期化
set appid=
rem 入力要求
set /P appid="APIキーを入力してください: "

::文字化け対応
@REM UTF-8
chcp 65001

::GET
echo "GET TEST" >> %BAT_LOG%
curl -X GET "http://api.openweathermap.org/data/2.5/weather?zip="%postnum%",jp&units=metric&lang=ja&APPID="%appid% -I >> %BAT_LOG%
curl -X GET "http://api.openweathermap.org/data/2.5/weather?zip="%postnum%",jp&units=metric&lang=ja&APPID="%appid% | jq >> %BAT_LOG%

pause



