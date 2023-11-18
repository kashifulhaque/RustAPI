#!/bin/bash
docker compose up -d db
docker compose build
docker compose up rustapp -d