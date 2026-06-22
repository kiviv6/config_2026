#!/usr/bin/env bash

MAX_LEN=30

playerctl --follow metadata --format '{{markup_escape(title)}}|{{markup_escape(artist)}}' 2>/dev/null | while IFS='|' read -r title artist; do
    title=$(echo "$title" | xargs)
    artist=$(echo "$artist" | xargs)

    if [ -z "$title" ] && [ -z "$artist" ]; then
        echo '{"text": "", "tooltip": ""}'
        continue
    fi

    if [ -z "$artist" ]; then
        full_string="$title"
    else
        full_string="$title - $artist"
    fi
    
    # Bestem den korte tekst til selve baren
    if [ ${#full_string} -le $MAX_LEN ]; then
        short_string="$full_string"
    elif [ ${#title} -le $MAX_LEN ]; then
        short_string="$title"
    else
        short_string="${title:0:$((MAX_LEN - 3))}..."
    fi

    # Output som JSON til Waybar
    printf '{"text": "%s", "tooltip": "%s"}\n' "$short_string" "$full_string"
done
