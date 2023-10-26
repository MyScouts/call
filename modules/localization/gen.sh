#!/bin/bash
set -e

# flutter pun add intl_utils
flutter pub get
flutter pub run intl_utils:generate

echo "Build Data Done !!!"