FROM docker.io/centos:7

MAINTAINER anthony@atgreen.org

RUN yum -y install \
    rpm-build gcc-c++ gcc make patch \
              libcurl-devel activemq-cpp-devel json-c-devel \
	      autoreconf autoconf automake

CMD cd /opt && autoreconf --install && ./configure && make dist && rpmbuild -ba --define _topdir /opt greenfx-ticks-oanda.spec

