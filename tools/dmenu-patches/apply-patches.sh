#! /bin/sh

PATCH_DIR="../dmenu-patches"

for patch in $(ls -1 $PATCH_DIR | grep -v .sh)
do
    git apply "$PATCH_DIR/$patch"
done


