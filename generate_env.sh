#!/bin/bash

if [ -f .env ]; then
  rm .env
fi

cp env_sample .env
