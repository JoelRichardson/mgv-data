#!/bin/bash

source utils.sh

STRAINS="strains.tsv"
RELEASE=97

while read -u 10 p; do
  IFS='   ' read -r -a array <<< "${p}"
  spath="${array[0]}" 
  if [[ ${spath} != "#"* ]] ; then
    sname="${array[1]}" 
    staxon="${array[2]}" 
    ./getGenomeFromEnsembl.sh -r ${RELEASE} -g ${spath} -n ${sname} -x ${staxon} $*
    checkExit
  fi
done 10<${STRAINS}
