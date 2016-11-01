FROM ubuntu:16.10

MAINTAINER agdula@github.org


# Install tools
RUN apt-get update \
  && apt-get install -y \
  software-properties-common \
  curl   \ 
  screen \
  mc     \
  git    \
  zsh


# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

#Install Oh My Zsh
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh || true &&\
    chsh -s /bin/zsh

# Define working directory.
WORKDIR /root

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["zsh"]




