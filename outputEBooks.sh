#!/bin/bash

# A utility that generates epub and mobi (TBC) documents from
# the set of files stored in the book directory
# Uses pandoc which can be installed on a mac using home brew (and cakebrew)

# Create target directory if it doesn't exist
mkdir -p target

# Concatenates the files in the blog directory in alphabetic order
# The result is a temp file used for input to the pandoc utility which generates the files
cd blog/
ls *.* | xargs cat > ../target/temp.txt

#Move to target directory
cd ../target

# Creates the epub file in the target directory
pandoc temp.txt -o DJingToDolphins.epub

# TODO: Add automated mobi generation

# Cleanup - comment the following line to keep the intermediate file for debugging
rm temp.txt

# Note there is an alternative solution which avoids the intermediate file
# but the longer version was chosen for comprehensibility
#ls | xargs cat | pandoc -o ../target/main.epub