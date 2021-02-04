#!/usr/bin/env bash
#
# Plot the waveform used in the logo
#

# download SAC data format in .zip bundle for the event
# 20140403T02:43:13.110Z, -20.5709, -70.4931, 22.4, KILOMETER, 7.7, mww
wget -q "https://service.iris.edu/fdsnws/dataselect/1/query?net=IU&sta=HRV&loc=00&cha=BH2&start=2014-04-03T02:43:13.110&end=2014-04-03T03:43:13.110&format=sac.zip" -O IU.HRV.00.BH2.SAC.zip

# extract and rename SAC data
unzip -q IU.HRV.00.BH2.SAC.zip
mv IU.HRV.00.BH2.M.2014.093.024313.SAC IU.HRV.00.BH2.SAC

export SAC_DISPLAY_COPYRIGHT=0
sac << END
r IU.HRV.00.BH2.SAC
bp c 0.005 0.01
div &1,depmax
w over
q
END

gmt begin waveform pdf
gmt sac IU.HRV.00.BH2.SAC -JX8c/3c -R1000/2400/-1/1 -W2p,black
gmt end show

rm IU.HRV.00.BH2.SAC.zip IU.HRV.00.BH2.SAC

