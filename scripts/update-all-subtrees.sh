#!/bin/bash

# git log에서 subtree 명령어들을 추출
subtree_info=$(git log --grep="git-subtree-dir:" --pretty=format:"%b" | grep "git-subtree-\(dir\|remote\|branch\):" | sort -u)

# 각 서브트리에 대해 처리
while read -r dir_line; do
    # subtree 디렉토리 경로 추출
    prefix=$(echo "$dir_line" | sed 's/git-subtree-dir: //')
    
    # 해당 prefix에 대한 remote와 branch 정보 찾기
    remote=$(echo "$subtree_info" | grep "git-subtree-remote: .*$prefix" | sed 's/git-subtree-remote: //')
    branch=$(echo "$subtree_info" | grep "git-subtree-branch: .*$prefix" | sed 's/git-subtree-branch: //')
    
    if [ -n "$remote" ] && [ -n "$branch" ]; then
        echo "Updating: $prefix"
        git subtree pull --prefix="$prefix" "$remote" "$branch" --squash
    fi
done < <(echo "$subtree_info" | grep "git-subtree-dir:" | sort -u)

echo "All subtrees have been updated"
