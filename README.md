# BrightnessControl
Stupid simple script to control easy control brightness on my laptop.

# Why?!

On my laptop (it's acer swift sf314-42) i can't control brightness via xbacklight, i should do it by changing `/sys/class/backlight/amdgpu_bl0/brightness`.

# How to install?

Just made script executable and move it to bin dir isn't enough, to access `/sys` you should have permissions. I allow to execute `sudo tee + /sys/path/to/brighntess` w/o password in visudo. Yeah, this is stupid way, but it works fine.
