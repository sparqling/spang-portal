FROM httpd:2.4

RUN apt-get update \
  && apt-get install -y cpanminus make \
  && cpanm Getopt::Std LWP::UserAgent

 
RUN sed -ri 's/#LoadModule cgid_module/LoadModule cgid_module/g; \ 
             s/DirectoryIndex index.html/DirectoryIndex index.cgi index.html/g; \ 
             s/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks ExecCGI/g; \
             s/#AddHandler cgi-script .cgi/AddHandler cgi-script .pl .cgi/g' /usr/local/apache2/conf/httpd.conf


RUN echo '<FilesMatch "^[^\.]+$"> \n \
             SetHandler cgi-script \n \
          </FilesMatch>' >> /usr/local/apache2/conf/httpd.conf

COPY ./spang /opt/spang
COPY ./user_prefix /opt/user_prefix
COPY ./conf/passenger.conf /tmp/passenger.conf
RUN cat /tmp/passenger.conf >> /usr/local/apache2/conf/httpd.conf

RUN apt-get install -y rbenv git curl gcc-6 autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev \
  && mkdir -p "$(rbenv root)"/plugins \
  && git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build \
  && rbenv install 2.5.5

RUN echo 'export PATH="$(rbenv root)/shims:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.bashrc

RUN rbenv global 2.5.5 \
  && rbenv exec gem install bundle 

RUN apt install -y vim

RUN apt install -y nodejs

RUN apt install -y libsqlite3-dev libcurl4-openssl-dev ruby-dev

RUN bash -c 'source ~/.bashrc && gem install passenger --no-ri --no-rdoc'

RUN bash -c 'source ~/.bashrc && passenger-install-apache2-module'
