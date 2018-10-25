#!/bin/bash

echo "Starting Guinicorn in $PWD"

exec gunicorn \
    --chdir autoregion \
    --bind 0.0.0.0:8000 \
    --workers 1 \
    autoregion.wsgi:application
