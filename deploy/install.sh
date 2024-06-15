#!/bin/bash
# Install Java 11 (OpenJDK)
echo "Installing Java 17 (OpenJDK)"
yum install -y java-17-amazon-corretto.x86_64

# Create a systemd service file for the Spring Boot application

echo "Creating systemd service file"
cat <<EOF > /etc/systemd/system/server.service
[Unit]
Description=My App Server
After=syslog.target

[Service]
User=ec2-user
WorkingDirectory=/home/ec2-user/server
ExecStart=/usr/bin/java -Duser.timezone=UTC  -Dserver.port=8080 -jar /home/ec2-user/server/app.jar
SuccessExitStatus=143
StandardOutput=append:/var/log/server/server.log
StandardError=append:/var/log/server/server.log
SyslogIdentifier=my-server

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to apply the new service
systemctl daemon-reload

# Create a log file for the Spring Boot application
mkdir -p /var/log/server/
touch /var/log/server/server.log
chown ec2-user:ec2-user /var/log/server/server.log
chmod 664 /var/log/server/server.log

# Rename the JAR file to app.jar
