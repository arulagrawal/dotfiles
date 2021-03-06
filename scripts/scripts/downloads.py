#!/usr/bin/env python3
from pathlib import Path

types = {
    "images": ["png", "jpg", "jpeg", "bmp", "gif"],
    "docs": ["docx", "xlsx", "pdf", "mom"],
    "archives": ["gz", "tar", "zip", "7z", "rar", "bz2", "xz"],
    "software": ["exe", "dmg", "app"],
    "videos": ["mkv", "mp4"],
    "music": ["mp3", "flac", "aac"],
    "torrents": ["torrent"],
    "web": ["html", "css", "scss", "js"],
    "programs": ["sh", "go", "py", "c", "cpp", "pl"],
    "vmstuff": ["iso", "vdi", "ova"],
}


def main():
    home = Path.home()
    dl = home / "Downloads"
    misc = dl / "misc"
    files = get_files(dl)

    for f in files:
        for key, value in types.items():
            if f.suffix[1:] in value:
                if not Path(dl / key).exists():
                    Path(dl / key).mkdir()
                f.replace(dl / key / f.name)
                break
        else:
            if not misc.exists():
                misc.mkdir()
            f.replace(misc / f.name)


def get_files(folder):
    files = [
        f
        for f in folder.iterdir()
        if f.is_file() and f.name != ".DS_Store" and f.suffix != ".part"
    ]
    apps = [d for d in folder.iterdir() if d.name.endswith(".app")]
    folders = [
        f
        for f in folder.iterdir()
        if f.name not in types.keys() and f.name != "misc" and f.is_dir()
    ]
    return files + apps + folders


if __name__ == "__main__":
    main()
