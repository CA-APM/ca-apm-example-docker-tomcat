FROM tomcat:7-jre8

MAINTAINER guenter.grossberger@ca.com

ENV WILY_HOME=/usr/local/tomcat/wily
ENV INTROSCOPE_VERSION=10.1.0.15
ENV EM_HOST=em
ENV EM_PORT=5001
ENV AGENT_NAME="Docker Tomcat Agent"

# install application
#COPY application.war /usr/local/tomcat/webapps/application.war

# install agent
ADD IntroscopeAgentFiles-NoInstaller${INTROSCOPE_VERSION}tomcat.unix.tar /usr/local/tomcat

# configure application and agent
COPY init_agent.sh /opt/init_agent.sh
RUN /opt/init_agent.sh

# now add the APM agent to Tomcat startup parameters
ENV CATALINA_OPTS="$CATALINA_OPTS -Xmx2048m -javaagent:$WILY_HOME/Agent.jar -Dcom.wily.introscope.agentProfile=$WILY_HOME/core/config/IntroscopeAgent.profile -Dcom.wily.introscope.agent.agentName=$AGENT_NAME"

EXPOSE 8080

CMD catalina.sh run
