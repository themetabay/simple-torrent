#!/bin/sh
UP="${CLD_DIR}/${CLD_PATH}"
rclone copy "${UP}" gdrive:/media/sync
