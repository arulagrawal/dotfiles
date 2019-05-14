#!/usr/bin/python3
from os import listdir, rename
from os.path import isfile, join, splitext

archives = ["zip", "tgz", "rar", "7z", "xz", "gz"]
documents = ["pdf", "mom", "docx"]
images = ["png", "jpeg", "jpg"]


def getFiles(path):
    files = [f for f in listdir(path) if isfile(join(path, f))]
    return files


def moveToFolder(path, folder, file):
    rename(path + file, path + folder + "/" + file)


def archive(path, file):
    moveToFolder(path, "archives", file)


def document(path, file):
    moveToFolder(path, "documents", file)


def image(path, file):
    moveToFolder(path, "images", file)


def misc(path, file):
    moveToFolder(path, "misc", file)


def main():
    path = "/home/arul/Downloads/"
    files = getFiles(path)
    for file in files:
        extension = splitext(file)[1][1:]
        if extension in archives:
            archive(path, file)
        elif extension in documents:
            document(path, file)
        elif extension in images:
            image(path, file)
        else:
            misc(path, file)


if __name__ == "__main__":
    main()
