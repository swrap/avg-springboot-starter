FROM azul/zulu-openjdk-alpine:8-jre

ARG jar_name
ENV JAR_NAME=$jar_name.jar

WORKDIR /app
COPY ./target/$JAR_NAME .

ENTRYPOINT java -jar $JAR_NAME