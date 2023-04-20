#!/bin/bash

# 모든 폴더에 대해 반복
for dir in [a-z]/; do
    first_char="${dir:0:1}"
    files=$(ls files | grep -i "^$first_char")
    
    # 폴더 내 파일 이동
    for file in $files; do

        if [ -d "$dir" ]; then
            # 폴더가 이미 존재하는 경우
            mv -n "files/$file" "$dir/"
        else
            # 폴더가 존재하지 않는 경우
            mkdir "$dir"
            mv -n "files/$file" "$dir/"
        fi
    done
done
