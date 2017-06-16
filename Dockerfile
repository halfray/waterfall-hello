FROM docker.io/openjdk
MAINTAINER halfray <hui_ease@163.com>

RUN mkdir -p gradle
RUN mkdir -p grails-app

ADD gradle gradle/
ADD gradlew  gradlew 
ADD build.gradle build.gradle

RUN ./gradlew clean
