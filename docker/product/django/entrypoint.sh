#!/bin/bash

echo "Starting Guinicorn in $PWD"

exec gunicorn \
    --chdir autoregion \
    --bind 0.0.0.0:8001 \
    --workers 3 \
    autoregion.wsgi:application
