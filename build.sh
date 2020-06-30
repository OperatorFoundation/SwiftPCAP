#!/usr/bin/env bash


UNAME=$( command -v uname)
case $( "${UNAME}" | tr '[:upper:]' '[:lower:]') in
  linux*)
    printf 'linux\n'
cat <<EOF > "./Sources/Clibpcap/module.modulemap"
module Clibpcap [system]
{
    requires linux
    header "/usr/include/pcap.h"
    link "/usr/lib/x86_64-linux-gnu/libpcap.so"
    export *
}
EOF
    ;;
  darwin*)
    printf 'darwin\n'
    cat <<EOF > "./Sources/Clibpcap/module.modulemap"
module Clibpcap [system]
{
    requires macos
    header "/usr/local/opt/libpcap/include/pcap.h"
    link "/usr/local/opt/libpcap/lib/libpcap.dylib"
    export *
}
EOF
    ;;
  msys*|cygwin*|mingw*)
    # or possible 'bash on windows'
    printf 'windows\n'
    exit 1
    ;;
  nt|win*)
    printf 'windows\n'
    exit 1
    ;;
  *)
    printf 'unknown\n'
    exit 1
    ;;
esac



swift package update
swift build
