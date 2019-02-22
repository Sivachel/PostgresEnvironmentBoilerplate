#!/bin/sh -e

cd /home/ubuntu/app

sudo gem install bundler

bundler install
