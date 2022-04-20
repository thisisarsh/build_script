#!/bin/bash

echo "Building in process..."

firstline=$(head -n 1 source/changelog.md)

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}

echo "version " $version

echo 'Would you like to continue? "1" for yes, "0" for no'
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo 'Proceeeding with the build...'
  for file in source/*
  do
    if [ "$file" == "source/secretinfo.md" ]
    then
      echo "Not copying" $file
    else
      echo "Copying" $file
      cp $file build/.
    fi
  done
  cd build/
  echo "Build version $version contains:"
  ls
  cd ..
else
  echo "Build stopped"
fi