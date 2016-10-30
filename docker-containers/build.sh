#!/bin/bash

cd php56-fpm
docker build -t simple-php56 .

cd ../php7-fpm
docker build -t simple-php7 .

cd ../mysql
docker build -t simple-percona .

cd ../memcached
docker build -t simple-memcache .
