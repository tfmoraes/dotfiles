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

latex2epub(){
    latexml --dest=$1.xml $1.tex
    latexmlpost -dest=$1.html $1.xml
    ebook-convert $1.html $1.epub --language en --no-default-epub-cover
}

latex2epub(){
    latexml --dest=$1.xml $1.tex
    latexmlpost -dest=$1.html $1.xml
    ebook-convert $1.html $1.mobi --language en
}


take_maps_screenshot(){
    chromium-browser --headless --screenshot --download-whole-document --disable-gpu --virtual-time-budget=20000 --window-size=3133,1483 http://200.144.114.144/screenshot
}

take_maps_screenshot_cut(){
    chromium-browser --headless --screenshot --download-whole-document --disable-gpu --virtual-time-budget=20000 --window-size=3133,1483 http://200.144.114.144/screenshot
    mogrify -crop 2046x1483+291+0 screenshot.png
}

rgb2grayscale(){
    convert $1 -set colorspace Gray -separate -average $2
}

httpserve(){
    python3 -m http.server 8000
}
