FROM docker.io/openjdk
MAINTAINER halfray <hui_ease@163.com>

RUN mkdir -p /root/gradle/gradle
RUN mkdir -p /root/gradle/grails-app

ADD gradle /root/gradle/gradle
ADD gradle* /root/gradle/
ADD build.gradle /root/gradle/

RUN /root/gradle/gradlew 
RUN /root/gradle/gradlew clean
