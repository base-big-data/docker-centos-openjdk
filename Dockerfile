FROM centos:7

LABEL maintainer="Caiwenhui <471113744@qq.com>"

ENV JAVA_HOME /usr/lib/jvm/java-openjdk

# 换阿里云源
RUN yum install -y wget;\
  wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo;\
  # 移除阿里已经不用的域名
  sed -i '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo;\
  sed -i '/mirrors.cloud.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo;\
  yum clean all; \
  yum makecache

# # 安装基础必备软件
RUN yum update -y; \
  yum intall -y deltarpm;\
  yum install -y java-1.8.0-openjdk-devel unzip curl vim python-setuptools sudo; \
  yum clean all;\
  yum makecache


CMD ["/bin/bash"]