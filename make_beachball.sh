#!/usr/bin/env bash
#
# Plot the beachball used in the logo
#

gmt begin beachball pdf
gmt meca -R-5/5/-5/5 -JX10c -Sc10c -M -Ggray -W0p << END
0 0 0 180 18 -88 0 72 -90 5.5 0 0 0
END
gmt end show
