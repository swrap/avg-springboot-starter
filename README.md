# avg-springboot-starter

Simple test project

The dockerfile runs as java azul using openjdk 8. It assumes that the jar is already built using java-8 using azul java. To make a full build run the following:

```bash
mvn clean install -Dmaven.test.skip=true -Dskip.failsafe.tests=true 
export VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.version -q -DforceStdout)
export ARTIFACT_ID=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.artifactId -q -DforceStdout)
export JAR_NAME=${ARTIFACT_ID}-${VERSION}
docker build --build-arg jar_name=${JAR_NAME} -t $ARTIFACT_ID:$VERSION .
```

To run the image that was just built in the previous step:
```
docker run --rm -p 9001:8080 $ARTIFACT_ID:$VERSION 
```


