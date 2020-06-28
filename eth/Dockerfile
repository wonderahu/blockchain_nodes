FROM alpine:3.12.0

LABEL wangzelin wangzelinahu@126.com

ARG GLIBC_VERSION=2.29-r0
ARG FILENAME=geth.tar.gz
ENV ETHEREUM_DATADIR /root/ethereum

COPY ["${FILENAME}","/${FILENAME}"]

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add wget tar bash gnupg \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && chmod a+x /glibc-${GLIBC_VERSION}.apk \
    && chmod a+x /glibc-bin-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-bin-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-bin-${GLIBC_VERSION}.apk \
    && tar zxf /${FILENAME} \
    && chown root:root /geth \
    && mv /geth /usr/local/bin/ \
    && rm -rf /${FILENAME} \
    && mkdir -p ${ETHEREUM_DATADIR} \
    && apk del wget tar

# rpcport syncport wsport
EXPOSE 8036 30303 8546

COPY ["docker_entrypoint.sh", "/usr/local/bin/docker_entrypoint.sh"]
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]
