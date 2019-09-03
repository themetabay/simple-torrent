FROM alpine
COPY --from=boypt/cloud-torrent /usr/local/bin/cloud-torrent /usr/local/bin/cloud-torrent
RUN apk add --no-cache ca-certificates
ENTRYPOINT ["cloud-torrent"]
