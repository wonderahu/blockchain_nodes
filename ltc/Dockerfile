FROM alpine:3.12.0

LABEL wangzelin wangzelinahu@126.com

ARG VERSION=0.18.1
ARG GLIBC_VERSION=2.29-r0
ARG FILENAME=litecoin-${VERSION}-x86_64-linux-gnu.tar.gz
ARG FILENAME_ASC=${FILENAME}.asc
ENV LITECOIN_DATADIR=/root/litecoin CONFIG_PATH=/root/litecoin.conf


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add wget tar bash gnupg \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && wget https://download.litecoin.org/litecoin-${VERSION}/linux/${FILENAME} \
    && wget https://download.litecoin.org/litecoin-${VERSION}/linux/${FILENAME_ASC} \
    && gpg --keyserver keyserver.ubuntu.com --recv-key FE3348877809386C \
    && gpg --verify ${FILENAME_ASC} \
    && chmod a+x /glibc-${GLIBC_VERSION}.apk \
    && chmod a+x /glibc-bin-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-bin-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-bin-${GLIBC_VERSION}.apk \
    && tar zxf /${FILENAME} \
    && mv litecoin-${VERSION}/bin/* /usr/local/bin/ \
    && rm -rf /litecoin-${VERSION} \
    && rm -rf /${FILENAME} \
    && rm -rf /${FILENAME_ASC} \
    && mkdir -p ${LITECOIN_DATADIR} \
    && chown -R root:root ${LITECOIN_DATADIR} \
    && apk del wget tar


COPY litecoin.conf ${CONFIG_PATH}

# rpcport syncport  zmqport
EXPOSE 8034 9333 38334

CMD ["litecoind","-conf=/root/litecoin.conf"]
