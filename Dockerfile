# Use OpenJDK as base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the jar file into the container
COPY target/simple-java-app.jar app.jar

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]

# Expose port (change if your app runs on another port)
EXPOSE 8080
