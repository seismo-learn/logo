#!/usr/bin/env bash

export SAC_DISPLAY_COPYRIGHT=0

gmt begin logo pdf
gmt meca -R-5/5/-5/5 -JX10c -Sc10c -M -Ggray -W0p << END
0 0 0 180 18 -88 0 72 -90 5.5 0 0 0
END

data=onkm.e
sac << END
dg sub tele $data
bp c 0.001 0.01
div &1,depmax
w $data
q
END
gmt sac onkm.e -JX8c/3c -R200/1600/-1/1 -W1p,red -X1c -Y1c
rm onkm.e
gmt end show
