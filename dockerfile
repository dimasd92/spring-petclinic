FROM tomcat:8.5.32-jre8

COPY tomcat/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY tomcat/context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
# COPY tomcat/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY tomcat/server.xml /usr/local/tomcat/conf/server.xml
#COPY tomcat/tomcat-juli-8.5.32.jar /usr/local/tomcat/bin/tomcat-juli.jar
COPY tomcat/logging.properties /usr/local/tomcat/conf/logging.properties
RUN mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/startpage
COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
#ADD https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.2.0-amd64.deb /usr/local/tomcat/
#RUN dpkg -i filebeat-7.2.0-amd64.deb
COPY tomcat/logging.properties /usr/local/tomcat/conf/logging.properties
ENV JAVA_OPTS=""
EXPOSE 8080

CMD ["catalina.sh", "run"]
