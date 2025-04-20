#! /usr/bin/bash
set -uvx
set -e
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M"`
version=$(pkgver)
comment=$1

echo $version

pubspec "$version"

cat << EOS >> CHANGELOG.md

## $version

- $comment
EOS

dos2unix pubspec.yaml
dos2unix CHANGELOG.md

./do-analyze.sh
./do-test.sh

cd $cwd
tag="native_json_api-$version"
git add .
git commit -m"native_json_api: $comment"
git tag -a "$tag" -m"$tag"
git push origin "$tag"
git push origin HEAD:main
git remote -v

dart pub publish --force
