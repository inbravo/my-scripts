#!/usr/bin/env bash
# Update Homebrew, upgrade all packages, and clean up old versions
brew update
brew upgrade
brew cleanup
brew doctor
