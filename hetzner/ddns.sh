#!/bin/bash
set -euo pipefail

# ddns.sh
# Updates a Hetzner Cloud zone rrset A record to the current public IPv4.
#
# Usage: ./ddns.sh [-t API_TOKEN] [-z ZONE_ID] [-n RRSET_NAME]
#   -t: Hetzner API token 
#   -z: Zone ID 
#   -n: RRSET name 

# Default values
API_TOKEN="Your-API-Token"
ZONE_ID="zone_ID-For_Information_look_at_the_readme"
RRSET_NAME="Record-name"

# Parse command line arguments
while getopts ":t:z:n:" opt; do
  case $opt in
    t) API_TOKEN="$OPTARG";;
    z) ZONE_ID="$OPTARG";;
    n) RRSET_NAME="$OPTARG";;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Validate required parameters
if [ "$API_TOKEN" = "Ihr-API-Token-hier" ]; then
    echo "Error: API Token is required. Use -t option or set it in the script." >&2
    exit 1
fi

# Get current public IPv4 (trim newline)
CURRENT_IPV4=$(curl -fsS https://ipv4.icanhazip.com | tr -d '\n')

if [ -z "$CURRENT_IPV4" ]; then
		echo "Failed to determine public IPv4. Exiting." >&2
		exit 1
fi

JSON_PAYLOAD=$(cat <<EOF
{"records":[{"value":"$CURRENT_IPV4","comment":""}]}
EOF
)

API_URL="https://api.hetzner.cloud/v1/zones/${ZONE_ID}/rrsets/${RRSET_NAME}/A/actions/set_records"

echo "Updating A record '$RRSET_NAME' in zone id $ZONE_ID to $CURRENT_IPV4"

curl -fsS -X POST \
	-H "Authorization: Bearer $API_TOKEN" \
	-H "Content-Type: application/json" \
	-d "$JSON_PAYLOAD" \
	"$API_URL" \
	|| { echo "API request failed" >&2; exit 2; }

echo "Update request sent." 