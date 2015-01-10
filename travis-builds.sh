#!/bin/bash
set -ev

bundle exec middleman build
bundle exec middleman deploy
