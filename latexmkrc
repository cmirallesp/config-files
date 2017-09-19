#  this is the resource file for the tool latexmk which is a command line used to compile latex files 

# use skim instead of viewer to preview pdf
$pdf_previewer = 'open -a skim';


$pdflatex = 'pdflatex -synctex=1 %O %S';

# How the dvi viewer updates its display when  the  dvi  file  has changed.
$pdf_update_method = 0;
