#!/bin/bash

doit(){
	OUTPUT=$1
	INPUT=$2
	rm -f $OUTPUT
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$OUTPUT $INPUT
	chown pablo.pablo $OUTPUT
}

doit ../Pablo.Mansilla.Ojeda.cv.es.pdf "es/page*.pdf"
doit ../Pablo.Mansilla.Ojeda.cv.en.pdf "en/page*.pdf"
