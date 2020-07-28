package com.swrap.avgspringbootstarter;

import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.Properties;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class VersionController {

    @GetMapping("/version")
    public ResponseEntity<String> GetVersion() {
        final Properties properties = new Properties();
        try {
            properties.load(this.getClass().getClassLoader().getResourceAsStream("project.properties"));
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<String>(
            String.format(
                "Version: %s ArtifactID: %s", 
                properties.getProperty("version"),
                properties.getProperty("artifactId")
            ),
            HttpStatus.OK);
    }
}