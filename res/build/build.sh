#!/bin/bash
TMP=.tmp

generate_pdf_pages(){
	rm -Rf $TMP
	mkdir -p $TMP
	for i in $*
	do
		if [ -f $i ]
		then
			FILENAME=$(basename $i .svg)
			echo "   converting $FILENAME..."
			inkscape -f $i --export-pdf=$TMP/$FILENAME.pdf
		fi
	done
}

join_pdf_pages(){
	OUTPUT=$1
	rm -f $OUTPUT
	echo "=> generating $OUTPUT"
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$OUTPUT $TMP/*
	chown pablo.pablo $OUTPUT
	rm -Rf $TMP
	echo
}

generate_pdf_pages ../en/*
join_pdf_pages ../Pablo.Mansilla.Ojeda.cv.en.pdf

generate_pdf_pages ../es/*
join_pdf_pages ../Pablo.Mansilla.Ojeda.cv.es.pdf
