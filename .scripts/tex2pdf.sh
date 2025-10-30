#latex
function tex2pdf() {
  DIR=`mktemp -d`; 
  pdflatex "--output-directory=$DIR" $1; 
  mv "$DIR/"*pdf .
}
