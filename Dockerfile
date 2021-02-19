FROM alpine
WORKDIR /app
USER root

COPY run.sh /app/run.sh

RUN apk --no-cache add curl
RUN apk --no-cache add bash
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/bin/kubectl
RUN curl -LO https://github.com/rancher/cli/releases/download/v2.4.6/rancher-linux-amd64-v2.4.6.tar.gz
RUN tar xf rancher-linux-amd64-v2.4.6.tar.gz
RUN mv rancher-v2.4.6/rancher /usr/bin/rancher
RUN rm -rf rancher-v2.4.6/
