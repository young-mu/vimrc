#!/bin/bash

# update from current snippets to vim_plugins.tar.gz

if [[ ! -d ~/.vim/snippets ]]; then
    echo "Error : no current snippets"
    exit 1
fi

tar xzf ./vim_plugins.tar.gz
unzip -q ./vim_plugins/snipMate.zip -d ./vim_plugins/snipMate

snippets=`ls -1 ~/.vim/snippets`

for snippet in ${snippets}; do
    diff ~/.vim/snippets/${snippet} ./vim_plugins/snipMate/snippets/${snippet} &> /dev/null
    ret=`echo $?`
    if [[ ${ret} -eq 1 ]]; then
        cp ~/.vim/snippets/${snippet} ./vim_plugins/snipMate/snippets/${snippet}
        echo "update ${snippet}"
    elif [[ ${ret} -eq 2 ]]; then
        cp ~/.vim/snippets/${snippet} ./vim_plugins/snipMate/snippets/${snippet}
        echo "add ${snippet}"
    fi
done

cd ./vim_plugins/snipMate
zip -rmq snipMate.zip *
cd ../..
mv ./vim_plugins/snipMate/snipMate.zip ./vim_plugins
rm -rf ./vim_plugins/snipMate
tar czf ./vim_plugins.tar.gz ./vim_plugins
rm -rf ./vim_plugins
