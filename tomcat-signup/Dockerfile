# 빌더 스테이지
FROM openjdk:8-jre-alpine as builder

RUN apk update && \
    apk add --no-cache wget tar

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV CATALINA_HOME=/usr/local/tomcat9.0
ENV TOMCAT_VERSION=9.0.89

RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz && \
    mkdir -p $CATALINA_HOME && \
    tar -xvf apache-tomcat-9.0.89.tar.gz -C $CATALINA_HOME --strip-components=1 && \
    rm apache-tomcat-9.0.89.tar.gz && \
    wget https://dlm.mariadb.com/3752081/Connectors/java/connector-java-3.3.3/mariadb-java-client-3.3.3.jar && \
    mv mariadb-java-client-3.3.3.jar $CATALINA_HOME/lib/ && \
    rm -rf $CATALINA_HOME/webapps/* && \
    mkdir -p $CATALINA_HOME/webapps/ROOT && \
    wget https://repo1.maven.org/maven2/org/mindrot/jbcrypt/0.4/jbcrypt-0.4.jar && \
    mv jbcrypt-0.4.jar $CATALINA_HOME/lib/

COPY ./dist $CATALINA_HOME/webapps/ROOT/
COPY ./context.xml $CATALINA_HOME/conf/
COPY ./web.xml $CATALINA_HOME/webapps/ROOT/WEB-INF/

# 최종 이미지
FROM openjdk:8-jre-alpine

RUN apk add --no-cache openjdk8-jre-base && \
    rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV CATALINA_HOME=/usr/local/tomcat9.0
ENV PATH=$JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH

COPY --from=builder $CATALINA_HOME $CATALINA_HOME

EXPOSE 8080

CMD ["catalina.sh", "run"]

