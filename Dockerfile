FROM mysql:5.6
ENV MYSQL_ROOT_PASSWORD mysql 
ENV MYSQL_DATABASE umls
ENV MYSQL_USER mysql
ENV MYSQL_PASSWORD mysql
ENV MYSQL_HOME /var/mysql
EXPOSE 3306
WORKDIR /root
ARG S3_KEY
ARG S3_SECRET
ENV AWS_ACCESS_KEY_ID=${S3_KEY}
ENV AWS_SECRET_ACCESS_KEY=${S3_SECRET}
ADD download.sh /download.sh
RUN /download.sh
RUN tar xfj 2017AA-active-metasubset.tar.bz2
RUN ls
RUN mkdir /code
CMD tail -f /dev/null
