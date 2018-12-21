#!/bin/bash
set -e

USERNAME=${USERNAME:-rsync}
PASSWORD=${PASSWORD:-rsync}
  echo "root:$PASSWORD" | chpasswd
  cat /etc/passwd | grep ${USER_NAME} >/dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "${USERNAME}:${PASSWORD}" | chpasswd -c SHA512
else
adduser $USERNAME --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "${USERNAME}:${PASSWORD}" | chpasswd -c SHA512
fi
 mkdir -p $VOLUME
 chown -R ${USERNAME}:${USERNAME} $VOLUME
usermod -d $VOLUME -s /bin/bash ${USERNAME}

    if [ -e "/root/.ssh/authorized_keys" ]; then
        chmod 400 /root/.ssh/authorized_keys
        chown root:root /root/.ssh/authorized_keys
    fi
    exec /usr/sbin/sshd 

exec "$@"
