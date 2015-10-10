git pull
git submodule init
git submodule update
git submodule foreach git pullgit pull
echo "finish pulling openq-blog"

#build
catsup build
echo "finish building openq-blog"

#commit blog
cd blog/
git add .
echo "finish git adding hl85.github.io"
git commit -a -m "auto publish my static blog"
echo "finish git commiting hl85.github.io"
git push
echo "finish pushing hl85.github.io"

#commit project
cd ..
git add .
echo "finish git adding openq-blog"
git commit -a -m "auto publish my static blog"
echo "finish git commiting openq-blog"
git push
echo "finish git pushing openq-blog"





