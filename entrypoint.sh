#!/bin/bash
set -e

USERNAME=${USERNAME:-rsync}
PASSWORD=${PASSWORD:-rsync}
  echo "root:$PASSWORD" | chpasswd
  echo "$USERNAME:$PASSWORD" | chpasswd
 mkdir -p $VOLUME
 chown -R ${USERNAME}:${USERNAME} $VOLUME
usermod -d $VOLUME -s /bin/bash ${USERNAME}

    if [ -e "/root/.ssh/authorized_keys" ]; then
        chmod 400 /root/.ssh/authorized_keys
        chown root:root /root/.ssh/authorized_keys
    fi
    exec /usr/sbin/sshd &

exec "$@"
