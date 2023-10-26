#!/bin/bash
set -e
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
echo "Code generate done !!!"