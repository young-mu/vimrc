#!/bin/bash

# update from current snippets to vim_plugins.tar.gz

if [[ ! -d ~/.vim/snippets ]]; then
	echo "Error : no current snippets"	
	exit 1
fi

tar xzf ./vim_plugins.tar.gz
unzip -q ./vim_plugins/snipMate.zip -d ./vim_plugins/snipMate

snippets=`ls -1 ./vim_plugins/snipMate/snippets`

for snippet in ${snippets}; do
	if [[ `diff ~/.vim/snippets/${snippet} ./vim_plugins/snipMate/snippets/${snippet}` ]]; then
		cp ~/.vim/snippets/${snippet} ./vim_plugins/snipMate/snippets/${snippet}
		echo "update ${snippet}"
	fi
done

cd ./vim_plugins/snipMate
zip -rm snipMate.zip *
cd ../..
mv ./vim_plugins/snipMate/snipMate.zip ./vim_plugins 
rm -rf ./vim_plugins/snipMate
tar czf ./vim_plugins.tar.gz ./vim_plugins
rm -rf ./vim_plugins
