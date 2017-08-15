
cd /D "C:\ATHENA_TestEnvironment\Protege_3.4.7"
set JDKBIN=C:\ATHENA_TestEnvironment\jre\bin

rem Note that a space character in the following path must be replaced with '%%20' in 
rem a batch file.  If you are typing directly on the command line, a space must be
rem replaced with '%20'.

set CODEBASE_URL=file:C:/ATHENA_TestEnvironment/Protege_3.4.7/protege.jar

start /D%JDKBIN% /min %JDKBIN%\rmiregistry.exe

set CLASSPATH=protege.jar;looks.jar;unicode_panel.jar;driver.jar;driver0.jar;driver1.jar
set MAINCLASS=edu.stanford.smi.protege.server.Server
set METAPROJECT=C:\ATHENASharedKB_v1\ProtegeServerMetaProject.pprj

set MAX_MEMORY=-Xmx700M 
set HEADLESS=-Djava.awt.headless=true
set CODEBASE=-Djava.rmi.server.codebase=%CODEBASE_URL%
set LOG4J_OPT=-Dlog4j.configuration=file:log4j.xml

rem --- Optional arguments; uncomment if necessary ---
rem set HOSTNAMEOPT=-Djava.rmi.server.hostname=localhost
rem set "PORTOPTS=-Dprotege.rmi.server.port=5200 -Dprotege.rmi.registry.port=5100"
rem TX=-Dtransaction.level=READ_COMMITTED
rem "DEBUG_OPT=-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"

set OPTIONS=%MAX_MEMORY% %CODEBASE% %HEADLESS% %LOG4J_OPT% %HOSTNAMEOPT% %PORTOPTS% %TX% %DEBUG_OPT%

rem ------------------- Cmd Options -------------------
rem If you want automatic saving of the project, 
rem setup the number of seconds in SAVE_INTERVAL_VALUE
set SAVE_INTERVAL=-saveIntervalSec=120
rem ------------------- Cmd Options -------------------


%JDKBIN%\java %OPTIONS% -cp %CLASSPATH% %MAINCLASS% %SAVE_INTERVAL% %METAPROJECT%  
