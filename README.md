## Quick example with docker volumes

```
docker run -d --name simpletorrent \
  -p 3000:3000 \
  -v torrent.downlods:/downloads \
  -v torrent.blackhole:/torrents \
  -v rclone.config:/root/.config/rclone/ \
  themetabay/simpletorrent
```

## Example with host paths:

```
docker run -d --name simpletorrent \
  -p {external port}:3000 \
  -v /path/to/my/downloads:/downloads \
  -v /path/to/torrent/watched/dir:/torrents \
  -v /path/to/rclone/config:/root/.config/rclone/ \
  themetabay/simpletorrent
 ```
