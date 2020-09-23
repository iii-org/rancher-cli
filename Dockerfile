FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install curl -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN curl -LO https://github.com/rancher/cli/releases/download/v2.4.6/rancher-linux-amd64-v2.4.6.tar.gz
RUN tar xf rancher-linux-amd64-v2.4.6.tar.gz
RUN mv rancher-v2.4.6/rancher /usr/bin/rancher
RUN rm -rf rancher-v2.4.6/


