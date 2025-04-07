#!/bin/bash

# File paths
NMAP_OUTPUT="nmap_scan.txt"
CSV_FILE="nmap_results.csv"
EXCEL_FILE="nmap_results.xlsx"

# Check if Nmap scan file exists
if [[ ! -f "$NMAP_OUTPUT" ]]; then
    echo "[!] Nmap output file '$NMAP_OUTPUT' not found!"
    exit 1
fi

# Create CSV with headers
echo "Hostname,IP,Port,Protocol,State,Service,Version" > "$CSV_FILE"

# Process Nmap output and extract structured data
awk '
    /^Nmap scan report for/ {
        # Case: hostname + IP
        if (match($0, /^Nmap scan report for (.+) \(([^)]+)\)/, m)) {
            hostname = m[1];
            ip = m[2];
        }
        # Case: IP only
        else {
            hostname = "";
            ip = $NF;
        }
    }
    /^[0-9]+\/(tcp|udp)/ {
        split($1, port_proto, "/");
        port = port_proto[1];
        protocol = port_proto[2];

        split($0, fields, " ");
        state = fields[2];
        service = fields[3];
        version = (length(fields) > 4) ? substr($0, index($0, fields[4])) : "";
        gsub(/^ /, "", version);  # Clean version string

        printf "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"\n", hostname, ip, port, protocol, state, service, version >> "'"$CSV_FILE"'"
    }
' "$NMAP_OUTPUT"

# Convert CSV to Excel using Python and pandas
python3 - <<EOF
import pandas as pd

csv_file = "$CSV_FILE"
excel_file = "$EXCEL_FILE"

df = pd.read_csv(csv_file, quotechar='"', dtype=str)
df.to_excel(excel_file, index=False, engine="openpyxl")

print(f"[✓] Conversion completed: {excel_file}")
EOF
