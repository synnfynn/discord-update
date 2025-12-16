#!/bin/env bash

#
# Download the current version of Discord's compressed tarball.
#

DISCORD_URL='https://discord.com/api/download/stable?platform=linux&format=tar.gz'
REDIRECT_URL=$(curl ${DISCORD_URL} 2> /dev/null | awk -F "https" '{print $2}' | sed -e 's/\:\/\//https\:\/\//' -e 's/\">//')
DISCORD_GZIPD_TARBALL=$(echo ${REDIRECT_URL} | awk -F '/' '{print $7}')
DISCORD_TARBALL=$(echo ${DISCORD_GZIPD_TARBALL} | awk -F '.gz' '{print $1}')

curl -o ${DISCORD_GZIPD_TARBALL} ${REDIRECT_URL}
gunzip ${DISCORD_GZIPD_TARBALL}
tar xvf ${DISCORD_TARBALL} -C ${HOME}/bin
rm ${DISCORD_TARBALL}


