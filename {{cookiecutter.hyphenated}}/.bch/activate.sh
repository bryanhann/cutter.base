#!/usr/bin/env bash

r=$(dirname $(dirname ${BASH_SOURCE[0]}))

export {{cookiecutter.prefix}}__root=${r}
export {{cookiecutter.prefix}}__init=${r}/.bch/activate.sh
export {{cookiecutter.prefix}}__lbin=${r}/.bch/lbin
export {{cookiecutter.prefix}}__bin=${r}/.bch/bin
export {{cookiecutter.prefix}}__lib=${r}/.bch/lib

for s in $(ls ${r}/.bch/lbin/bch*); do
     d=${HOME}/.local/bin/$(basename $s)
     [ ! -f ${d} ] && echo "[cookiecutter.dotted] linking ${s}"
     [ ! -f ${d} ] && ln -s ${s} ${d}
done

d=${r}/.bch/bin
[[ ":$PATH:" == *":${d}:"* ]] || echo "[cookiecutter.dotted] appending ${d}"
[[ ":$PATH:" == *":${d}:"* ]] || export PATH=${PATH}:${d}

source ${r}/.bch/init/init.sh

unset r
unset s
unset d
