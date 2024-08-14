# docker-jenkins-automation
Docker file that is uses Jenkins as base image and installs Firefox.
It has a sample Selenium Python script that prints the title of the demostore page.

Notes:
* Image is built for both platforms `linux/amd64` and `linux/arm64` and pushed to Docker Hub
* supersqa/jenkins-firefox is the image in Docker Hub
* To run the image on Mac with silicon chip must add `--platfrom=linux/amd64` option

## Build the image
Just run the `build_image.sh` script. This will build the image for both platforms and pushs it to Docker Hub.
If the script is not modified it will build image tagged `supersqa/jenkins-firefox`
```
bash build_image.sh
```

## Run a container
If on Mac with M1/2 chip
```
docker run --platform linux/amd64 supersqa/jenkins-firefox
```

or
```
bash run_container.sh
```
If not
```
docker run supersqa/jenkins-firefox
```

Use volume to run other selenium script.
For example create a Selenium script in the `selenium_examples` folder.
```
docker run -it --platform linux/amd64 -v ./<path on local>:/<path to in container> supersqa/jenkins-firefox /myenv/bin/python3 /<path to in container>.py
```
Example
```
docker run -it --platform linux/amd64 -v ./selenium_examples:/selenium_examples supersqa/jenkins-firefox /myenv/bin/python3 /selenium_examples/selenium_firefox_example2.py
```
