FROM openjdk:8

# Image details
LABEL description="Java file server with SMB/CIFS, FTP/FTPS and NFS. Virtual filesystems, database filesystems"
LABEL maintainer="gk.spencer@filesys.org"

# Set the working directory for the file server
WORKDIR /jfileserver

# Copy in the Jars, scripts and configuration files
COPY target/jfileserver ./

# Need to move the main Jar file
RUN cp lib/jfileserver-${project.version}.jar jfileserver.jar

# Make the run script executable
RUN chmod +x /jfileserver/runsrv.sh

# Create the default log file folder
RUN mkdir logs

# Expose the file server ports
EXPOSE 445/tcp
EXPOSE 139/tcp
EXPOSE 138/udp
EXPOSE 137/udp

# Environment variables used in the server configuration that can be overridden
ENV JFSRV_SMB_ENABLE true
ENV JFSRV_FTP_ENABLE false
ENV JFSRV_NFS_ENABLE false

ENV JFSRV_SMB_SERVERNAME jfilesrv
ENV JFSRV_SMB_DOMAIN domain

ENV JFSRV_SMB_DIALECTS smb1
ENV JFSRV_SMB_DEBUGFLAGS Negotiate,Socket,State

ENV JFSRV_FTP_PORT 21
ENV JFSRV_FTP_DEBUGFLAGS File,Search,Error,DataPort,Directory

ENV JFSRV_NFS_DEBUGFLAGS File,FileIO

ENV JFSRV_SHARE_NAME jfileshare
ENV JFSRV_SHARE_COMMENT Test shared filesystem

ENV JFSRV_DEBUG_OUTPUT File
ENV JFSRV_DEBUG_LOGPATH /jfileserver/logs/jfileserver.log

# Run the file server java application
ENTRYPOINT ["/jfileserver/runsrv.sh"]
