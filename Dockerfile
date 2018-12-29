FROM alpine:3.8 AS build-env
WORKDIR /supernode

RUN apk update && \
  apk add git \
  cmake \ 
  wget \
  build-base \ 
  boost-dev \
  pcre-dev \
  pkgconfig \
  openssl-dev \
  rapidjson-dev \
  readline-dev \
  libexecinfo-dev \
  libunwind-dev \
  check-dev \
  automake \
  autoconf \
  pkgconf

COPY ./build.sh /
RUN chmod +x /build.sh
RUN /build.sh

FROM alpine:3.8
MAINTAINER Mambix Ltd. <ledi.mambix@gmail.com>
WORKDIR /supernode

RUN apk update && \
  apk add boost \
  openssl

COPY --from=build-env /supernode/graft-ng /supernode

COPY ./run.sh /
RUN chmod +x /run.sh

EXPOSE 8545 30303

ENTRYPOINT [ "/run.sh" ]
