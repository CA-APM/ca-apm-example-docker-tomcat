#!/bin/sh

# copy Browser Agent jars
cp $WILY_HOME/examples/APM/BrowserAgent/ext/*.jar $WILY_HOME/core/ext

# set EM host and port
sed -Ei "s/agentManager.url.1=localhost:5001/agentManager.url.1=$EM_HOST:$EM_PORT/" $WILY_HOME/core/config/IntroscopeAgent.profile

# enable Browser Agent
sed -Ei 's/#introscope.agent.browseragent.enabled=false/introscope.agent.browseragent.enabled=true/' $WILY_HOME/core/config/IntroscopeAgent.profile
sed -Ei 's/#browseragent.pbd/browseragent.pbd/' $WILY_HOME/core/config/tomcat-typical.pbl

# now add the APM agent to Tomcat startup parameters
export CATALINA_OPTS="$CATALINA_OPTS -Xmx2048m -javaagent:$WILY_HOME/Agent.jar -Dcom.wily.introscope.agentProfile=$WILY_HOME/core/config/IntroscopeAgent.profile -Dcom.wily.introscope.agent.agentName=$AGENT_NAME"
