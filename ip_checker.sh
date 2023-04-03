#!/bin/bash

# Define help function
function show_help {
  echo "Usage: ./ip_checker.sh [IP_ADDRESS/FILE] [KEYWORD]"
  echo ""
  echo "Check if an IP address or list of IP addresses (in a file) contains a specified keyword in its HTTP response."
  echo ""
  echo "Examples:"
  echo "./ip_checker.sh 192.168.0.1 Tesla"
  echo "./ip_checker.sh ips.txt Tesla"
  echo ""
  echo "Options:"
  echo "-h, --help  Show this help message and exit"
}

# Show help if -h or --help flag is passed
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  show_help
  exit 0
fi

echo -e "\033[1;34mWritten by the Whalebone. Twitter: @whalebone71\033[0m"

# Define a function to check a single IP address for the keyword
function check_ip {
  IP_ADDRESS=$1
  KEYWORD=$2

  # Make a request to the IP address and check if the keyword is in the response
  if curl -s $IP_ADDRESS | grep -q "$KEYWORD"; then
    # If the keyword is found, print the IP address with "found" next to it in green
    echo -e "\033[32m$IP_ADDRESS found\033[0m"
  else
    # If the keyword is not found, print the IP address with "not found" next to it in red
    echo -e "\033[31m$IP_ADDRESS not found\033[0m"
  fi
}

# Check if the number of arguments is correct
if [[ $# -lt 2 ]]; then
  show_help
  exit 1
fi

if [ -f "$1" ]; then
  # If the first argument is a file, read each line as an IP address
  while read IP_ADDRESS; do
    check_ip "$IP_ADDRESS" "$2"
  done < "$1"
else
  # If the first argument is not a file, assume it's an IP address and check it
  check_ip "$1" "$2"
fi

