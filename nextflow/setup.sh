#!/bin/bash
#
# Copies the system-specific nextflow configuration file to ~/.nextflow/config
# Nextflow itself can be installed with mamba

ln -s $(pwd)/config ~/.nextflow/config
