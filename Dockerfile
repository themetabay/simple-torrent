FROM alpine
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/themetabay/simple-torrent"
COPY --from=boypt/cloud-torrent /usr/local/bin/cloud-torrent /usr/local/bin/cloud-torrent
COPY --from=rayou/rclone / /
COPY rclone.sh /usr/local/bin/rclone.sh
COPY cloud-torrent.json /cloud-torrent.json
RUN apk add --no-cache ca-certificates libstdc++ \
    && sed -i.bak '/"DoneCmd"/d' /cloud-torrent.json \
    && sed -i '15i\ \ "DoneCmd": "/usr/local/bin/rclone.sh",' /cloud-torrent.json \
    && chmod +x /usr/local/bin/rclone.sh
ENTRYPOINT ["cloud-torrent"]
