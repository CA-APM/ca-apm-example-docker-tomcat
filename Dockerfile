#FROM tomcat:8-jre7
FROM mytomcatapplication:latest

MAINTAINER guenter.grossberger@ca.com

ENV WILY_HOME=$CATALINA_HOME/wily \
    INTROSCOPE_VERSION=10.3.0.15 \
    EM_HOST=manager \
    EM_PORT=5001 \
    AGENT_NAME="Docker Tomcat Agent" \
    AGENT_HOSTNAME="docker_tomcat_01" \
    HEAP=2048m \
    ENABLE_BROWSER_AGENT=true

# install agent
ADD IntroscopeAgentFiles-NoInstaller${INTROSCOPE_VERSION}tomcat.unix.tar $CATALINA_HOME

# configure CA APM java agent
COPY setenv.sh $WILY_HOME/setenv.sh
RUN cat $WILY_HOME/setenv.sh >> $CATALINA_HOME/bin/setenv.sh \
    && chmod +x $CATALINA_HOME/bin/setenv.sh
