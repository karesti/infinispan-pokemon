#!/usr/bin/env bash
set -e

status=0
for f in data/*.json
do 
  curl -u user:user -XPOST --data-binary @${f}  -H "Content-Type: application/json; charset=UTF-8"  http://127.0.0.1:8080/rest/pokemon/$(basename $f .json)
  let status=status+1
  echo  "Imported $f (total $status pokemons)"
done
