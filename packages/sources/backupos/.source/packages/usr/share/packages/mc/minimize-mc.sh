#!/bin/sh
mc_path='/opt/mc-4.8.0-pre2-git30-04-2011'

for i in 'README' 'README.extfs'; do
	rm "${mc_path}/libexec/mc/extfs.d/${i}" &
done
rm "${mc_path}/libexec/mc/fish/README.fish" &

rm -r -f "${mc_path}/share/locale" &
rm -r -f "${mc_path}/share/man" &

for i in 'examples' 'help' 'hints'; do
	rm -r -f "${mc_path}/share/mc/${i}" &
done

mv "${mc_path}/share/mc/skins/default.ini" "${mc_path}/share/mc/default.ini"
rm ${mc_path}/share/mc/skins/*.ini
mv "${mc_path}/share/mc/default.ini" "${mc_path}/share/mc/skins/default.ini"

rm "${0}"
exit 0
