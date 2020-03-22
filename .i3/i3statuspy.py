#!/usr/bin/python3
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
    format="🔊{volume}",
    format_muted="🔇{volume}",
    color_muted="#F92672",
    color_unmuted="#C8C8C8",)

#status.register("file",
#    format="{key_access}",
#    components={
#        "key_access": (str, "/tmp/KEY_ACCESS_GRANTED"),
#    },
#    color="#C8C8C8",)

#status.register("backlight",
#            format="☀{percentage}",
#                backlight="intel_backlight",
#                    color="#C8C8C8",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load",
    format="{avg1} {avg5} T:{tasks}",
    color="#C8C8C8",)

status.register("uptime",
    format="up {hours}:{mins}",
    alert=True,
    seconds_alert=1209600,
    color="#C8C8C8",
    color_alert="#F92672",)

status.register("uname",
    format="{release}",)

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
#status.register("battery",
#    format="{status}{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=12,
#    status={
#        "DIS": "",
#        "CHR": "⚡",
#        "FULL": "☻",
#    },
#    color="#C8C8C8",)

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
    format="💽{avail}G",
    color="#C8C8C8",
    critical_limit=15,)

status.register("cpu_usage",
    format="CPU:{usage:02}%",
    color="#C8C8C8",)

status.register("cpu_usage_graph",
    graph_width=10,
    color="#C8C8C8",
    start_color="#A6E22E",
    end_color="#F92672",
    direction="left-to-right",)

status.register("cpu_freq",
    format="Freq:{avgg}GHz",
    color="#C8C8C8",)

# Shows your CPU temperature, if you have a Intel CPU
#status.register("temp",
#    format="Temp:{temp:.1f}°C",
#    color="#C8C8C8",)

status.register("mem",
    format="Mem:{avail_mem}MiB",
    color="#C8C8C8",
    warn_percentage=50,
    alert_percentage=85,
    warn_color="#fd971f",
    alert_color="#2f343a",)

#status.register("swap",
#    format="Swp:{free}MiB",
#    color="#C8C8C8",
#    warn_percentage=70,
#    alert_percentage=85,
#    warn_color="#fd971f",
#    alert_color="#2f343a",)

status.register("amdgpu",
    format="GPU 2: {temp} {mclk} {sclk}",
    card=1,)
status.register("amdgpu",
    format="GPU 1: {temp} {mclk} {sclk}",
    card=0,)

# Displays whether a DHCP client is running
#status.register("runwatch",
#    name="DHCP",
#    path="/var/run/dhclient*.pid",)

status.register("network",
    interface="enp4s0f0",
    color_up="#A6E22E",
    color_down="#F92672",
    format_up="{interface}:{v4}",
    format_down="{interface}:DOWN",
    on_rightclick="",
    on_upscroll="",
    on_downscroll="",)

# Note: requires both netifaces and basiciw (for essid and quality)
#status.register("network",
#    interface="wlp1s0",
#    format_up="{essid}:{quality:03.0f}%",
#    format_down="{interface}:DOWN",
#    on_rightclick="",
#    on_upscroll="",
#    on_downscroll="",)

status.register("openvpn",
    format="WG",
    vpn_name="all",
    status_command="ip a s | grep wg",)

status.register("openvpn",
    format="OVPN",
    vpn_name="all",
    status_command="nmcli con | grep -i tun",)

status.register("network",
    interface="enp4s0f0",
    color_up="#A6E22E",
    color_down="#F92672",
    start_color="#A6E22E",
    end_color="#F92672",
    format_up="{interface}:▲{bytes_sent}B/{bytes_recv}B▼ {network_graph_recv}",
    format_down="{interface}:DOWN",
    ignore_interfaces=['lo','docker0','vpn0'],
    recv_limit=500.0,
    sent_limit=100.0,
    on_rightclick="",
    on_leftclick="",
    graph_width=10,)

status.register("ping",
    format="{ping}ms",
    host="8.8.8.8")

status.register("makewatch",
    format="make",
    running_color="#66D9EF",
    idle_color="#A6E22E",)

status.register("mpd",
    format="{status} {song_elapsed}/{song_length} {title}",
    host="127.0.0.1",
    port="6600",
    max_len=150,
    max_field_len=45,
    on_leftclick="switch_playpause",
    on_doubleleftclick="next_song",
    on_rightclick=["mpd_command", "stop"],
    on_doublerightclick="previous_song",
    on_middleclick=["mpd_command", "shuffle"],
    on_upscroll=["mpd_command", "seekcur -10"],
    on_downscroll=["mpd_command", "seekcur +10"],)

status.run()
