@echo off

IF "%JREVERSE_HOME%" == "" goto envpath

set CP=%JREVERSE_HOME%\target\jreversepro-1.5.0.jar;%JREVERSE_HOME%\target\dependency\commons-cli-1.2.jar;%JREVERSE_HOME%\target\dependency\commons-io-1.4.jar
 
java -classpath %CP% org.jreversepro.cmd.CommandMain %1 %2 %3 %4 %5
goto end

:envpath
echo Set JREVERSE_HOME environment variable.

:end
set CP=
