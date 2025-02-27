# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the project's pom.xml and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the project source
COPY src ./src

# Package the application
RUN mvn package -DskipTests

# Expose the port the application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","target/hotel-search-0.0.1-SNAPSHOT.jar"]
