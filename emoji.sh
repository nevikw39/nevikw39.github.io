#!/usr/bin/zsh

chars=(無 指 禁 空 合 有 月 申 割 得 可 祝 祕)
emoji=(🈚 🈯 🈲 🈳 🈴 🈶 🈷 🈸 🈹 🉐 🉑 ㊗ ㊙)

for i in $(seq 0 12); do
    find ./ -not -path "./themes/*" -type f -name "*.md" | xargs sed -i "s/${chars[$i]}/${emoji[$i]}/; 1 { /^---/ { :l N; /\n---/! bl; s/${emoji[$i]}/${chars[$i]}/ } }";
done;
