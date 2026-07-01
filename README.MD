# JFileServer Docker Sample

This sample demonstrates how to run JFileServer using Docker.

The sample includes a simple shared folder setup using the _org.filesys.smb.server.disk.JavaNIODiskDriver_ filesystem driver

JFileServer only has support for the older SMB1 protocol, for SMB2 and SMB3 support see the 
[jfileserver-enterprise docker project](https://github.com/FileSysOrg/fileserver-enterprise-docker).

## Configuring the Docker sample

The project includes a _docker-compose.yml_ file that can be used to run the JFileServer.

Edit the _docker-compose.yml_ file and set the volume mapping for the local host folder to be shared by the file server.

    volumes:
      - <MAP-TO-A-LOCAL-FOLDER>:/jfileserver/fileShare

The file server can be configured using environment variables. The following table shows the environment variables that
can be overridden, and their default values :-

| Variable Name         | Description                                        |Default Value|
|-----------------------|----------------------------------------------------|--|
| JFSRV_SMB_ENABLE      | Enable the SMB server                              |true
| JFSRV_FTP_ENABLE      | Enable the FTP server                              |false
| JFSRV_NFS_ENABLE      | Enable the NFS server                              |false
| JFSRV_SMB_SERVERNAME  | Name of the SMB server, for NetBIOS connections    |jfilesrv
| JFSRV_SMB_DOMAIN      | Domain or workgroup that the SMB server belongs to |domain
| JFSRV_SMB_DIALECTS    | SMB dialects that the SMB server will negotiate    |SMB1
| JFSRV_SMB_DEBUGFLAGS  | SMB debug flags                                    |Negotiate,Socket,State
| JFSRV_FTP_PORT        | Port that the FTP server listens on                |21
| JFSRV_FTP_DEBUGFLAGS  | FTP debug flags                                    |File,Search,Error,DataPort,Directory
| JFSRV_NFS_DEBUGFLAGS  | NFS debug flags                                    |File,FileIO
| JFSRV_SHARE_NAME      | Shared filesystem name                             |jfileshare
| JFSRV_SHARE_PATH      | Path to the shared filesystem data                 |/jfileserver/fileShare
| JFSRV_SHARE_COMMENT   | Comment for the shared filesystem                  |Test shared filesystem
| JFSRV_ADMIN_USER      | Administrator user name                            |admin
| JFSRV_ADMIN_PASSWORD  | Administrator user password                        |jfilesrv
| JFSRV_NORMAL_USER     | Normal user name                                   |user
| JFSRV_NORMAL_PASSWORD | Normal user password                               |java
| JFSRV_DEBUG_OUTPUT    | Debug output destination, 'File' or 'Console'      |Console
| JFSRV_DEBUG_LOGPATH   | Log file path when using 'File' debug output       |/jfileserver/logs/jfileserver.log

## Starting the file server

To start the file server, run the following command:

docker-compose up

