FROM registry.redhat.io/openshift4/ose-cli:latest as ose-cli

FROM registry.access.redhat.com/ubi9:9.2-722

RUN curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 --output /tmp/ttyd.x86_64 && \
    chmod +x /tmp/ttyd.x86_64 && \
    mv /tmp/ttyd.x86_64 /usr/bin/ttyd

COPY --from=ose-cli /usr/bin/kubectl /usr/bin/
COPY --from=ose-cli /usr/bin/oc /usr/bin/

CMD ["ttyd", "-p 8080", "bash"]
