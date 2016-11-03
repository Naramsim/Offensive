FROM java5

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV TOMCAT_MAJOR 6
ENV TOMCAT_VERSION 6.0.1
ENV TOMCAT_TGZ_URL https://archive.apache.org/dist/tomcat/tomcat-6/v6.0.1/bin/apache-tomcat-6.0.1.tar.gz
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# runtime dependency for Tomcat Native Libraries
RUN apt-get update && apt-get install -y libapr1 && rm -rf /var/lib/apt/lists/*

RUN groupadd tomcat \
	&& useradd -ms /bin/bash -g tomcat -d "$CATALINA_HOME" tomcatUser \
	&& chown -R tomcatUser:tomcat "$CATALINA_HOME"

USER tomcatUser

RUN set -x \
	\
	&& wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL" \
	&& tar xvf tomcat.tar.gz -C "$CATALINA_HOME" --strip-components=1

# TODO find a simple hacky way to verify Tomcat Native is working properly
# (the way we use in 7+ doesn't work here because we have no "configtest")

COPY ./server.xml /usr/local/tomcat/conf/server.xml
COPY ./context.xml /usr/local/tomcat/conf/context.xml
COPY ./tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY ./escalate.sh /usr/local/tomcat/escalate.sh
#COPY ./init.sh /usr/local/tomcat/bin/init.sh
RUN echo "#!/bin/bash" > bin/init.sh
RUN echo "sh /usr/local/tomcat/bin/catalina.sh start && sleep 2 && tail -f /etc/passwd" >> bin/init.sh

USER root
RUN chmod +x /usr/local/tomcat/bin/init.sh \
	&& chown tomcatUser:tomcat /usr/local/tomcat/bin/init.sh
RUN chmod +x /usr/local/tomcat/escalate.sh \
	&& chown tomcatUser:tomcat /usr/local/tomcat/escalate.sh
USER tomcatUser
USER root
EXPOSE 8080
#RUN bin/init.sh && sleep 2
CMD ["bin/init.sh"]
#CMD ["tail", "-f", "/usr/local/tomcat/logs/catalina.out"]
