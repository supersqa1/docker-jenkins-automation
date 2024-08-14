FROM jenkins/jenkins:2.452.4-jdk11

USER root

# Install Firefox and other requirements 
RUN apt-get update && apt-get install -y \
    lsb-release \
    wget \
    vim \
    bzip2 \
    libx11-xcb1 \
    libdbus-glib-1-2 \
    python3-pip \
    python3-venv \
    -yqq \
    unzip \
    curl \
    firefox-esr \
    firefox-esr

ENV FIREFOX_VER 99.0b8

# install FireFox
RUN curl -sSLO https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VER}/linux-x86_64/en-US/firefox-${FIREFOX_VER}.tar.bz2
RUN tar -jxf firefox-*
RUN mv firefox /opt/
RUN chmod 755 /opt/firefox
RUN chmod 755 /opt/firefox/firefox



# Copy the Selenium script to the container
COPY selenium_examples /selenium_examples

WORKDIR /

# Create a Python virtual environment and install Selenium
RUN python3 -m venv myenv \
    && . myenv/bin/activate \
    && pip install --upgrade pip \
    && pip install selenium

# Switch to Jenkins user
USER jenkins


# Run the Selenium script
WORKDIR /selenium_examples
CMD . /myenv/bin/activate && python selenium_firefox_example.py


