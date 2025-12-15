FROM eclipse-temurin:17-jdk
EXPOSE 8080
ADD target/student-management-0.0.1-SNAPSHOT.jar StudentsManagement.jar
ENTRYPOINT ["java", "-jar", "StudentsManagement.jar"]
