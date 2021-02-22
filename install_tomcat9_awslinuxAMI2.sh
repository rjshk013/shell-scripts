#!/bin/bash
#Step 1: Install Java on Amazon Linux 2
#Ensure Java is installed and working perfectly in the server.

#Update and reboot the server:

sudo yum -y update

sudo yum -y install java-1.8.0
#Step 2: Create tomcat user and group
#We’ll be creating a dedicated system tomcat user and group.

sudo groupadd --system tomcat
sudo useradd -d /usr/share/tomcat -r -s /bin/false -g tomcat tomcat
#Step 3: Install Tomcat 9 on Amazon Linux 2
sudo yum -y install wget
export VER="9.0.41"
wget https://downloads.apache.org/tomcat/tomcat-9/v${VER}/bin/apache-tomcat-${VER}.tar.gz
#Use tar command line tool to extract downloaded archive.
sudo tar xvf apache-tomcat-${VER}.tar.gz -C /usr/share/
#Create Symlink to the folder /usr/share/tomcat. This is for easy updates.
sudo ln -s /usr/share/apache-tomcat-$VER/ /usr/share/tomcat
#Update folder permissions:

sudo chown -R tomcat:tomcat /usr/share/tomcat
sudo chown -R tomcat:tomcat /usr/share/apache-tomcat-$VER/ 

#Create Tomcat Systemd service:

sudo tee /etc/systemd/system/tomcat.service<<EOF
[Unit]
Description=Tomcat Server
After=syslog.target network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment='JAVA_OPTS=-Djava.awt.headless=true'
Environment=CATALINA_HOME=/usr/share/tomcat
Environment=CATALINA_BASE=/usr/share/tomcat
Environment=CATALINA_PID=/usr/share/tomcat/temp/tomcat.pid
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M'
ExecStart=/usr/share/tomcat/bin/catalina.sh start
ExecStop=/usr/share/tomcat/bin/catalina.sh stop

[Install]
WantedBy=multi-user.target
EOF

#Enable and start tomcat service:

sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat

#Step 4: Configure Tomcat Authentication
#We have to edit Tomcat configuration file to enable Admin and Manager UI roles.

sudo vim /usr/share/tomcat/conf/tomcat-users.xml
#Add below lines before closing with </tomcat-users>

<role rolename="admin-gui"/>
<role rolename="manager-gui"/>
<user username="admin" password="TomcatAdminP@ssw0rd" fullName="Administrator" roles="admin-gui,manager-gui"/>

#Configure Apache web server as a proxy for Tomcat server. First install httpd package.

sudo yum -y install httpd 
#Create VirtualHost file for Tomcat Admin web interface:

$ sudo vim /etc/httpd/conf.d/tomcat_manager.conf
<VirtualHost *:80>
    ServerAdmin root@localhost
    ServerName tomcat.hirebestengineers.com
    DefaultType text/html
    ProxyRequests off
    ProxyPreserveHost On
    ProxyPass / http://localhost:8080/
    ProxyPassReverse / http://localhost:8080/
</VirtualHost>

Restart httpd service:

sudo systemctl restart httpd
sudo systemctl enable httpd
