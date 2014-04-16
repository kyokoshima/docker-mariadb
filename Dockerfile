FROM centos
MAINTAINER kyokoshima
RUN yum groupinstall -y "Development Tools"
RUN yum install -y git openssl-devel

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN source ~/.bash_profile
ENV PATH ~/.rbenv/bin:$PATH
RUN rbenv install 2.1.1

ADD MariaDB.repo /etc/yum.repos.d/MariaDB.repo
RUN yum install -y MariaDB-server MariaDB-client MariaDB-devel

RUN service mysql start
