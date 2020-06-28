FROM alpine:3.12.0

LABEL wangzelin wangzelinahu@126.com

ARG VERSION=0.20.0
ARG GLIBC_VERSION=2.29-r0
ARG FILENAME=bitcoin-${VERSION}-x86_64-linux-gnu.tar.gz
ARG FILENAME_ASC=SHA256SUMS.asc
ENV BITCOIN_CORE_DATADIR=/root/bitcoin-core CONFIG_PATH=/root/bitcoin-core.conf


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add wget tar bash gnupg \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && wget https://bitcoin.org/bin/bitcoin-core-${VERSION}/${FILENAME} \
    && wget https://bitcoin.org/bin/bitcoin-core-${VERSION}/${FILENAME_ASC} \
    && gpg --keyserver keyserver.ubuntu.com --recv-key 90C8019E36C2E964 \
    && gpg --verify ${FILENAME_ASC} \
    && chmod a+x /glibc-${GLIBC_VERSION}.apk \
    && chmod a+x /glibc-bin-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-bin-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-bin-${GLIBC_VERSION}.apk \
    && tar zxf /${FILENAME} \
    && mv bitcoin-${VERSION}/bin/* /usr/local/bin/ \
    && rm -rf /bitcoin-${VERSION} \
    && rm -rf /${FILENAME} \
    && rm -rf /${FILENAME_ASC} \
    && mkdir -p ${BITCOIN_CORE_DATADIR} \
    && chown -R root:root ${BITCOIN_CORE_DATADIR} \
    && apk del wget tar

COPY bitcoin-core.conf ${CONFIG_PATH}

# rpcport syncport  zmqport
EXPOSE 8030 8333 38330

CMD ["bitcoind","-conf=/root/bitcoin-core.conf"]
