FROM alpine:3.12.0

LABEL wangzelin wangzelinahu@126.com

ARG VERSION=1.0.3
ARG GLIBC_VERSION=2.29-r0
ARG FILENAME=bitcoin-sv-${VERSION}-x86_64-linux-gnu.tar.gz
ARG BITCOIN_SV_SHA256=e3145eb6b1aae551fa0dd442f568ba1fa9ae27b989341f85a1ec2a7084859131
ARG BITCOIN_SV_SHASUM="${BITCOIN_SV_SHA256}  ${FILENAME}"
ENV BITCOIN_SV_DATADIR=/root/bitcoin-sv CONFIG_PATH=/root/bitcoin-sv.conf


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add wget tar bash gnupg \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && wget https://download.bitcoinsv.io/bitcoinsv/${VERSION}/${FILENAME} \
    && wget https://download.bitcoinsv.io/bitcoinsv/${VERSION}/${FILENAME_ASC} \
    && echo "${BITCOIN_SV_SHASUM}" | sha256sum -c \
    && chmod a+x /glibc-${GLIBC_VERSION}.apk \
    && chmod a+x /glibc-bin-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-bin-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-bin-${GLIBC_VERSION}.apk \
    && tar zxf /${FILENAME} \
    && mv bitcoin-sv-${VERSION}/bin/* /usr/local/bin/ \
    && rm -rf /bitcoin-sv-${VERSION} \
    && rm -rf /${FILENAME} \
    && mkdir -p ${BITCOIN_SV_DATADIR} \
    && chown -R root:root ${BITCOIN_SV_DATADIR} \
    && apk del wget tar

COPY bitcoin-sv.conf ${CONFIG_PATH}

# rpcport syncport  zmqport
EXPOSE 8046 8333 38346

CMD ["bitcoind","-conf=/root/bitcoin-sv.conf"]
