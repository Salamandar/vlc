#!/bin/bash

SRCROOT="$1"

echo '/* Automatically generated file - DO NOT EDIT */'

echo 'static const char psz_license[] ='
sed 's/"/\\"/g;s/^.*$/\"&\\n\"/' "${SRCROOT}/COPYING"
echo ';'
echo ''
echo 'static const char psz_thanks[] ='
sed 's/"/\\"/g;s/^.*$/\"&\\n\"/' "${SRCROOT}/THANKS"
echo ';'
echo ''
echo 'static const char psz_authors[] ='
sed 's/"/\\"/g;s/^.*$/\"&\\n\"/' "${SRCROOT}/AUTHORS"
echo ';'
