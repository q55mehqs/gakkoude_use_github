#!/bin/sh

export http_proxy="http://your_proxy:port_number"
export https_proxy="https://your_proxy:port_number"

git config --global http.proxy http://your_proxy:port_number
git config --global https.proxy https://your_proxy:port_number

git config --list