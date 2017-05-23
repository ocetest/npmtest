#
# MAINTAINER        Jerry Xiao <ocellus@163.com>
# DOCKER-VERSION    1.6.2
#
# Dockerizing npm: Dockerfile for building npm images
#
FROM       bj/centos:7.1
MAINTAINER Jerry Xiao <ocellus@163.com>

ENV NODE_VERSION v7.10.0
ENV NPM_VERSION 4.2.0
ENV NODE_HOME /opt/node

# Install node
#ADD https://nodejs.org/dist/${MAVEN_VERSION}/node-${MAVEN_VERSION}-linux-x64.tar.xz /opt/

COPY node-v7.10.0-linux-x64.tar.xz  /opt/
COPY Dockerfile /opt/
COPY test.sh /opt/

RUN cd /opt/ && \
    xz -d  node-v7.10.0-linux-x64.tar.xz && \
    tar -xvf node-v7.10.0-linux-x64.tar  && \
    mv /opt/node-${NODE_VERSION}-linux-x64 /opt/node
RUN echo -e '\nexport NODE_HOME=/opt/node' >> /etc/profile && \
    echo -e '\nexport PATH=$NODE_HOME/bin:$PATH' >> /etc/profile
RUN  . /etc/profile  
RUN mkdir -pv /opt/ocetest/
