FROM tomcat:8.0.20-jre8

COPY /Users/Shared/Jenkins/Home/workspace/testrepo-dev/build/libs/testrepo-dev.war /usr/local/tomcat/webapps/atm/
