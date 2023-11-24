FROM openjdk
EXPOSE 8080
WORKDIR /app
COPY . /app
RUN javac Hello_world.java
CMD ["java","Hello_world"]
