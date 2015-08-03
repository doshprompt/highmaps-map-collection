#!/bin/bash

# REMOTE
DOWNLOAD_URL=code.highcharts.com
DOWNLOAD_URI=mapdata

# CWD's
SCRIPT_DIR=$(cd `dirname $0`; pwd)
BASE_DIR=${SCRIPT_DIR}/..
SOURCE_DIR=${BASE_DIR}/${DOWNLOAD_URI}

# download all map files
wget -r -np -nv -A js,svg,geo.json ${DOWNLOAD_URL}/${DOWNLOAD_URI}

# keep only relevant files and/or folders
mv ${BASE_DIR}/${DOWNLOAD_URL}/${DOWNLOAD_URI} ${SOURCE_DIR}
rm -rf ${BASE_DIR}/${DOWNLOAD_URI}

# marshal files into their respective folders
cd ${SOURCE_DIR}/custom
for map_file in *{svg,js,geo.json}; do
    folder="${map_file%%.*}"
    mkdir -p "$folder"
    mv "$map_file" "$folder"
done