#!/bin/bash

# Environment variables with flags
DOCKER_PATH="${DOCKER_PATH:-/}"
PROJECT_NAME="${PROJECT_NAME:-npm}"

while getopts ":p:c:" opt; do
  case $opt in
    p) DOCKER_PATH="$OPTARG";;
    c) PROJECT_NAME="$OPTARG";;
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

shift $((OPTIND - 1))

cd "$DOCKER_PATH"
docker compose -p "$PROJECT_NAME" up -d