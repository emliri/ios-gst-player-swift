#!/bin/sh

VERSION=1.14.2

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

mkdir -p $SCRIPTPATH/../AudioPlayer/Frameworks
cd $SCRIPTPATH/../AudioPlayer/Frameworks/
TARGETPATH=`pwd`

cd $TMPDIR

echo "📥 Downloading GStreamer $VERSION package"
curl https://gstreamer.freedesktop.org/data/pkg/ios/$VERSION/gstreamer-1.0-devel-$VERSION-ios-universal.pkg -o ./gstreamer.pkg

echo "📦 Extracting package"
pkgutil --expand ./gstreamer.pkg ./extracted

echo "📦📦 Extracting Payload of package within package"
tar xf ./extracted/ios-framework-$VERSION-universal.pkg/Payload -C $TARGETPATH

echo "✨ Cleaning up"
rm $TMPDIR/gstreamer.pkg
rm -rf $TMPDIR/extracted

rm -rf $TARGETPATH/Templates


echo "🍻 The framework is located at $TARGETPATH/GStreamer.framework"
