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
