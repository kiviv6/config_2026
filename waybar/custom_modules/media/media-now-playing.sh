#!/usr/bin/env bash

# Use --follow to push updates instantly instead of polling
# Use {{markup_escape(...)}} to prevent Pango parsing errors from special characters
playerctl --follow metadata --format '{{markup_escape(title)}} - {{markup_escape(artist)}}' 2>/dev/null | while read -r line; do
    # Truncate long lines to prevent bar overflow (optional)
    if [ ${#line} -gt 50 ]; then
        echo "${line:0:47}..."
    else
        echo "$line"
    fi
done   
