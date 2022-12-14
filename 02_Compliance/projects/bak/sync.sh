#!/bin/bash
rsync -av --delete . root@192.168.119.128:/var/lib/awx/projects/ctbc_2022_poc/
ssh root@192.168.119.128 "chown -R awx:awx /var/lib/awx/projects/ctbc_2022_poc/"
