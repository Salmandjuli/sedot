#!/bin/bash

echo "Masukkan url yang akan anda sedot (Contoh : http://url_yang_akan_disedot.com/pdf/):"
read sedot

echo "Masukkan jenis file yang ingin disedot (Contoh : .pdf)"
read data

echo "Masukkan nama folder penyimpanan"
read simpan

target_folder="$simpan/`echo $sedot|sed 's/\//_/g'`"

echo "-------------------------------------"
echo "url yang akan disedot adalah : $sedot"
echo "-------------------------------------"
sleep 1
echo "Jenis file yang akan didownload adalah : $data"
echo "-------------------------------------"
sleep 1
echo "Folder penyimpanan anda adalah : $simpan"
echo "-------------------------------------"
sleep 1
echo ""
mkdir -p $target_folder

wget -e robots=off \
    -H -nd -nc -np \
    --recursive -p \
    --level=1 \
    --accept $data\
    --convert-links -N \
    --limit-rate=200k \
    --wait 1.0 \
    -P $target_folder $sedot

echo "Download selesai"
