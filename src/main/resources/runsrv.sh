#!/bin/sh

echo "JFileServer starting, enter 'x' to shutdown server, 'r' to restart server ..."
exec java -jar jfileserver.jar fileSrvConfig.xml
