#!/bin/bash

curl 'https://cloud.weeeopen.it/remote.php/dav/files/bce04512-80444ddd-a79a1843-b790a9f5/Weeelab/log.txt' \
  --user bce04512-80444ddd-a79a1843-b790a9f5:ccQaA-6iXRR-f2xnS-3Bf9X-ZLkK3 \
  2> /dev/null | grep '\] \[INLAB\]' | wc -l

