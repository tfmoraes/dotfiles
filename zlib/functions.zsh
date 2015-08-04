wiki() {
    dig +short txt $1.wp.dg.cx;
}

resize_images(){
	for i in *;
	do
		convert $i -resize $1 $2/$i;
	done
}

suspend_baloo(){
	qdbus org.kde.baloo.file /indexer suspend
}

resume_baloo(){
	qdbus org.kde.baloo.file /indexer resume
}

serve() {
    python -m SimpleHTTPServer
}

svg2pdf(){
    inkscape -D -A ${1%.*}.pdf --export-margin=5 $1
}


clean_firefox(){

    for F in $(find . -type f -name '*.sqlite' -print)
    do
        echo $F
        sqlite3 $F "VACUUM; analyze"
    done
    echo -e "done!"
}
