#!/bin/sh

DOWNLOAD_DIR=.
yum update --downloadonly --downloaddir=$DOWNLOAD_DIR
