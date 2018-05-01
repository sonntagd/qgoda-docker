FROM perl:5.24

MAINTAINER Dominic Sonntag <dominic.sonntag@sonntag.it>

RUN apt-get update && apt-get install -y make nodejs git apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

WORKDIR /root/

RUN git clone https://github.com/gflohr/qgoda.git

WORKDIR /root/qgoda/

# URI::Escape is missing in dependecy list!
RUN cpanm URI::Escape

RUN cpanm --installdeps .
RUN cpanm Text::Markdown
RUN cpanm -n .

VOLUME /data
WORKDIR /data

ENTRYPOINT ["qgoda"]