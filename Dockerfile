FROM openjdk:8-jre-alpine
EXPOSE 8080
ENV APP_HOME /usr/app
COPY target/test-${env.PROJECT_VERSION}.jar $APP_HOME/app.jar
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar app.jar"]