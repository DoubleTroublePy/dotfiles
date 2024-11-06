#!/usr/bin/bash
# cempy
# script for removing empty folders
# by: dtpy

get_fn() {
  echo "cempy"
}

cempty() {
  find $1 -empty -type d -delete
}
