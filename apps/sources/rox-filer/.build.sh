#!/bin/sh
LIB_ARCH='x86_64-linux-gnu'

extract_libs()
{
	print_S1()
	{
		echo -n "$1"
	}
	print_S3()
	{
		echo -n "$3"
	}
	print_S5()
	{
		echo -n "$5"
	}

	ldd "$1" | while read line; do
		if echo $line | grep '=>' > /dev/null 2>&1; then
			echo -n $(print_S3 $line)
			if file $(print_S3 $line) | grep 'symbolic link' > /dev/null 2>&1; then
				echo -n " and $(print_S5 $(file $(print_S3 $line)))"
				cp -Lr $(print_S3 $line) $(print_S5 $(file $(print_S3 $line)))
				linkname=`print_S3 $line`; ln -s $(print_S5 $(file $(print_S3 $line))) ./${linkname##*/}
			else
				cp $(print_S3 $line) .
			fi
			echo '' # Newline
		else
			if [ -e $(print_S1 $line) ]; then
				echo $(print_S1 $line)
				cp $(print_S1 $line) .
			fi
		fi
	done
}

if [ -e ./rox-filer.tar.gz ]; then
	echo 'rox-filer tarball already exists'
	exit 1
fi
if [ ! -e /usr/bin/rox ]; then
	echo 'Install rox-filer first'
	exit 1
fi
if [ ! -e /usr/bin/file ]; then
	echo 'Install `file` utility first'
	exit 1
fi

echo -n 'Are you sure? (y/[n]) '
read answer
if [ "$answer" = 'y' ]; then
	mkdir ./.rox-filer
	cd ./.rox-filer
	mkdir ./bin ./etc ./etc/fonts ./lib ./share ./share/fonts
	cp /usr/bin/rox ./bin/rox
	cd ./bin
	ln -s rox rox-filer
	cd ..
	cp /usr/share/fonts/truetype/dejavu/* ./share/fonts
	cp -r /usr/share/mime ./share
	cp -r /usr/share/rox ./share
	cp -r /usr/lib/${LIB_ARCH}/gdk-pixbuf-2.0 ./lib
	rm ./lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
	sed -i 's\/usr/lib/'"${LIB_ARCH}"'\/tmp/.rox-filer/lib\g' ./lib/gdk-pixbuf-2.0/*/loaders.cache
	cd ./lib
	for i in 1 2 3 4 5; do
		extract_libs ../bin/rox
	done
	for i in ./gdk-pixbuf-2.0/*/loaders/*; do
		for x in 1 2 3; do
			extract_libs ${i}
		done
	done
	cd ..

### FONTCONFIG - START
cat << EOF > ./etc/fonts/fonts.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

<!-- Font directory list -->
	<!-- added for rox-filer -->
	<dir>/tmp/.rox-filer/share/fonts</dir>

	<dir>/usr/share/fonts</dir>
	<dir>/usr/X11R6/lib/X11/fonts</dir> <dir>/usr/local/share/fonts</dir>
	<dir prefix="xdg">fonts</dir>
	<dir>~/.fonts</dir>

<!--
  Ignore dpkg temporary files created in fonts directories
-->
	<selectfont>
		<rejectfont>
			<glob>*.dpkg-tmp</glob>
		</rejectfont>
	</selectfont>
	<selectfont>
		<rejectfont>
			<glob>*.dpkg-new</glob>
		</rejectfont>
	</selectfont>

<!--
  Load local system customization file
-->
	<include ignore_missing="yes">conf.d</include>

<!-- Font cache directory list -->

	<cachedir>~/.fontconfig</cachedir>

	<config>
<!--
  These are the default Unicode chars that are expected to be blank
  in fonts.  All other blank chars are assumed to be broken and
  won't appear in the resulting charsets
 -->
		<blank>
			<int>0x0020</int>	<!-- SPACE -->
			<int>0x00A0</int>	<!-- NO-BREAK SPACE -->
			<int>0x00AD</int>	<!-- SOFT HYPHEN -->
			<int>0x034F</int>	<!-- COMBINING GRAPHEME JOINER -->
			<int>0x0600</int>	<!-- ARABIC NUMBER SIGN -->
			<int>0x0601</int>	<!-- ARABIC SIGN SANAH -->
			<int>0x0602</int>	<!-- ARABIC FOOTNOTE MARKER -->
			<int>0x0603</int>	<!-- ARABIC SIGN SAFHA -->
			<int>0x06DD</int>	<!-- ARABIC END OF AYAH -->
			<int>0x070F</int>	<!-- SYRIAC ABBREVIATION MARK -->
			<int>0x115F</int>	<!-- HANGUL CHOSEONG FILLER -->
			<int>0x1160</int>	<!-- HANGUL JUNGSEONG FILLER -->
			<int>0x1680</int>	<!-- OGHAM SPACE MARK -->
			<int>0x17B4</int>	<!-- KHMER VOWEL INHERENT AQ -->
			<int>0x17B5</int>	<!-- KHMER VOWEL INHERENT AA -->
			<int>0x180E</int>	<!-- MONGOLIAN VOWEL SEPARATOR -->
			<int>0x2000</int>	<!-- EN QUAD -->
			<int>0x2001</int>	<!-- EM QUAD -->
			<int>0x2002</int>	<!-- EN SPACE -->
			<int>0x2003</int>	<!-- EM SPACE -->
			<int>0x2004</int>	<!-- THREE-PER-EM SPACE -->
			<int>0x2005</int>	<!-- FOUR-PER-EM SPACE -->
			<int>0x2006</int>	<!-- SIX-PER-EM SPACE -->
			<int>0x2007</int>	<!-- FIGURE SPACE -->
			<int>0x2008</int>	<!-- PUNCTUATION SPACE -->
			<int>0x2009</int>	<!-- THIN SPACE -->
			<int>0x200A</int>	<!-- HAIR SPACE -->
			<int>0x200B</int>	<!-- ZERO WIDTH SPACE -->
			<int>0x200C</int>	<!-- ZERO WIDTH NON-JOINER -->
			<int>0x200D</int>	<!-- ZERO WIDTH JOINER -->
			<int>0x200E</int>	<!-- LEFT-TO-RIGHT MARK -->
			<int>0x200F</int>	<!-- RIGHT-TO-LEFT MARK -->
			<int>0x2028</int>	<!-- LINE SEPARATOR -->
			<int>0x2029</int>	<!-- PARAGRAPH SEPARATOR -->
			<int>0x202A</int>	<!-- LEFT-TO-RIGHT EMBEDDING -->
			<int>0x202B</int>	<!-- RIGHT-TO-LEFT EMBEDDING -->
			<int>0x202C</int>	<!-- POP DIRECTIONAL FORMATTING -->
			<int>0x202D</int>	<!-- LEFT-TO-RIGHT OVERRIDE -->
			<int>0x202E</int>	<!-- RIGHT-TO-LEFT OVERRIDE -->
			<int>0x202F</int>	<!-- NARROW NO-BREAK SPACE -->
			<int>0x205F</int>	<!-- MEDIUM MATHEMATICAL SPACE -->
			<int>0x2060</int>	<!-- WORD JOINER -->
			<int>0x2061</int>	<!-- FUNCTION APPLICATION -->
			<int>0x2062</int>	<!-- INVISIBLE TIMES -->
			<int>0x2063</int>	<!-- INVISIBLE SEPARATOR -->
			<int>0x206A</int>	<!-- INHIBIT SYMMETRIC SWAPPING -->
			<int>0x206B</int>	<!-- ACTIVATE SYMMETRIC SWAPPING -->
			<int>0x206C</int>	<!-- INHIBIT ARABIC FORM SHAPING -->
			<int>0x206D</int>	<!-- ACTIVATE ARABIC FORM SHAPING -->
			<int>0x206E</int>	<!-- NATIONAL DIGIT SHAPES -->
			<int>0x206F</int>	<!-- NOMINAL DIGIT SHAPES -->
			<int>0x2800</int>	<!-- BRAILLE PATTERN BLANK -->
			<int>0x3000</int>	<!-- IDEOGRAPHIC SPACE -->
			<int>0x3164</int>	<!-- HANGUL FILLER -->
			<int>0xFEFF</int>	<!-- ZERO WIDTH NO-BREAK SPACE -->
			<int>0xFFA0</int>	<!-- HALFWIDTH HANGUL FILLER -->
			<int>0xFFF9</int>	<!-- INTERLINEAR ANNOTATION ANCHOR -->
			<int>0xFFFA</int>	<!-- INTERLINEAR ANNOTATION SEPARATOR -->
			<int>0xFFFB</int>	<!-- INTERLINEAR ANNOTATION TERMINATOR -->
		</blank>
<!--
  Rescan configuration every 30 seconds when FcFontSetList is called
 -->
		<rescan>
			<int>30</int>
		</rescan>
	</config>

</fontconfig>

EOF
### FONTCONFIG - END

	cd ..
	tar cvf rox-filer.tar .rox-filer
	gzip -9 rox-filer.tar
	rm -r -f .rox-filer
fi

exit 0
