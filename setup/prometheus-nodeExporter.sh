#!/bin/bash
cp prometheus-export.sh ~/prometheus-export.sh 
cd ~
wget https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz
tar xvfz node_exporter-1.10.2.linux-amd64.tar.gz
mv prometheus-export.sh node_exporter-1.10.2.linux-amd64/prometheus-export.sh
cd node_exporter-1.10.2.linux-amd64
./node_exporter

