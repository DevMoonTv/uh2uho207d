echo Author: https://fb.com/thuong.hai.581
@echo off
title Azure-Auto-Region

echo Download all files...
curl --silent -O https://raw.githubusercontent.com/TheDarkMythos/Ngrok-Exe/master/ngrok.exe 
curl --silent -O https://gitlab.com/haithuongpro2711/haivps/-/raw/master/Files/NGROK-CHECK.bat


echo Copy NGROK to System32...
copy ngrok.exe C:\Windows\System32 >nul

echo CONNECT NGROK AUTH TOKEN...
start NGROK.bat >nul


echo Check Region for NGROK...
curl -s ifconfig.me >ip.txt
set /p IP=<ip.txt
curl -s "http://api.whoapi.com/?apikey=2ef57b179506aa2979a2d4f4d1d5f344&r=geo&domain=&ip=%IP%" >full.txt
type full.txt | jq -r .geo_cc >region.txt
type full.txt | jq -r .geo_country >location.txt
set /p LO=<location.txt
set /p RE=<region.txt
if %RE%==US (start ngrok tcp 3389)
if %RE%==CA (start ngrok tcp 3389)
if %RE%==HK (start ngrok tcp --region ap 3389)
if %RE%==SG (start ngrok tcp --region ap 3389)
if %RE%==NL (start ngrok tcp --region eu 3389)
if %RE%==IE (start ngrok tcp --region eu 3389)
if %RE%==GB (start ngrok tcp --region eu 3389)
if %RE%==BR (start ngrok tcp --region sa 3389)
if %RE%==AU (start ngrok tcp --region au 3389)
if %RE%==IN (start ngrok tcp --region in 3389)


echo Finished!
NGROK-CHECK.bat

