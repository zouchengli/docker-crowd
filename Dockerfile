FROM openjdk:8-stretch

LABEL maintainer="chengli.zou <chengli.zou@gmail.com>" version="4.2.1"

ARG CROWD_VERSION=4.2.1
ARG CROWD_PRODUCT=crowd
ARG AGENT_VERSION=1.2.3
ARG MYSQL_DRIVER_VERSION=5.1.48

ENV CROWD_USER=crowd \
    CROWD_GROUP=crowd \
    CROWD_HOME=/var/crowd \
    CROWD_INSTALL=/opt/crowd \
    JVM_MINIMUM_MEMORY=1g \
    JVM_MAXIMUM_MEMORY=3g \
    JVM_CODE_CACHE_ARGS='-XX:InitialCodeCacheSize=1g -XX:ReservedCodeCacheSize=2g'

RUN mkdir -p ${CROWD_INSTALL}/lib ${CROWD_HOME} \
&& curl -o /tmp/atlassian.tar.gz https://product-downloads.atlassian.com/software/crowd/downloads/atlassian-${CROWD_PRODUCT}-${CROWD_VERSION}.tar.gz -L \
&& tar xzf /tmp/atlassian.tar.gz -C ${CROWD_INSTALL}/ --strip-components 1 \
&& rm -f /tmp/atlassian.tar.gz \
&& curl -o ${CROWD_INSTALL}/apache-tomcat/lib/mysql-connector-java-${MYSQL_DRIVER_VERSION}.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_DRIVER_VERSION}/mysql-connector-java-${MYSQL_DRIVER_VERSION}.jar -L \
&& echo "crowd.home = ${CROWD_HOME}" > ${CROWD_INSTALL}/crowd-webapp/WEB-INF/classes/crowd-init.properties

RUN export CONTAINER_USER=$CROWD_USER \
&& export CONTAINER_GROUP=$CROWD_GROUP \
&& groupadd -r $CROWD_GROUP && useradd -r -g $CROWD_GROUP $CROWD_USER \
&& chown -R $CROWD_USER:$CROWD_GROUP ${CROWD_INSTALL} ${CROWD_HOME}/

VOLUME $CROWD_HOME
USER $CROWD_USER
WORKDIR $CROWD_INSTALL
EXPOSE 8095

ENTRYPOINT ["/opt/crowd/start_crowd.sh", "-fg"]
