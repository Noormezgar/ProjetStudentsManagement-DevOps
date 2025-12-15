FROM openjdk:17
EXPOSE 8080
ADD target/student-management-0.0.1-SNAPSHOT.jar StudentsManagement.jar
ENTRYPOINT ["java", "-jar", "StudentsManagement.jar"]