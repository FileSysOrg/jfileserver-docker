#!/bin/sh

echo "JFileServer starting, enter 'x' to shutdown server, 'r' to restart server ..."
exec java -cp jfileserver.jar:lib/* org.filesys.app.FileServer fileSrvConfig.xml
