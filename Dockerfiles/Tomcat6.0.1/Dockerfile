FROM lwis/java5

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# runtime dependency for Tomcat Native Libraries
RUN apt-get update && apt-get install -y libapr1 && rm -rf /var/lib/apt/lists/*

ENV TOMCAT_MAJOR 6
ENV TOMCAT_VERSION 6.0.1

# https://issues.apache.org/jira/browse/INFRA-8753?focusedCommentId=14735394#comment-14735394
ENV TOMCAT_TGZ_URL https://archive.apache.org/dist/tomcat/tomcat-6/v6.0.1/bin/apache-tomcat-6.0.1.tar.gz

RUN set -x \
	\
	&& wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL" \
	&& tar xvf tomcat.tar.gz -C "$CATALINA_HOME" --strip-components=1

# TODO find a simple hacky way to verify Tomcat Native is working properly
# (the way we use in 7+ doesn't work here because we have no "configtest")

EXPOSE 8080
CMD ["bin/catalina.sh", "run"]
