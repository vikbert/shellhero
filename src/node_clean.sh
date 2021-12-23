#!/usr/bin/env bash

npm cache clean --force
yarn cache clean
pnpm store prune
