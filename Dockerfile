# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Gradle wrapper and configuration files
COPY gradle /app/gradle
COPY gradlew /app/
COPY build.gradle /app/
COPY settings.gradle /app/

# Copy the rest of your application source code
COPY src /app/src

# Grant execute permission to the Gradle wrapper script
RUN chmod +x ./gradlew

# Build the application
RUN ./gradlew build

# Expose the port the application runs on
EXPOSE 8080

# Define the command to run the application
CMD ["java", "-jar", "build/libs/DevOps-Sample-1.0-SNAPSHOT.jar"]
