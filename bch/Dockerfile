FROM alpine:3.12.0

LABEL wangzelin wangzelinahu@126.com

ARG VERSION=0.21.9
ARG GLIBC_VERSION=2.29-r0
ARG FILENAME=bitcoin-abc-${VERSION}-x86_64-linux-gnu.tar.gz
ARG FILENAME_ASC=jasonbcox-sha256sums.${VERSION}.asc
ENV BITCOIN_ABC_DATADIR=/root/bitcoin-abc CONFIG_PATH=/root/bitcoin-abc.conf


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add wget tar bash gnupg \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && wget https://download.bitcoinabc.org/latest/linux/${FILENAME} \
    && wget https://download.bitcoinabc.org/latest/${FILENAME_ASC} \
    && gpg --keyserver keyserver.ubuntu.com --recv-key E4486356E7A81D2C \
    && gpg --verify ${FILENAME_ASC} \
    && chmod a+x /glibc-${GLIBC_VERSION}.apk \
    && chmod a+x /glibc-bin-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-bin-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-bin-${GLIBC_VERSION}.apk \
    && tar zxf /${FILENAME} \
    && mv bitcoin-abc-${VERSION}/bin/* /usr/local/bin/ \
    && rm -rf /bitcoin-abc-${VERSION} \
    && rm -rf /${FILENAME} \
    && rm -rf /${FILENAME_ASC} \
    && mkdir -p ${BITCOIN_ABC_DATADIR} \
    && chown -R root:root ${BITCOIN_ABC_DATADIR} \
    && apk del wget tar

COPY bitcoin-abc.conf ${CONFIG_PATH}

# rpcport syncport  zmqport
EXPOSE 8031 8333 38331

CMD ["bitcoind","-conf=/root/bitcoin-abc.conf"]
