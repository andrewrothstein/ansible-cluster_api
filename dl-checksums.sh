#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/kubernetes-sigs/cluster-api/releases/download
APP=clusterctl

# https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.4.1/clusterctl-linux-amd64

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local dotexe=${4:-""}
    local platform="${os}-${arch}"
    local lfile="$DIR/${APP}-${ver}-${platform}${dotexe}"
    local url="$MIRROR/v${ver}/${APP}-${platform}${dotexe}"
    if [ ! -e $lfile ]
    then
        curl -sSLf -o $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver ()
{
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux ppc64le
    dl $ver windows amd64 .exe
}

dl_ver ${1:-1.9.4}
