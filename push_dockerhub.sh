export VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.version -q -DforceStdout)
export ARTIFACT_ID=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.artifactId -q -DforceStdout)
docker tag $ARTIFACT_ID:$VERSION swrap/$ARTIFACT_ID:$VERSION
docker push swrap/$ARTIFACT_ID:$VERSION