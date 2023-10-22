FROM openjdk:20-jdk-slim

MAINTAINER Vitalii Vorobii

ADD target/fraud-detection-service-jar-with-dependencies.jar ./app.jar

ENTRYPOINT java -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote.port=9011 \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.local.only=false \
  -XX:+UseG1GC \
  -XX:+TieredCompilation \
  -agentlib:jdwp=transport=dt_socket,address=*:8006,server=y,suspend=n -cp app.jar lpnu.fraud_detection.FraudDetectionServer