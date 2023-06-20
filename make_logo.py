#!/usr/bin/env python
import matplotlib.pyplot as plt
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
from obspy.imaging.beachball import beach

fig, ax = plt.subplots(figsize=(5, 5))
ax.set_xlim(-0.5, 0.5)
ax.set_ylim(-0.5, 0.5)
ax.set_axis_off()
ax.add_collection(
    beach([180, 18, -88], facecolor="gray", linewidth=0, width=1, xy=(0, 0), zorder=0)
)
# ax.text(0, 0, "学", fontsize="xx-large")

client = Client("IRIS")
starttime = UTCDateTime("2014-04-03T02:43:13.110") + 1000
endtime = UTCDateTime("2014-04-03T02:43:13.110") + 2400
st = client.get_waveforms(
    network="IU",
    station="HRV",
    location="00",
    channel="BH2",
    starttime=starttime,
    endtime=endtime,
)
st.filter("bandpass", freqmin=0.005, freqmax=0.01, corners=2)
st.normalize()

tr = st[0]
ax.plot(
    tr.times() / tr.times().max() / 1.2 - 0.4,
    tr.data / 4 - 0.2,
    color="black",
    linewidth=2.5,
)
fig.savefig("logo.pdf")
