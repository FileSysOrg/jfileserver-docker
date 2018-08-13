FROM openjdk:8

# Arguments from Maven
ARG artifactId
ARG groupId
ARG version

ENV ARTIFACT_ID=${artifactId} GROUP_ID=${groupId} VERSION=${version}

# Set the working directory for the file server
WORKDIR /jfileserver

# Copy in the Jars, scripts and configuration files
COPY target/jfileserver ./

# Need to move the main Jar file
RUN mv lib/jfileserver-$VERSION.jar jfileserver.jar

# Make the run script executable
RUN chmod +x /jfileserver/runsrv.sh

# Create the default log file folder
RUN mkdir logs

# Expose the file server ports
EXPOSE 1445
EXPOSE 1139
EXPOSE 1138
EXPOSE 1137

# Run the file server java application
ENTRYPOINT ["/jfileserver/runsrv.sh"]
