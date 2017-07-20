---
title: JDK – No Install Needed
author: Yogi
type: post
date: 2014-01-10T02:09:46+00:00
url: /2014/01/10/jdk-no-install-needed/
categories:
  - Java
tags:
  - java
  - windows

---
I don&#8217;t like the whole concept of installers for my development tools like JDK, Eclipse, Netbeans, etc. I just keep a batch/shell script to setup my environment variables for JAVA_HOME, PATH and aliases.

So, on Windows, updating JDK involves installing new version of JDK and then copying what I need and then uninstall it. I don&#8217;t like those registry entries and files installed in C:\Windows\System32, etc.

Recently I read a <a href="http://stackoverflow.com/questions/1619662/where-can-i-get-the-latest-jre-jdk-as-a-zip-file-i-mean-no-exe-installer" target="_blank">stackoverflow entry</a> that gave some insight on JDK packaging. So I wrote a small batch script to do it all. Only quirk is that, there is a small difference in Pre 7.0 packaging from the 7.0 and above, so for now I need to keep 2 scripts. Scripts need 7z, that is a free tool and could be downloaded from <a href="http://www.7-zip.org/download.html" target="_blank">here</a>.

These scripts can be run as:

<pre class="lang:default decode:true ">jdk-extract path_to_install.exe</pre>

or

<pre class="lang:default decode:true">jdk-extract-pre-7.0.bat path_to_installer.bat</pre>

And now on to the actual the code:

<pre class="lang:default decode:true" title="jdk-extract.bat">@echo off
REM This script will extract JDK tools from installers, without polluting Windows environment.
REM You need the pristine installers from Oracles website to extract all the data
setlocal
SET CWD=%CD%
SET FILE=%~f1
SET DEST=%~dpn1
echo DEST=%DEST% FILE=%FILE% CWD=%CWD%
md %DEST%
REM Used e here instead of x to keep structure flat
7z e -o"%DEST%"  -y "%FILE%" tools.zip
cd "%DEST%"
7z x -y tools.zip
del tools.zip
for /r %%x in (*.pack) do call :unpack2000 "%%x"
cd %CWD%
goto end

:unpack2000
%DEST%\bin\unpack200 -r %1 "%~dpn1.jar"
goto:eof

:end
echo Extracted %FILE% to %DEST%</pre>

<pre class="lang:default decode:true crayon-selected" title="jdk-extract-pre-7.0.bat">@echo off
REM This script will extract JDK tools from installers, without polluting Windows environment.
REM You need the pristine installers from Oracles website to extract all the data
setlocal
SET CWD=%CD%
SET FILE=%~f1
SET DEST=%~dpn1
echo DEST=%DEST% FILE=%FILE% CWD=%CWD%
md %DEST%
REM Used e here instead of x to keep structure flat
7z e -o"%DEST%"  -y "%FILE%" .rsrc\JAVA_CAB10\111
cd "%DEST%"
extrac32.exe 111
del 111
7z x -y tools.zip
del tools.zip
for /r %%x in (*.pack) do call :unpack2000 "%%x"
cd %CWD%
goto end

:unpack2000
%DEST%\bin\unpack200 -r %1 "%~dpn1.jar"
goto:eof

:end
echo Extracted %FILE% to %DEST%</pre>

&nbsp;