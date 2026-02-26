#!/bin/bash

FS_DOMAIN= "company.freshservice.com"
FS_API_KEY= "adfjdfpjdfdjf:X"

OUTPUT_DIR="$HOME/tickets_per_shift/morning"
mkdir -p "$OUTPUT_DIR"

HOY=$(date -u +"%Y-%m-%d")
START="05:42:00"
END="13:42:00"
DOMAIN="company"
CSV_FILE="$OUTPUT_DIR/tickets_morning_${HOY}.csv"


> "$CSV_FILE"
echo "Id,Description,Status,Link" >> "$CSV_FILE"

PAGE=1
MAX_PAGES=1000

# Obtain all the tickets from this morning shift
while true; do
echo "Processing page $PAGE..."


 RESPONSE=$(curl -sS -u $FS_API_KEY:X \
 "https://$FS_DOMAIN/api/v2/tickets?updated_since=${HOY}T00:00:00Z&page=$PAGE&per_page=100")

 COUNT=$(echo "RESPONSE" | jq '.tickets | lenght') | if ["$COUNT" -eq 0]|| ["$PAGE" -gt $MAX_PAGES ] ; then break; fi

echo "$RESPONSE" | jq -r --arg start "${HOY}T$START" --arg finish "${HOY}T$END" --arg domain "$DOMAIN" '
  .tickets[]
  | select((.status) and (.created_at >= $start and .created_at <= $finish) and (.group_id | IN(230,231)))
  | [.id, .subject, (if .status==2 then "Open"
     elif .status==3 then "Pending"
     elif .status==4 then "Resolved"
     elif .status==5 then "Closed"
     else "Pending (Other)"
     end), ("https://\($domain).freshservice.com/a/tickets/\(.id)")]
  | @csv
' >> "$CSV_FILE"

 PAGE=$((PAGE+1))
done

echo "Tickets Morning exported to $CSV_FILE"





