FROM tomcat:8-jre7

MAINTAINER guenter.grossberger@ca.com

ENV WILY_HOME=$CATALINA_HOME/wily
ENV INTROSCOPE_VERSION=10.2.0.27
ENV EM_HOST=em
ENV EM_PORT=5001
ENV AGENT_NAME="Docker_Tomcat_Agent"

# install application
#COPY application.war /usr/local/tomcat/webapps/application.war

# install agent
ADD IntroscopeAgentFiles-NoInstaller${INTROSCOPE_VERSION}tomcat.unix.tar /usr/local/tomcat

# configure CA APM java agent
COPY init_agent.sh $CATALINA_HOME/bin/setenv.sh
