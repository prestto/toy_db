#!/bin/bash
cecho() {
    LB='\033[1;36m'    # Light Blue
    LG='\033[1;32m'    # Light Green
    YE='\033[1;33m'    # Yellow

    # print normally if no second arg added
    if [[ $2 == "" ]]; then
        echo $1
        return
    fi

    case $1 in
    BL)
        printf "$LB%s\033[0m\n" "$2" # Light Cyan
        ;;
    GR)
        printf "$LG%s\033[0m\n" "$2" # Light green
        ;;
    YE)
        printf "$YE%s\033[0m\n" "$2" # Light green
        ;;
    normal | *)
        echo $2 # Light Purple
        ;;
    esac
}

function launch_postgres {
    cecho "BL" "Hello, world!"

}


function show_help {
        echo "Help: $0 <ACTION>"
        echo "Parameters :"
        echo " - ACTION values :"
        echo "   * up                            - Run postgres and pgadmin."
}

if [[ "$1" == "" ]]; then
   echo "No arguments provided."
   show_help
   exit 1
fi

case "$1" in
        up)
                launch_postgres
                ;;
        *)
                show_help
                ;;
esac