git pull
git submodule init
git submodule update
git submodule foreach git pullgit pull

#build
catsup build

#commit blog
cd blog/
git add .
git commit -a -m "auto publish my static blog"
git push

#commit project
cd ..
git add .
git commit -a -m "auto publish my static blog"
git push





