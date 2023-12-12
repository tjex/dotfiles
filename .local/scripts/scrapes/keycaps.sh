#!/usr/bin/env zsh

if /usr/bin/curl "https://keygem.com/products/gazzew-u4tx-10pcs?_pos=5&_sid=c09c61649&_ss=r&variant=43756068995340" |\
    /opt/homebrew/bin/rg -i "Sold out</button>"; then
    # html attribute found, still sold out
    /usr/bin/curl -d "gazzew u4tx RBG keycaps are back in stock \n
    product link: https://keygem.com/products/gazzew-u4tx-10pcs?_pos=5&_sid=c09c61649&_ss=r&variant=43756068995340" \
    rpi.local/scrapes
else
    /usr/bin/curl -d "gazzew u4tx RBG keycaps are back in stock \n
    product link: https://keygem.com/products/gazzew-u4tx-10pcs?_pos=5&_sid=c09c61649&_ss=r&variant=43756068995340" \
    rpi.local/scrapes

fi

echo "cron ran ~/.local/scripts/scrapes/keycaps.sh successfully" >> ~/.cache/tjex/cron.log
