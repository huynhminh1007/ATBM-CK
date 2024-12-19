FROM tomcat:9.0.98-jre21-temurin
COPY target/ltv.war /usr/local/tomcat/webapps/ROOT.war
COPY config/keystore.jks /usr/local/tomcat/conf/
COPY config/server.xml /usr/local/tomcat/conf/
EXPOSE 8443
CMD ["catalina.sh", "run"]
