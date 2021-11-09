FROM  openresty/openresty:1.19.9.1-0-buster-fat

COPY default.conf /etc/nginx/conf.d/default.conf
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod +x get_helm.sh && ./get_helm.sh

# RUN apt update && \
#     apt install  -y default-jre && \
#     apt install -y default-jdk


# RUN curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64 && \
# chmod +x ./kind && \
# mv ./kind /usr/bin/kind

# RUN apt-get update && \
#     apt-get -qy full-upgrade && \
#     apt-get install -qy curl && \
#     apt-get install -qy curl && \
#     curl -sSL https://get.docker.com/ | sh

