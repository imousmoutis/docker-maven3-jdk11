FROM ubuntu:18.04

RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y wget && \
    apt-get -y install software-properties-common

RUN apt-get install -y openjdk-11-jdk  

RUN apt-get -y install maven && \
    apt-get -y install git

RUN apt-get -y install curl && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get -y install nodejs && \
	ln -s "$(which nodejs)" /usr/local/bin/node

RUN apt-get -y install libfreetype6 libfreetype6-dev && \
    apt-get -y install libfontconfig1 libfontconfig1-dev && \
    cd ~ && \
    export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64" && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    mv $PHANTOM_JS /usr/local/share && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

CMD ["bash"]