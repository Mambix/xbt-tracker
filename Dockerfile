FROM alpine:3.8 AS build-env
WORKDIR /tracker

RUN apk update && \
  apk add git \
  cmake \ 
  build-base \ 
  boost-dev \
  zlib-dev \
  mariadb-dev

COPY ./build.sh /
RUN chmod +x /build.sh
RUN /build.sh

FROM alpine:3.8
MAINTAINER Mambix Ltd. <ledi.mambix@gmail.com>
WORKDIR /tracker

RUN apk update && \
  apk add boost \
  openssl \
  mariadb-connector-c

COPY --from=build-env /tracker/xbt/Tracker/xbt_tracker /tracker/xbt_tracker
#COPY --from=build-env /tracker/xbt/Tracker/xbt_tracker.sql /tracker/xbt_tracker.sql

COPY ./run.sh /
RUN chmod +x /run.sh

EXPOSE 2710

CMD /run.sh
