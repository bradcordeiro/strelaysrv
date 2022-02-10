FROM alpine:3.15 AS extractor
ADD https://github.com/syncthing/relaysrv/releases/download/v1.18.6/strelaysrv-linux-amd64-v1.18.6.tar.gz ./
RUN tar -xf strelaysrv-linux-amd64-v1.18.6.tar.gz

FROM alpine:3.15
COPY --from=extractor /strelaysrv-linux-amd64-v1.18.6/strelaysrv /usr/bin/strelaysrv
VOLUME ["/keys"]
EXPOSE 22067/tcp 22070/tcp

ENTRYPOINT ["strelaysrv", "-keys=/keys"]