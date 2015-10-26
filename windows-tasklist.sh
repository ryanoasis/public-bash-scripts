#!/bin/bash

echo 'tasklist, show high memory usage tasks'

# this could be useful in use with Samurize

tasklist /FI "MEMUSAGE gt 100000"