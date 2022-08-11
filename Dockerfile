FROM ubuntu

ENV HELM_VERSION v3.7.2

RUN apt-get update && apt-get install -yqq curl tar bash dos2unix
RUN set -ex \
    && curl -sSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 

COPY entrypoint.sh /entrypoint.sh
RUN dos2unix "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
