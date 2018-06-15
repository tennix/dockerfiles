FROM circleci/python:3.6

COPY sources.list /etc/apt/sources.list

RUN curl -L https://github.com/jgm/pandoc/releases/download/1.19.2/pandoc-1.19.2-1-amd64.deb -o /tmp/pandoc.deb && \
    sudo dpkg -i /tmp/pandoc.deb && \
    sudo apt-get update && \
    sudo apt-get -y install texlive-xetex texlive-latex-extra texlive-lang-cjk etoolbox ttf-wqy-microhei && \
    sudo pip3 install qiniu boto3 && \
    sudo rm -rf /var/lib/apt/lists/*
