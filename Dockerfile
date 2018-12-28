FROM busybox

ENV FRP_VERSION 0.22.0
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frps \
    && mkdir /conf \
    && cp frp_${FRP_VERSION}_linux_amd64/frps* /frps/ \
    && cp /frps/frps*.ini /conf/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

VOLUME /conf
EXPOSE 80 443 6000 7000 7500

WORKDIR /frps

ENTRYPOINT ["./frps","-c","/conf/frps.ini"]
