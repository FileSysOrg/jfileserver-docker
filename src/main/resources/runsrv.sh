#!/bin/sh

echo "JFileServer starting, enter 'x' to shutdown server, 'r' to restart server ..."
exec java -cp .:lib/* org.filesys.app.FileServer fileSrvConfig.xml
