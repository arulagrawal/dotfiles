#!/usr/bin/env python3

import json
from os import system


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

    def move(self, dx, dy):
        system("bspc node {} --move {} {}".format(str(self.id), dx, dy))

    def moveVerti(self, dy):
        self.move(0, dy)
        self.topEdge -= dy
        self.bottomEdge -= dy

    def moveHori(self, dx):
        self.move(dx, 0)
        self.leftEdge += dx
        self.rightEdge += dx


class desktop:
    def __init__(self, threshold, gapSize):
        self.windows = self.getWindows()
        self.threshold = threshold
        self.gapSize = gapSize

    def getWindows(self):
        windows = []
        system("bspc query -T -m -d > /tmp/desktop.json")
        with open("/tmp/desktop.json") as desktop:
            data = json.load(desktop)
            keys = ["firstChild", "secondChild"]
            children = [child for child in getAllChildren(keys, data)]
            # only consider floating windows
            children = [c for c in children if c["client"]["state"] == "floating"]
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
        return windows

    def alignWindows(self):
        for w in self.windows:
            for other in self.windows:
                topDiff = w.topEdge - other.topEdge
                if abs(topDiff) < self.threshold:
                    if topDiff > 0:
                        # need to move window up
                        w.moveVerti(-topDiff)
                leftDiff = w.leftEdge - other.leftEdge
                if abs(leftDiff) < self.threshold:
                    if leftDiff > 0:
                        # need to move window left
                        w.moveHori(-leftDiff)

    def fixGaps(self):
        for w in self.windows:
            for other in self.windows:
                horiGap = w.leftEdge - other.rightEdge
                if abs(horiGap) < 2 * self.gapSize:
                    w.moveHori(self.gapSize - horiGap)
                vertGap = w.bottomEdge - other.topEdge
                if abs(vertGap) < 1.5 * self.gapSize:
                    other.moveVerti(w.bottomEdge + self.gapSize - other.topEdge)


def main():
    threshold = 30
    gapSize = 20
    desk = desktop(threshold, gapSize)
    desk.alignWindows()
    desk.fixGaps()


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
