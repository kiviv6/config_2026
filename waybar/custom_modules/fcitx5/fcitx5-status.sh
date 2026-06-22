#!/bin/bash
layout=$(fcitx5-remote -n)

case "$layout" in 
  "keyboard-us") echo "🇺🇲 EN" ;;
  "hangul") echo "🇰🇷 KR" ;;
  "pinyin") echo "🇨🇳 CN" ;;
  "keyboard-dk") echo "🇩🇰 DK" ;;
  *) echo "$layout" ;;
esac
