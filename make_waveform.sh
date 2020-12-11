#!/usr/bin/env bash
#
# Plot the waveform used in the logo
#
export SAC_DISPLAY_COPYRIGHT=0
data=onkm.e
sac << END
dg sub tele $data
bp c 0.001 0.01
div &1,depmax
w $data
q
END
gmt begin waveform pdf
gmt sac onkm.e -JX8c/3c -R200/1600/-1/1 -W1p,red
gmt end show
rm onkm.e
