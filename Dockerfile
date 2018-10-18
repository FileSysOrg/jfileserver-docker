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
EXPOSE 445
EXPOSE 139
EXPOSE 138
EXPOSE 137

# Run the file server java application
ENTRYPOINT ["/jfileserver/runsrv.sh"]
