mvn clean install -Dmaven.test.skip=true -Dskip.failsafe.tests=true 
export VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.version -q -DforceStdout)
export ARTIFACT_ID=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.artifactId -q -DforceStdout)
export JAR_NAME=${ARTIFACT_ID}-${VERSION}
docker build --build-arg jar_name=${JAR_NAME} -t $ARTIFACT_ID:$VERSION .