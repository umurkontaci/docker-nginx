#!/bin/bash

set -eu

indir="${1}"
outdir="${2}"

function template_files() {
    find "${indir}" \
        -mindepth 1 \
        -maxdepth 1 \
        -name '*.tmpl'
}

mkdir -p "${outdir}"
echo Template Files:
echo $(template_files)
template_files | xargs substitute-env-vars.sh "${outdir}"
