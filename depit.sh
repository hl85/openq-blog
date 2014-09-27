git pull
git submodule init
git submodule update
cd themes/puresam
git pull
git add .
git commit -m"submodule update"
cd ../..
echo "finish pulling openq-blog"
rm -R deploy
catsup build
echo "finish building openq-blog"
git add .
echo "finish git adding openq-blog"
git commit -a -m "auto publish my static blog"
echo "finish git commiting openq-blog"
git push
echo "finish git pushing openq-blog"

cd ../hl85.github.io/
echo "cd ../hl85.github.io/"
git pull
echo "finish pulling hl85.github.io"
cp -Rav ../openq-blog/deploy/* ../hl85.github.io/
echo "finish movie hl85.github.io"
git add .
echo "finish git adding hl85.github.io"
git commit -a -m "auto publish my static blog"
echo "finish git commiting hl85.github.io"
git push
echo "finish pushing hl85.github.io"


