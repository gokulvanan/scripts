#!/bin/bash -e

find -iname '*~' | xargs -P2 -n10 rm