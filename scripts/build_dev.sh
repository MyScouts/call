#!/bin/bash
set -e

echo "CLEAN DEPENS !!!"
cd $(pwd)/scripts && sh clean.sh

echo "CLEAN POD !!!"
cd $(pwd)/ios  &&  pod deintegrate && pod install

echo "BUILD ANDROID !!!"
flutter build  apk --target lib/main_dev.dart