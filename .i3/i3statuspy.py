#!/usr/bin/python3.5
# coding=utf-8
from i3pystatus import Status

status = Status(logfile='/home/atrost/.i3/i3pystatus.log')

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %X KW%V",
    color="#C8C8C8",)

#status.register("weather",
#    format="{current_temp}(▼{min_temp}/{max_temp}▲),{current_wind}",
#    interval=120,
#    colorize=True,
#    location_code="GMXX2538",)

# Shows pulseaudio default sink volume
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
            format="♪{volume}",
                color_unmuted="#C8C8C8",)

status.register("backlight",
            format="☀{percentage}",
                backlight="intel_backlight",
                    color="#C8C8C8",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load",
    format="{avg1} {avg5} T:{tasks}",
    color="#C8C8C8",)

# The battery monitor has many formatting options, see README for details
# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register("battery",
    format="{status}{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=10,
    status={
        "DIS": "",
        "CHR": "⚡",
        "FULL": "☻",
    },
    color="#C8C8C8",)

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
#    format="{status} {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS":  "Discharging",
#        "CHR":  "Charging",
#        "FULL": "Bat full",
#    },
#    color="#C8C8C8",)

# Shows disk usage of /
# Format: 42/128G [86G]
status.register("disk",
    path="/",
    format="⛁{avail}G",
    color="#C8C8C8",
    critical_limit=15,)

status.register("cpu_usage",
    format="CPU:{usage:02}%",
    color="#C8C8C8",)

status.register("cpu_freq",
    format="Freq:{avgg}GHz",
    color="#C8C8C8",)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="Temp:{temp:.1f}°C",
    color="#C8C8C8",)

status.register("mem",
    format="Mem:{avail_mem}MiB",)

# Displays whether a DHCP client is running
#status.register("runwatch",
#    name="DHCP",
#    path="/var/run/dhclient*.pid",)

status.register("network",
    interface="eno1",
    format_up="{interface}:{v4}",
    on_rightclick="",
    on_upscroll="",
    on_downscroll="",)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp2s0",
    format_up="{essid} {quality:03.0f}%",
    on_rightclick="",
    on_upscroll="",
    on_downscroll="",)

status.register("openvpn",
    format="VPN",
    vpn_name="all",
    status_command="nmcli con | grep -i tun",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
#    format="{title}{status}{album}",
#    status={
#        "pause": "▷",
#        "play": "▶",
#        "stop": "◾",
#    },)

status.register("network",
    interface="eno1",
    format_up="{interface}:{kbs}KB/s(▲{bytes_sent}B/{bytes_recv}B▼)",
    ignore_interfaces=['lo','docker0','vpn0'],
    recv_limit=500.0,
    sent_limit=100.0,
    on_rightclick="",
    on_leftclick="",)

status.run()
