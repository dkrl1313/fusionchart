package com.example.demo.config;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

@Configuration
public class DemoMongoConfig{

    @Value("${spring.data.mongodb.database}")
    private String database;

    @Value("${spring.data.mongodb.host}")
    private String host;

    @Value("${spring.data.mongodb.port}")
    private int port;

    @Value("${spring.data.mongodb.username}")
    private String username;

    @Value("${spring.data.mongodb.password}")
    private String password;

    public @Bean MongoClient mongoClient() {
        MongoClientURI uri = new MongoClientURI("mongodb://mobilelog:3482mobilelog2004@121.78.124.180:27017/mobilelog");
        return new MongoClient(uri);
    }

    public @Bean MongoTemplate mongoTemplate() {
        return new MongoTemplate(mongoClient(), database);
    }

}