FROM docker.io/centos:7

MAINTAINER anthony@atgreen.org

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
ADD dist /tmp
RUN yum install -y /tmp/greenfx-oanda-to-tickq*x86_64.rpm && \
    mv /tmp/*.src.rpm /usr/share/greenfx-oanda-to-tickq* && \
    yum -y update && yum clean all && \
    rm /tmp/*rpm

USER greenfx
CMD oanda-to-tickq

