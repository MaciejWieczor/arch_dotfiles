#!/bin/bash
LIGHT=$(light -G)
printf "%s %d%s\n" "Brightness:" "$LIGHT" "%"
