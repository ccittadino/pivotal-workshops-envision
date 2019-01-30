#!/usr/bin/env bash

# ==============================================

# Reference: https://dzone.com/articles/installing-openjdk-11-on-ubuntu-1804-for-real (Installing OpenJDK Manually)

# if [ -f ~/openjdk-11+28_linux-x64_bin.tar.gz ]
# then
#     echo "* Java downloaded already." 
# else
#   echo "* Downloading java..."
#   wget -nc https://download.java.net/java/GA/jdk11/28/GPL/openjdk-11+28_linux-x64_bin.tar.gz -O ~/openjdk-11+28_linux-x64_bin.tar.gz
# fi

# if [ -d /usr/lib/jvm ]
# then
#     echo "* Java already installed." 
# else
#   echo "* Installing java..."
#   mkdir /usr/lib/jvm
#   tar xfvz ~/openjdk-11+28_linux-x64_bin.tar.gz --directory /usr/lib/jvm
# fi

# echo "* Adding java to path..."
# echo "export JAVA_HOME=/usr/lib/jvm/jdk-11/" >> ~/.bashrc
# echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

# ==============================================

# Don't need gradle this way, sprint-initializr brings it for us :)
#apt-get update
#apt-get install -y gradle

# GCP Shell already has make
#echo "* Getting 'make'..."
#apt-get install make

# ==============================================

# Reference: https://redis.io/topics/quickstart

# if [ -f ~/redis-stable.tar.gz ]
# then
#     echo "* Redis downloaded already." 
# else
#   echo "* Downloading redis..."
#   wget -nc http://download.redis.io/redis-stable.tar.gz -O ~/redis-stable.tar.gz
# fi

# if [ -f /usr/local/bin/redis-server ]
# then
#     echo "* Redis already installed." 
# else
#   echo "* Installing redis..."
#   tar xvzf ~/redis-stable.tar.gz --directory ~
#   cd ~/redis-stable
#   make
#   make install
# fi

# echo "* Starting redis..."
# redis-server --daemonize yes

# Reference: https://hub.docker.com/_/redis/
echo "* Installing redis..."
docker run --name redis -p 6379:6379 -d redis
# To connect via cli:
# docker run -it --link redis:redis --rm redis redis-cli -h redis -p 6379
# To connect via an app:
# docker run --name some-app --link redis:redis -d application-that-uses-redis

# ==============================================

echo "* Installing cf cli..."
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
sudo apt-get update
sudo apt-get install cf-cli

# ==============================================

# TODO: add login config against single account

# TODO: add auto creation of developer-laptop space

# ==============================================
