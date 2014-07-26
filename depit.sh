git pull
catsup build
git add .
git commit -a
git push
cd ../hl85.github.io/
git pull
cp -av ../openq-blog/deploy/* ../hl85.github.io/
git add .
git commit -a -m "auto publish my static blog"
git push


