FROM tomcat:8.5.40-jre8

COPY tomcat/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY tomcat/context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY tomcat/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
RUN mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/startpage
COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
ENV JAVA_OPTS=""
EXPOSE 8080

CMD ["catalina.sh", "run"]
