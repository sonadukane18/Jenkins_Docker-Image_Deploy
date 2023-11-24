FROM openjdk
EXPOSE 8080
WORKDIR /app
COPY . /app
RUN javac Hello.java
CMD ["java","Hello"]