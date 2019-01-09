FROM centos/httpd-24-centos7

USER root

# install Dependencies
RUN yum install -y autoconf && \
    yum install -y libtool && \
    yum install -y wget && \
    yum install -y httpd24-httpd-devel

# download tomcat-connector sources (mod_jk)
RUN wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.46-src.tar.gz && \
    tar -xf tomcat-connectors-1.2.46-src.tar.gz

# build tomcat-connector sources (mod_jk)
WORKDIR /opt/app-root/src/tomcat-connectors-1.2.46-src/native
RUN sh buildconf.sh && \
    sh configure --with-apxs=/opt/rh/httpd24/root/usr/bin/apxs && \
    make && \
    make install

# add mod_jk default conf
ADD resources/00-jk.conf $HTTPD_MAIN_CONF_MODULES_D_PATH
ADD resources/httpd-jk.conf $HTTPD_MAIN_CONF_D_PATH
ADD resources/uriworkermap.properties $HTTPD_MAIN_CONF_D_PATH
ADD resources/workers.properties $HTTPD_MAIN_CONF_D_PATH
