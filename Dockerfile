FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    sudo wget gnupg unzip xfce4 xrdp lightdm

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
     echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable

    RUN wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2025.1.1.0/android-studio-2025.1.1.0-linux.tar.gz && \
    tar -xvzf android-studio-2025.1.1.0-linux.tar.gz -C /opt && \
    rm android-studio-2025.1.1.0-linux.tar.gz

    RUN wget https://cursor.com/download/linux/cursor-installer.deb && \
    dpkg -i cursor-installer.deb && \
    apt-get -f install -y

    RUN echo xfce4-session >~/.xsession
    EXPOSE 3389

    CMD ["xrdp", "--nodaemon"]
