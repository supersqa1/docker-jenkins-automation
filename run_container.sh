set -e
set -x

docker run \
--platform linux/amd64 \
-u jenkins \
-v ./selenium_examples:/selenium_examples \
supersqa/jenkins-firefox:latest