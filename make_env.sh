#!/usr/bin/env bash

mv .git/hooks .git/hooks.old
ln -s -f ../hooks .git/hooks
