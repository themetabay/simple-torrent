FROM alpine
COPY --from=boypt/cloud-torrent /usr/local/bin/cloud-torrent /usr/local/bin/cloud-torrent
COPY --from=rayou/rclone / /
COPY rclone.sh /usr/local/bin/rclone.sh
RUN apk add --no-cache ca-certificates \
    sed -i.bak '/"DoneCmd"/d' /cloud-torrent.json \
    sed -i '15i\ \ "DoneCmd": "/usr/local/bin/rclone.sh",' /cloud-torrent.json \
    chmod +x /usr/local/bin/rclone.sh
ENTRYPOINT ["cloud-torrent"]
