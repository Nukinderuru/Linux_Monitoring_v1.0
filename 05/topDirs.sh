#!/bin/bash

function topDirs()
{
  echo "$(find "$1" -type d -not -path '/\.*' -exec du -h {} + | sort -rh | head -5 | awk '{printf "%d - %s, %s\n", NR, $2, $1}' | sed -e 's:K: KB:g' | sed -e 's:M: MB:g' | sed -e 's:G: GB:g')"
}
