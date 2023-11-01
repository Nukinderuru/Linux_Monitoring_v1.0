#!/bin/bash

function topExes()
{
  echo "$(find "$1" -type f -executable -not -path '*/\.*' -exec du -h {} + | sort -hr | head -10 | awk '{\
    cmd="md5sum $2 | awk \47{ print $1 }\47"; cmd | getline md5; close(cmd); print NR" - "$2", "$1", "md5}')"
}
