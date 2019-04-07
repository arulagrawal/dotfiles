rm explicit base tocheck
pacman -Qqe|sort > explicit
pacman -Qqg base base-devel|sort > base
comm -13 base explicit > tocheck
