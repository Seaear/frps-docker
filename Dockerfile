FROM alpine:3.8

ENV FRP_VERSION 0.22.0
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frps \
    && cp frp_${FRP_VERSION}_linux_amd64/frps* /frps/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

RUN mkdir /conf
VOLUME /conf

WORKDIR /frps

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["./frps","-c","/conf/frps.ini"]
