#!/bin/bash
cp prometheus-export.sh ~/prometheus-export.sh 
cd ~
wget https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz
tar xvfz node_exporter-1.10.2.linux-amd64.tar.gz
mv prometheus-export.sh node_exporter-1.10.2.linux-amd64/prometheus-export.sh
rm node_exporter-1.10.2.linux-amd64.tar.gz
cd node_exporter-1.10.2.linux-amd64
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/prometheus-export.sh") | crontab -
./node_exporter

