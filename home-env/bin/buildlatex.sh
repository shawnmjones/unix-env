#!/bin/bash

texfile="${@: -1}" #Get last parameter passed from shell
texfilestem=`echo $texfile | sed 's/.tex//g'`
pdffile=`echo $texfile | sed 's/.tex/.pdf/g'`

echo "----STARTING RUN----"

working=`echo $PWD | md5`
working="$HOME/Unsynced-Projects/LaTeX-Output/$working"

if [ ! -d $working ]; then
    mkdir -p $working
    # TODO: what if it exists, but is not a directory?
fi

starting="$PWD"

echo "starting directory: $starting"
echo "working directory for LaTeX/BibTeX output: $working"
echo "expecting output file in $pdffile"
echo "Building $texfile"

echo "clearing output directory"
rm $working/{*.aux,*.log,*.out,*.pdf,*.synctex.gz,*.bib}

echo "rsync -anv ${starting}/ ${working}"
rsync -av "${starting}/" "${working}"

cd "${working}"

pdflatex --file-line-error -shell-escape --synctex=1 ${texfile}
status=$?

if [ $status == 0 ]; then

    echo "==="
    echo "First LaTeX run successful, moving to BibTeX"
    bibtex ${texfilestem}
    status=$?
    echo "status was $status"

    if [ $status == 0 ]; then

        echo "==="
        echo "BibTeX run successful, moving to second LaTeX run"
        pdflatex --file-line-error -shell-escape --synctex=1 ${texfile}
        status=$?

        if [ $status == 0 ]; then

            echo "==="
            echo "BibTeX run successful, moving to third LaTeX run"
            pdflatex --file-line-error -shell-escape --synctex=1 ${texfile}
            status=$?

            if [ $status != 0 ]; then
                echo "ERROR in third LaTeX run"
                exit $status
            fi

        else

            echo "ERROR in second LaTeX run"
            exit $status

        fi

    else

        echo "ERROR in BibTeX run"
        exit $status

    fi

else
    echo "ERROR in first LaTeX run"
    exit $status
fi

cd "${starting}"
cp "${working}/${pdffile}" .

echo "PDF should be in ${pdffile}"


echo "----FINISHED RUN----"
