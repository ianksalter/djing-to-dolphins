#!/bin/bash

# A utility that generates epub and pdf documents from
# the set of files stored in the book directory
# Uses pandoc which can be installed on a mac using home brew (and cakebrew)
# Note pdf generation also requires the full MacTex download which takes
# forever.

# Create target directory if it doesn't exist
mkdir -p target

# Concatenates the files in the book directory in alphabetic order
# The result is a temp file used for input to the pandoc utility which generates the files
cd book/
ls *.* | xargs cat > ../target/temp.txt

#Move to target directory
cd ../target

# Creates the epub file in the target directory
pandoc temp.txt -o DJingToDolphins.epub

# Creates the pdf file in the target directory
# note it needs xelatex to work which can be
# downloaded from http://www.tug.org/ look for BasicTeX.pkg
pandoc temp.txt --pdf-engine=xelatex -o DJingToDolphins.pdf

# Cleanup - comment the folowing line to keep the intermediate file for debugging
rm temp.txt

# Note there is an alternative solution which avoids the intermediate file
# but the longer version was chosen for comprehensability
#ls | xargs cat | pandoc -o ../target/main.epub