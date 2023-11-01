#!/bin/bash

topFiles()
{
  result=$(find "$1" -type f -not -path '*/\.*' -exec du -h {} + | sort -hr | head -10 | awk 'BEGIN{i=1}{tp=split($2, type, ".") ; printf "%d - %s, %s, %s\n", i, $2, $1, type[tp]; i++}' | sed -e 's:K: KB:g' | sed -e 's:M: MB:g' | sed -e 's:G: GB:g')
  echo "$result"
}
