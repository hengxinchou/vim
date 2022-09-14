#!/etc/bash
this="${BASH_SOURCE-$0}"
DIR=$(cd -P -- "$(dirname -- "${this}")" >/dev/null && pwd -P)

echo $DIR

if [[ "$(diff ~/.vimrc $DIR/.vimrc |wc -l)" == "" &&  "$(diff ~/.tmux.conf $DIR/.tmux.conf |wc -l)" == "" ]];then
	echo "no changes"
	exit 0
fi

cd $DIR
cp ~/.vimrc .
cp ~/.tmux.conf .
git add .
count=`expr $(git log --pretty=oneline|wc -l) + 1`
git commit -m "commit -m $count"

git push github main
git push mayun main
