FROM maven:3.8.4-openjdk-11-slim

COPY target/spring-petclinic-2.7.0-SNAPSHOT.jar	 /peclinic.jar

ENTRYPOINT ["java", "-jar", "/peclinic.jar"]

