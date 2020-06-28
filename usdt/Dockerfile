FROM alpine:3.12.0

LABEL wangzelin wangzelinahu@126.com

ARG VERSION=0.8.2
ARG GLIBC_VERSION=2.29-r0
ARG FILENAME=omnicore-${VERSION}-x86_64-linux-gnu.tar.gz
ARG USDT_SHA256=13fad4537f98ab5356454436df6a808995c2c462563d4256a191fea0f10458e9
ARG USDT_SHASUM="${USDT_SHA256}  ${FILENAME}"
ENV USDT_DATADIR=/root/usdt CONFIG_PATH=/root/usdt.conf


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add wget tar bash gnupg \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && wget https://bintray.com/artifact/download/omni/OmniBinaries/${FILENAME} \
    && echo "${USDT_SHASUM}" | sha256sum -c \
    && chmod a+x /glibc-${GLIBC_VERSION}.apk \
    && chmod a+x /glibc-bin-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-${GLIBC_VERSION}.apk \
    && apk --no-cache --allow-untrusted add glibc-bin-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-${GLIBC_VERSION}.apk \
    && rm -rf /glibc-bin-${GLIBC_VERSION}.apk \
    && tar zxf /${FILENAME} \
    && mv omnicore-${VERSION}/bin/* /usr/local/bin/ \
    && rm -rf /omnicore-${VERSION} \
    && rm -rf /${FILENAME} \
    && mkdir -p ${USDT_DATADIR} \
    && chown -R root:root ${USDT_DATADIR} \
    && apk del wget tar

COPY usdt.conf ${CONFIG_PATH}

# rpcport syncport  zmqport
EXPOSE 8332 8333 38337

CMD ["omnicored","-conf=/root/usdt.conf"]
