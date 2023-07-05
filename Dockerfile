# This assignment was submitted by Helen Glass. This Dockerfile builds an a Tomcat image with the prospective student
# survey that was created in HW1.

# Use an official Tomcat runtime as the base image
FROM tomcat:9.0

# Set the working directory in the container
WORKDIR /usr/local/tomcat

# Remove the default Tomcat webapps
RUN rm -rf webapps/*

# Copy your application WAR file into the container
COPY Prospective_Student_Survey_Helen_Glass.war webapps/K8s_Prospective_Student_Survey_Helen_Glass.war

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]