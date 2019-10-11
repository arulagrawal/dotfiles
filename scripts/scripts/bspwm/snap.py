#!/bin/python3

# get all floating windows
import json
from os import system
from pprint import pprint


class window:
    def __init__(self, name, id, x, y, width, height):
        self.name = name
        self.id = id
        self.leftEdge = x
        self.topEdge = y
        self.rightEdge = x + width
        self.bottomEdge = y + height

    def __repr__(self):
        stri = (
            "name: "
            + self.name
            + " "
            + "id: "
            + str(self.id)
            + " "
            + "leftEdge: "
            + str(self.leftEdge)
            + " "
            + "rightEdge: "
            + str(self.rightEdge)
            + " "
            + "topEdge: "
            + str(self.topEdge)
            + " "
            + "bottomEdge: "
            + str(self.bottomEdge)
        )

        return stri


def main():
    threshhold = 30
    system("bspc query -T -m -d > /tmp/desktop.json")
    with open("/tmp/desktop.json") as desktop:
        data = json.load(desktop)
        keys = ["firstChild", "secondChild"]
        children = [child for child in getAllChildren(keys, data)]
        children = [
            child for child in children if child["client"]["state"] == "floating"
        ]
        windows = []
        for child in children:
            client = child["client"]
            name = client["className"]
            geometry = client["floatingRectangle"]
            w = window(
                name,
                child["id"],
                geometry["x"],
                geometry["y"],
                geometry["width"],
                geometry["height"],
            )
            windows.append(w)
        pprint(windows)
        for w in windows:
            for other in windows:
                topDiff = w.topEdge - other.topEdge
                if abs(topDiff) < threshhold:
                    if topDiff > 0:
                        # need to move window up
                        system("bspc node " + str(w.id) + " --move 0 " + str(-topDiff))
                leftDiff = w.leftEdge - other.leftEdge
                if abs(leftDiff) < threshhold:
                    if leftDiff > 0:
                        # need to move window up
                        system(
                            "bspc node "
                            + str(w.id)
                            + " --move "
                            + str(-leftDiff)
                            + " 0"
                        )


def getAllChildren(keys, desktop):
    for k, v in desktop.items():
        if k in keys:
            if v["firstChild"] is None:
                if v["secondChild"] is None:
                    yield v
            elif isinstance(v, dict):
                for result in getAllChildren(keys, v):
                    yield result
        elif isinstance(v, dict):
            for result in getAllChildren(keys, v):
                yield result


if __name__ == "__main__":
    main()
