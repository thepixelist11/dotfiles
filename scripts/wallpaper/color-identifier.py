#!/usr/bin/env python3

import math
import sys

colors = {
    "yellow": (255, 255, 0),
    "green": (0, 255, 0),
    "blue": (0, 0, 255),
    "purple": (200, 0, 200),
    "red": (255, 0, 0),
    "white": (255, 255, 255),
    "cyan": (0, 255, 255),
}


def get_stdin():
    ret = ""
    for line in sys.stdin:
        if "Exit" == line.rstrip():
            break
        ret += line
    return ret


def closest_color(r, g, b):
    min_distance = float("inf")
    closest = None

    for color_name, (r_c, g_c, b_c) in colors.items():
        distance = math.sqrt((r - r_c) ** 2 + (g - g_c) ** 2 + (b - b_c) ** 2)

        if distance < min_distance:
            min_distance = distance
            closest = color_name

    return closest


color = tuple(get_stdin().replace("\n", "").split(","))
color = tuple(map(int, color))

print(closest_color(*color))
