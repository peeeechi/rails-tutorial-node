#!/bin/bash -eux

cd $(dirname $0)

ENV_FILE=".env"

: ${BACKEND_PORT:=3000}
: ${PASSWORD:=${USER}}

: ${POSTGRES_USER:=${USER}}
: ${POSTGRES_PASSWORD=${USER}}
: ${POSTGRES_DB:=test}
: ${POSTGRES_PORT:=5432}

# backend env value
echo "USER=${USER}"                             > ${ENV_FILE}
echo "GID=$(id -g)"                             >> ${ENV_FILE}
echo "UID=$(id -u)"                             >> ${ENV_FILE}
echo "PASSWORD=${PASSWORD}"                     >> ${ENV_FILE}
echo "BACKEND_PORT=${BACKEND_PORT}"             >> ${ENV_FILE}

# postgres env value
echo "POSTGRES_USER=${POSTGRES_USER}"           >> ${ENV_FILE}
echo "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}"   >> ${ENV_FILE}
echo "POSTGRES_DB=${POSTGRES_DB}"               >> ${ENV_FILE}
echo "POSTGRES_PORT=${POSTGRES_PORT}"           >> ${ENV_FILE}
