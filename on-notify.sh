#!/usr/bin/env bash

# Don't play sound if in DND
dnd=$(swaync-client -D)
if [ "$dnd" = "true" ]; then
    exit 0
fi

if [ "$1" = "Critical" ]; then
    # Play osu! fail sound (Swapped to hitnormal, slightly quieter)
    pw-play --volume 0.20 "/home/river/.osu/Skins/-.JesusOmega.NM.Planets.-/normal-hitnormal.wav" &
elif [ "$1" = "Normal" ]; then
    # Play osu! menu click sound (Swapped to hitfinish, slightly quieter)
    pw-play --volume 0.10 "/home/river/.osu/Skins/-.JesusOmega.NM.Planets.-/normal-hitfinish.wav" &
else
    # Low urgency: faint back/hover sound
    pw-play --volume 0.05 "/home/river/.osu/Skins/-.JesusOmega.NM.Planets.-/normal-hitsoft.wav" &
fi