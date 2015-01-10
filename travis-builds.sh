#!/bin/bash
set -ev

git checkout master

bundle exec middleman build
bundle exec middleman deploy
