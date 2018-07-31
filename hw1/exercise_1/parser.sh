#!/usr/bin/env bash

# Tell bash to loop by line, instead of by space
IFS=$'\n'

# Loop through each line
for entry in $(@==> 1 <==@); do

    # Extract IP, we use 'grep' to validate the field
    ip=$(echo "$entry" \
        | cut -f3 -d'"' \
        | grep @==> 3 <==@)
    
    # Extract coordinates, we use 'grep' to validate the field
    location=$(echo "$entry" \
        | cut -f24 -d'"' \
        | grep '[-0-9\.]\+,[-0-9\.]\+')

    # Extract orgnization name
    org=$(@==> 4 <==@)

    # If the current entry does not match the pattern in grep
    # the corresponding variable will be empty
    if [ ! -z "$ip" ] && [ ! -z "$location" ]; then

        @==> 5 <==@

        @==> 6 <==@

    fi
done

