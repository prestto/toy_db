#!/bin/bash
cecho() {
    LB='\033[1;36m' # Light Blue
    LG='\033[1;32m' # Light Green
    YE='\033[1;33m' # Yellow

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

function launch_all {
    cecho "BL" "Running postgres & pgadmin..."
    docker-compose --project-directory . -f docker/docker-compose-postgres.yml -f docker/docker-compose-pgadmin.yml up -d
}

function launch_postgres {
    cecho "BL" "Running postgres..."
    docker-compose --project-directory . -f docker/docker-compose-postgres.yml up -d
}

function run_clean {
    cecho "BL" "Stopping containers."
    docker-compose --project-directory . -f docker/docker-compose-postgres.yml stop

    cecho "BL" "Removing containers."
    docker rm toy_db_postgresql_1 || cecho "BL" "No containers found" 
}

function run_psql {
    cecho "docker" "-> Connecting psql"
    docker exec -it toy_db_postgresql_1 psql -U pguser -d toy_db
}

function show_help {
    cecho "Help: $0 <ACTION>"
    cecho "Parameters :"
    cecho " - ACTION values :"
    cecho "   * up                            - Run postgres and pgadmin."
    cecho "   * pg                            - Run postgres only."
    cecho "   * psql                          - Run psql in the postgres container."
    cecho "   * clean                         - Remove postgres and pgadmin containers."
}

if [[ "$1" == "" ]]; then
    cecho "No arguments provided."
    show_help
    exit 1
fi

case "$1" in
up)
    launch_all
    ;;
up)
    launch_postgres
    ;;
psql)
    run_psql
    ;;
clean)
    run_clean
    ;;
*)
    show_help
    ;;
esac
