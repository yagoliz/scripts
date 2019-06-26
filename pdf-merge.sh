#!/usr/bin/bash

# Check if filename is provided
output_name=""
if [ -z "$1" ]; then
    output_name="output"
else
    output_name="$1"
fi

output_tex="$output_name.tex"
output_pdf="$output_name.pdf"

# Add the headers to the document
echo "\documentclass{article}" > $output_tex
echo "\usepackage{pdfpages}" >> $output_tex
echo "\begin{document}" >> $output_tex

# Insert all files in the document
for file in *.pdf
do
    echo "\includepdf[pages=-]{$file}" >> $output_tex
done

# End the document
echo "\end{document}" >> $output_tex

# Compilation step
pdflatex $output_tex

# Open the file
xdg-open $output_pdf
